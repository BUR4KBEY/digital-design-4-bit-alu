# 4-Bit Arithmetic Logic Unit (ALU)

This project involves constructing a 4-bit Arithmetic Logic Unit (ALU) using logic gates as part of a digital design course.

## Circuit Design

All bits are **unsigned**.

### **Inputs:**

- **2-Bit Screen Selector:** Determines the data displayed on the screen.
- **3-Bit Opcode:** Specifies the operation to be performed.
- **4-Bit Input A:** First operand.
- **4-Bit Input B:** Second operand.
- **1-Bit Carry In:** Input carry for arithmetic operations.

### **Outputs:**

- **8-Bit Result:** The outcome of the selected operation.
- **1-Bit Carry Out:** Output carry, indicating overflow or carry in arithmetic operations.

### Preview

<details>
<summary>Click to expand and view images of the real-life circuit.</summary>
<br>

![Image](https://github.com/user-attachments/assets/fb795441-ea56-4582-bc8b-2ec2ffcd8e00)

![Image](https://github.com/user-attachments/assets/9feb117e-b3ef-4213-85f7-06339f2816a4)

</details>

<details>
<summary>Click to expand and view the circuit schematic.</summary>
<br>

![Image](https://github.com/user-attachments/assets/60cdd84c-c657-4d45-a461-6b66d7bfc560)

You can also [**click here**](https://pro.easyeda.com/editor#id=4cae9a3f96a4493094537c6ea8ca6a45) to view the schematic in **EasyEDA**.

</details>

## Screen Selector Table

The 2-bit screen selector determines what is displayed on the screen:

| **Screen Selector** | **Displayed Data** |
| ------------------- | ------------------ |
| 00                  | Opcode             |
| 01                  | Input A            |
| 10                  | Input B            |
| 11                  | Result             |

## Opcode Table

The table below describes the operations performed by the ALU based on the 3-bit opcode:

| **Opcode** | **Operation**  | **Result Bits** | **Carry In/Out Usage** |
| ---------- | -------------- | :-------------: | :--------------------: |
| 000        | Addition       |        4        |           ✅           |
| 001        | Subtraction    |        4        |           ✅           |
| 010        | Multiplication |        8        |           ❌           |
| 011        | AND            |        4        |           ❌           |
| 100        | OR             |        4        |           ❌           |
| 101        | XOR            |        4        |           ❌           |
| 110        | ❌             |       ❌        |           ❌           |
| 111        | ❌             |       ❌        |           ❌           |
