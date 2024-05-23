# Triangle and Square Printer in MIPS Assembly

## Overview

This repository contains a MIPS Assembly program that prints a right-angled isosceles triangle and a square, both with sides of length 8, using asterisks (`*`). The program is designed to be run in the QTSpim simulator.

## Program Description

The program consists of two main procedures:

1. **printTriangle**: Prints a right-angled isosceles triangle with a side length of 8.
2. **printSquare**: Prints a square with a side length of 8.

Each procedure is called from the `main` function, and the output is displayed in the console.

### `main` Function

- Sets the side length to 8.
- Calls the `printTriangle` procedure.
- Calls the `printSquare` procedure.
- Exits the program.

### `printTriangle` Procedure

- Uses nested loops to print each row of the triangle.
- The outer loop iterates over each row.
- The inner loop prints the correct number of asterisks for the current row.
- After completing each row, it prints a newline character.

### `printSquare` Procedure

- Uses nested loops to print each row of the square.
- The outer loop iterates over each row.
- The inner loop prints 8 asterisks for each row.
- After completing each row, it prints a newline character.

## Requirements

- QTSpim simulator to run the MIPS Assembly code.

## How to Run

1. Load the program into QTSpim.
2. Assemble the program.
3. Run the program to see the triangle and square printed in the console.

## Expected Output

```
*
**
***
****
*****
******
*******
********
********
********
********
********
********
********
********
********
```
