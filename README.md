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
| Splash Screen | Login Screen | Signup Screen | Forget Password Screen |
| :--: | :--: | :--: | :--: |
| ![splash-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/dad5f6bb-522f-4312-99c4-ab413ae5bcc1) | ![login-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/7b1603cd-2eab-440f-9d3c-882459e59dab) | ![signup-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/44876c36-f4f1-4ccf-b116-31f2252661ae) | ![forget-password-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/41fc82f8-ec9c-4477-ac88-a1af4a75597f) |

| Dashboard Screen | Heart Rate Screen | Steps Screen | Profile Screen |
| :--: | :--: | :--: | :--: |
| ![dashboard-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/20fe4ee9-2a15-4f11-a391-6c6be8ef4755) | ![heart-rate-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/cd9480bf-87f4-4b47-adc0-c4bd08efa26c) | ![steps-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/855f3bc7-c2ed-45cc-85cb-9b0434d10712) | ![profile-screen](https://github.com/MohitKumar-personal/WellWisher/assets/99556620/6f8d2f23-da87-420a-b503-9cddf6ad85fe) |
