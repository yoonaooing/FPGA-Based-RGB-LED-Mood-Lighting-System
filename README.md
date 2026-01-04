# FPGA-Based-RGB-LED-Mood-Lighting-System
(Digital Systems Design and Lab Project)

## 📌 Project Overview
This project implements an **FPGA-based RGB LED mood lighting system** that allows users to create various lighting effects by independently controlling the brightness of Red, Green, and Blue LEDs.

The system uses **PWM (Pulse Width Modulation)** to control LED brightness in discrete levels, enabling smooth and intuitive color mixing. Users can select colors and adjust brightness through hardware buttons and switches, while the current state is displayed via a 7-segment display.

---

## 🎯 Key Features
- Independent brightness control for **R / G / B LEDs**
- **5-level brightness control** (Level 0 ~ 4)
- Supports:
  - Single color mode (1 Color)
  - Dual color mixing (2 Color)
  - Full RGB mixing (3 Color)
- Brightness adjustment using push buttons
- Real-time visual feedback using **7-segment display**
- Fully synchronous FPGA-based digital design

---

## 🛠️ System Architecture
<img width="800" height="500" alt="image" src="https://github.com/user-attachments/assets/a27fc964-0494-448d-9c27-84fb505b9b99" />

### Brightness Control Method
- **PWM (Pulse Width Modulation)** is used to control LED brightness
- Brightness is determined by the **duty cycle**
  - Higher duty cycle → brighter LED
  - Lower duty cycle → dimmer LED
- Brightness levels are generated using a **ROM-based duty cycle lookup table**

---

## 🎛️ User Inputs
- **RGB Selection Switch (`sw_rgb[2:0]`)**
  - `sw_rgb[0]` → Red
  - `sw_rgb[1]` → Green
  - `sw_rgb[2]` → Blue
- **Push Buttons**
  - `btn_up`   : Increase brightness
  - `btn_down` : Decrease brightness
- **Reset**
  - Initializes all RGB brightness levels to 0

---

## 💡 Outputs
- RGB LED (PWM-controlled)
- 7-Segment Display  
  - Displays selected color and brightness level (0–4)

---

## 🧩 Module Description

### Data Path Modules
- **PWM_counter**  
  Generates PWM signals by comparing the counter value with the duty cycle value.

- **counter_20ms**  
  Provides a stable time base for PWM period control.

- **ROM_n**  
  Converts brightness level (0–4) into predefined duty cycle values.

- **Main_led_brightness_control_PWM**  
  Integrates PWM logic to drive RGB LEDs based on selected brightness levels.

- **Seg7_ascii**  
  Converts brightness and color information into 7-segment display signals.

---

### Control Path Modules
- **Top_button**  
  Handles user button inputs for brightness adjustment.

- **Selection_counter**  
  Tracks the currently selected RGB color channel.

- **Top_pwm_control**  
  Controls brightness updates and PWM duty cycle assignment.

- **top_debounce / sm_debounce**  
  Removes mechanical noise from push button inputs.

- **Synchronizer**  
  Synchronizes asynchronous inputs to the system clock.

- **lev_puls_conv**  
  Converts level signals into single-cycle pulse signals for reliable control.

---

## 🔁 Finite State Machine (FSM)

| State | Description |
|------|------------|
| INIT | Initialize RGB brightness to 0 |
| COLOR_SELECT | Select R / G / B channel |
| BRIGHT_UP | Increase selected color brightness |
| BRIGHT_DOWN | Decrease selected color brightness |
| UPDATE_PWM | Update PWM duty cycle using ROM |

---

## 👩‍💻 Contributors
- **Yoona Oh, Jiyoon Kim** – Block Design & Testbench  
