# Verilog

This project includes Verilog files located in the `src` folder.

### Development Tools

For this project, we used **VSCode** along with the [**Lushay Code**](https://github.com/lushaylabs/lushay-code) extension to provide great support for the [**Tang Nano 9K FPGA**](https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-9K/Nano-9K.html), which is the hardware used in this project.

Before starting, ensure that your system meets the [**requirements of Lushay Code**](https://github.com/lushaylabs/lushay-code?tab=readme-ov-file#requirements).

### Build and Flashing Instructions

Once the requirements are met, you can use the following `make` commands to build and load the project:

- **Build the project**:  
  Run the following command to compile the Verilog code and generate the output file `out/verilog.fs`:

  ```bash
  make
  ```

- **Load into SRAM (volatile)**:  
  Use this command to load the built project into the FPGA's SRAM for development purposes. Changes will be lost upon power cycle:

  ```bash
  make load
  ```

- **Flash into non-volatile FLASH**:  
  Use this command to load the build into the FPGA's non-volatile FLASH memory, which is ideal for production as it retains data even after a reboot:

  ```bash
  make flash
  ```
