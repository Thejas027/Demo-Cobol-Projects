# GCD of Two Numbers

This project calculates the Greatest Common Divisor (GCD) of two integers using the Euclidean algorithm.

## Prerequisites

- GnuCOBOL (cobc)

## precise Compilation and Execution

1.  **Compile**:
    ```bash
    cobc -x src/GCD.cbl -o bin/GCD
    ```
    *(Note: You may need to create the `bin` directory first: `mkdir bin`)*

2.  **Run**:
    ```bash
    ./bin/GCD
    ```

## Usage

The program will prompt you to enter two integers. After entering them, it will display their GCD.

Example:
```
Enter first number: 48
Enter second number: 18
GCD is: 6
```
