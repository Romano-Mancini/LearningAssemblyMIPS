# Simple Combinations Calculator in MIPS Assembly

## Overview

This repository contains a MIPS Assembly program that calculates the number of simple combinations (combinations without repetition) for given values of `n` and `k`. The program is designed to be run in the QTSpim simulator.

## Program Description

In combinatorial mathematics, a simple combination (without repetition) refers to a selection of elements from a set where the order of selection does not matter and elements cannot be repeated. Given `n` distinct elements and a positive integer `k` (where `k ≤ n`), the number of possible simple combinations `C(n, k)` is given by the formula:
\[ C(n, k) = \frac{n!}{k!(n-k)!} \]

The program includes the following main components:

1. **main**: The main function that initializes values for `n` and `k`, calls the `simple_combinations` procedure, and outputs the result.
2. **simple_combinations**: A procedure to calculate the number of simple combinations for the given `n` and `k`.

### `main` Function

- Initializes `n` and `k`.
- Calls the `simple_combinations` procedure.
- Outputs the result.
- Exits the program.

### `simple_combinations` Procedure

- Calculates the factorial of `n` and `(n-k)`.
- Calculates the factorial of `k`.
- Divides the factorial of `n` by the product of the factorials of `k` and `(n-k)` to get the result.
- Returns the result in register `$v0`.

### Requirements

- QTSpim simulator to run the MIPS Assembly code.

### How to Run

1. Load the program into QTSpim.
2. Assemble the program.
3. Run the program to see the number of combinations printed in the console.

### Examples

- For n = 6 and k = 3, the output will be 20.
- For n = 12 and k = 2, the output will be 66.
