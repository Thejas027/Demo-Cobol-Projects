# Quadratic Equation Roots Solver - COBOL Project

## Overview
This COBOL project calculates the roots of a quadratic equation in the standard form:
```
ax² + bx + c = 0
```

## Features
- **User Input**: Accepts coefficients (a, b, c) from the user
- **Discriminant Calculation**: Computes the discriminant (b² - 4ac)
- **Three Cases**:
  - **Two Distinct Real Roots**: When discriminant > 0
  - **One Repeated Real Root**: When discriminant = 0
  - **Two Complex Conjugate Roots**: When discriminant < 0
- **Interactive Loop**: Allows multiple calculations without restarting
- **Input Validation**: Ensures coefficient 'a' is not zero

## Program Structure

### IDENTIFICATION DIVISION
- Program name: `QUADRATIC-ROOTS`
- Identifies the main program and author

### DATA DIVISION
Defines variables for:
- Coefficients (a, b, c)
- Intermediate calculations (discriminant, square root)
- Results (root1, root2)
- Control flow variables

### PROCEDURE DIVISION
Main sections:
- **MAIN-PROCEDURE**: Controls program flow and user interaction loop
- **GET-COEFFICIENTS**: Prompts user for input with validation
- **CALCULATE-DISCRIMINANT**: Computes b² - 4ac
- **TWO-REAL-ROOTS**: Handles discriminant > 0 case
- **ONE-ROOT**: Handles discriminant = 0 case
- **COMPLEX-ROOTS**: Handles discriminant < 0 case
- **CALCULATE-SQUARE-ROOT**: Computes square root of discriminant

## Usage

### Compilation
Using GnuCOBOL:
```bash
cobc -x src/QUADRATIC.cbl -o bin/QUADRATIC
```

### Running
```bash
./bin/QUADRATIC
```

### Example Session
```
===== QUADRATIC EQUATION SOLVER =====
For equation: ax^2 + bx + c = 0

Enter coefficient a: 1
Enter coefficient b: -5
Enter coefficient c: 6

Discriminant = 1
The equation has two distinct real roots.

Root 1 (x1) = 3
Root 2 (x2) = 2

Do you want to calculate another quadratic equation? (Y/N): n

Thank you for using Quadratic Equation Solver!
```

## Mathematical Background

### Quadratic Formula
$$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$$

### Discriminant (Δ)
$$\Delta = b^2 - 4ac$$

- If Δ > 0: Two distinct real roots
- If Δ = 0: One repeated real root
- If Δ < 0: Two complex conjugate roots

## Requirements
- GnuCOBOL compiler or compatible COBOL implementation
- Terminal/Console for user interaction

## Notes
- Coefficient 'a' must be non-zero (enforced by validation)
- Results are displayed with decimal precision
- Complex roots are displayed in the form (x ± yi)
