# Smart Irrigation System for Garden Plants

## Overview

This project presents a Smart Irrigation System designed for garden plants. The system intelligently determines the ideal irrigation time based on real-time moisture and temperature levels around the plant. By doing so, it efficiently utilizes water resources while ensuring the plant's needs are met.

## Hardware Components

- **Arduino Uno**: Utilized to convert analog values from soil and temperature sensors into digital data.
- **FPGA DE-10 Lite Board**: Controls the water pump operation based on sensor data and displays moisture and temperature levels.
- **Breadboard**: Provides a platform for circuit connections.
- **6 VDC Water Pump**: Used for watering the plants.
- **9 Volts Battery**: Powers the system.
- **Temperature Sensor**: Measures temperature.
- **Soil Sensor**: Measures soil moisture.
- **Jumper Wires**: Used for electrical connections.
- **Pump Hose**: Transports water to the plants.

## System Operation

The system operates in the following manner:

1. Arduino Uno reads sensor values and converts them into digital data.
2. Digital data, including temperature (in Centigrade) and moisture readings, are transmitted to the FPGA board.
3. The FPGA board controls the water pump based on these values.
4. Three 7-segment displays on the FPGA board are used to display moisture and temperature levels:
   - The first two digits display the temperature in Centigrade.
   - The third digit displays the moisture level (ranging from 0 to 7, where 0 indicates high moisture and 7 indicates low moisture).

## Installation

To set up the Smart Watering System, follow these steps:

1. **Hardware Assembly**:
   - Connect the Arduino Uno, sensors, and water pump as per the provided circuit diagram.
   - Ensure all connections are secure.

2. **Software Installation**:
   - Load the provided Arduino code `Arduino File.ino` into the Arduino Uno.
   - Implement the VHDL code `MyProject.vhd` on the FPGA board.
   - Ensure all libraries and configurations are correctly set.

3. **Power Supply**:
   - Connect a 9V battery to power the system.

4. **Testing**:
   - Observe the 7-segment displays for temperature and moisture readings.
   - Verify that the water pump operates based on sensor data.

## Code Details

The project consists of two main parts:

**1. Arduino Code:**
   - Initializes variables and pins.
   - Reads sensor values.
   - Converts temperature to Celsius.
   - Converts temperature and moisture readings to binary.
   - Outputs data to pins connected to the FPGA board.

**2. VHDL Code:**
   - Utilizes libraries and entities.
   - Displays temperature unit digit on the first 7-segment display.
   - Displays temperature tenth digit on the second 7-segment display.
   - Displays moisture level (0-7) on the third 7-segment display.
   - Adjusts the water pump operation based on temperature and moisture levels.
   - Ends the architecture.

## Results

The system was tested under various conditions:

**Case 1:** Temperature reading was 37°C, and moisture reading was 6 (suboptimal).
- **Result 1:** The pump operated.

**Case 2:** Temperature reading was 25°C, and moisture reading was 6 (suboptimal).
- **Result 2:** The pump operated.

**Case 3:** Temperature reading was 39°C, and moisture reading was 3 (suboptimal).
- **Result 3:** The pump operated.

**Case 4:** Temperature reading was 26°C, and moisture reading was 1 (optimal).
- **Result 4:** The pump did not operate.

**Conclusion:** The system successfully operated the water pump when either the temperature, moisture, or both were suboptimal. It did not operate when these conditions were optimal, demonstrating efficient plant care.

Feel free to use this project in your portfolio, and ensure you include the relevant code files and documentation.
