# Wifi Configuration
from wifi_manager import WifiManager
wm = WifiManager()
wm.connect()


#firebase example
import ufirebase as firebase
firebase.setURL("https://wellwisher-01-default-rtdb.asia-southeast1.firebasedatabase.app/")

#MAX30102 sensor configuration
from max30102 import MAX30102, MAX30105_PULSE_AMP_MEDIUM
from machine import sleep, SoftI2C, Pin, Timer 
from utime import ticks_diff, ticks_us

led = Pin(2, Pin.OUT)

MAX_HISTORY = 16
history = []
beats_history = []
beat = False
beats = 0
    
i2c = SoftI2C(sda=Pin(32),scl=Pin(33),freq=400000)
sensor = MAX30102(i2c=i2c)  # An I2C instance is required

# Scan I2C bus to ensure that the sensor is connected
if sensor.i2c_address not in i2c.scan():
    print("Sensor not found.")
elif not (sensor.check_part_id()):
    # Check that the targeted sensor is compatible
    print("I2C device ID not corresponding to MAX30102 or MAX30105.")
else:
    print("Sensor connected and recognized.")

# It's possible to set up the sensor at once with the setup_sensor() method.
# If no parameters are supplied, the default config is loaded:
# Led mode: 2 (RED + IR)
# ADC range: 16384
# Sample rate: 400 Hz
# Led power: maximum (50.0mA - Presence detection of ~12 inch)
# Averaged samples: 8
# pulse width: 411
print("Setting up sensor with default configuration.", '\n')
sensor.setup_sensor()
# It is also possible to tune the configuration parameters one by one.
# Set the sample rate to 400: 400 samples/s are collected by the sensor
sensor.set_sample_rate(400)
# Set the number of samples to be averaged per each reading
sensor.set_fifo_average(8)
# Set LED brightness to a medium value
sensor.set_active_leds_amplitude(MAX30105_PULSE_AMP_MEDIUM)
sensor.set_led_mode(2)
sleep(1)



t_start = ticks_us()  # Starting time of the acquisition   

def get_max30102_values():
    while True:
        global history
        global beats_history
        global beat
        global beats
        global t_start

        sensor.check()
        
        # Check if the storage contains available samples
        if sensor.available():
            # Access the storage FIFO and gather the readings (integers)
            red_reading = sensor.pop_red_from_storage()
            ir_reading = sensor.pop_ir_from_storage()
            
            value = red_reading
            history.append(value)
            # Get the tail, up to MAX_HISTORY length
            history = history[-MAX_HISTORY:]
            minima = 0
            maxima = 0
            threshold_on = 0
            threshold_off = 0

            minima, maxima = min(history), max(history)

            threshold_on = (minima + maxima * 3) // 4   # 3/4
            threshold_off = (minima + maxima) // 2      # 1/2
            
            
            if value > 1000:
                if not beat and value > threshold_on:
                    beat = True 
                                    
                    led.on()
                    
                    t_us = ticks_diff(ticks_us(), t_start)
                    t_s = t_us/1000000
                    f = 1/t_s
                
                    bpm = f * 60
                    
                    if bpm < 500:
                        t_start = ticks_us()
                        beats_history.append(bpm)                    
                        beats_history = beats_history[-MAX_HISTORY:] 
                        beats = round(sum(beats_history)/len(beats_history) ,2)  
                                        
                if beat and value< threshold_off:
                    beat = False
                    led.off()
                
            else:
                led.off()
                beats = 0

#MPU9250 Steps take configuration
import machine
import time
import math

num_steps = 0
prev_z = 0
prev_y = 0
prev_x = 0

# I2C address of MPU9250
MPU9250_ADDR = 0x68
# MPU9250 registers
MPU9250_ACCEL_XOUT_H = 0x3B
# configure I2C bus
i2csteps = SoftI2C(sda=Pin(21),scl=Pin(22))

def read_accel():
    data = i2csteps.readfrom_mem(MPU9250_ADDR, MPU9250_ACCEL_XOUT_H, 6)
    ax = (data[0] << 8) | data[1]
    ay = (data[2] << 8) | data[3]
    az = (data[4] << 8) | data[5]
    ax = twos_complement(ax) / 16384.0
    ay = twos_complement(ay) / 16384.0
    az = twos_complement(az) / 16384.0
    return ax, ay, az

def twos_complement(val, bits=16):
    if val & (1 << (bits - 1)):
        val = val - (1 << bits)
    return val

def calculate_steps():
    global num_steps, prev_z, prev_y, prev_x

    # Read the accelerometer data
    ax, ay, az = read_accel()
    
    # Calculate the current orientation of the sensor
    curr_x = math.atan2(ay, math.sqrt(ax**2 + az**2))
    curr_y = math.atan2(ax, math.sqrt(ay**2 + az**2))
    curr_z = math.atan2(math.sqrt(ax**2 + ay**2), az)
    
    # Detect changes in orientation along the X-axis
    if (prev_x < 0 and curr_x >= 0):
        num_steps += 1
        
    # Detect changes in orientation along the Y-axis
    if (prev_y < 0 and curr_y >= 0):
        num_steps += 1
        
    # Detect changes in orientation along the Z-axis
    if (prev_z < 0 and curr_z >= 0):
        num_steps += 1
    
    # Store the previous orientation
    prev_x = curr_x
    prev_y = curr_y
    prev_z = curr_z

    return num_steps     

import _thread    
lock=_thread.allocate_lock()
_thread.start_new_thread(get_max30102_values, ())

while True:    
    try:
        #print(beats)
        number_of_steps = calculate_steps()
        lock.acquire()
        firebase.put("Values",{"BPM": beats, "Steps": number_of_steps}, bg=0)
        lock.release()
    except Exception as e:
        print(e)
