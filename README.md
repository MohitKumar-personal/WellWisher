# WellWisher
Our project “WellWisher - Fitness Tracking Insight” focuses on creating a wearable health monitoring system that accurately measures key health metrics such as heart rate, body temperature, and physical activity. Utilizing components like the ESP32 microcontroller, MAX30102 heart rate sensor, MPU9250 accelerometer sensor, and Wi-Fi module for data transmission to Firebase, we developed a mobile app using Flutter framework for data visualization and analysis. Following the Agile SDLC model ensured flexibility and responsiveness, overcoming challenges like sensor program merging and Firebase connectivity issues. Future enhancements include adding sleep monitoring, female period tracking, SpO2 level monitoring, and implementing a recommendation system based on historical data, along with improving movement detection using machine learning algorithms for activity categorization.

---

### Objectives

- To Develop a functional prototype of a wearable band, integrating essential sensors to ensure accurate health data of the user.
- To develop a dedicated mobile application, With enhanced user experience with diverse profile views & improved dashboard.
- To obtain the reliability and precision of the hardware device with benchmarking.

---

### Downloading and Flashing the MicroPython Firmware on ESP32

- Downloading MicroPython Firmware ([https://micropython.org/download/ESP32_GENERIC/](https://micropython.org/download/ESP32_GENERIC/)) File, which is shown in bin.
- Connect your ESP32 board to your computer.
- Open Thonny IDE. Go to **Tools > Options > Interpreter**.
- Select the interpreter you want to use accordingly to the board you’re using and select the COM port your board is connected to. Finally, click on the link **Install or update firmware**.
- Select the port once again, and then click on the **Browse** button to open the **.bin** file with the firmware you’ve downloaded on the previous step. Select the options as shown in the picture below and finally click on **Install**.
- Hold on the Reset button on your esp32 board.
- After a few seconds, the installation should be completed.
- ([https://randomnerdtutorials.com/getting-started-thonny-micropython-python-ide-esp32-esp8266/](https://randomnerdtutorials.com/getting-started-thonny-micropython-python-ide-esp32-esp8266/))

---

## Hardware Installation

- Just put all Hardware_module files into the ESP32 via thonny.
- Now just reset and connect your wifi with it and the program will be started.

---

## Software Installation

To clone and run this app, you'll need [Git](https://git-scm.com/downloads) and [Flutter](https://flutter.dev/docs/get-started/install) installed on your computer. From your command line:

### Clone this repository

```python
$ git clone https://github.com…..
```

### Go into the repository

```python
$ cd version1
```

### Install packages

```python
$ flutter packages get
```

### Run the app

```python
$ flutter run
```

## Screenshots of Mobile App UI

![Splash Screen](README%209ba2bc9739f24a08b6ad0d11fd52f154/ccb92f5a-c671-4ee0-aca4-78624f63f00a.png)

Splash Screen

![*Signup Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/e98aab91-b313-4ac8-8211-a9d52214f916.png)

*Signup Screen*

![*Login Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/2c9187be-4da2-46af-93de-2bf8dcc7c841.png)

*Login Screen*

![*Forget Password Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/ced67184-b48c-4846-a455-356db53d3ed9.png)

*Forget Password Screen*

![*Dashboard Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/fc724e04-73da-4956-89b3-09ed60647a15.png)

*Dashboard Screen*

![ *Heart Rate Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/7321a6a6-d714-424b-8981-29af13f2a7be.png)

 *Heart Rate Screen*

![*Steps Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/94ae3fbf-9e5c-461e-8879-a9e6e002e2bd.png)

*Steps Screen*

![*Profile Screen*](README%209ba2bc9739f24a08b6ad0d11fd52f154/6123328f-5763-406f-bf7a-914ded933313.png)

*Profile Screen*