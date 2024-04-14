# Wifi Configuration
from wifi_manager import WifiManager
wm = WifiManager()
wm.connect()

# Google Sheet Configuration 
from ggsheet import MicroGoogleSheet
# Google Sheet Credential 
google_sheet_url = "https://docs.google.com/spreadsheets/d/1lSWDAn3s9cMCgq8WEEKGNvahQ5Kq02dPz0kzT_3ygDw/edit#gid=0"
google_sheet_name = "Sheet1"
google_app_deployment_id = "AKfycbwNDlaFD6xwoAQZjKmizRYWP3HUNwRbWWn903gyGT0KebcrN0yS6J87-uKoMFIn2Ga3"

# Create Instance 
ggsheet = MicroGoogleSheet(google_sheet_url,google_sheet_name)
ggsheet.set_DeploymentID(google_app_deployment_id)

# create the Google App Script file (not necessary if it already exists).
ggsheet.gen_scriptFile()

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
i2c = machine.I2C(sda=machine.Pin(21), scl=machine.Pin(22))

def read_accel():
    data = i2c.readfrom_mem(MPU9250_ADDR, MPU9250_ACCEL_XOUT_H, 6)
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

while True:
    number_of_steps = calculate_steps()
    # Update the data to a specific cell (Row,Column,Data)
    ggsheet.updateCell(1,3,number_of_steps)
    #print(number_of_steps)
    time.sleep(1)


