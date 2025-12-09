       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUADRATIC-ROOTS.
       AUTHOR. COBOL Developer.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       DATA DIVISION.
       FILE SECTION.
       
       WORKING-STORAGE SECTION.
       01 WS-A                    PIC S9(5)V9(4).
       01 WS-B                    PIC S9(5)V9(4).
       01 WS-C                    PIC S9(5)V9(4).
       01 WS-DISCRIMINANT         PIC S9(10)V9(4).
       01 WS-SQRT-DISCRIMINANT    PIC 9(10)V9(6).
       01 WS-ROOT1                PIC S9(5)V9(4).
       01 WS-ROOT2                PIC S9(5)V9(4).
       01 WS-NUMERATOR1           PIC S9(10)V9(4).
       01 WS-NUMERATOR2           PIC S9(10)V9(4).
       01 WS-DENOMINATOR          PIC S9(5)V9(4).
       01 WS-TEMP                 PIC 9(10)V9(6).
       01 WS-STATUS               PIC 9(1) VALUE 0.
       01 WS-CHOICE               PIC 9(1).
       01 WS-ANOTHER              PIC X(1).
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM UNTIL WS-ANOTHER = 'N' OR WS-ANOTHER = 'n'
               PERFORM GET-COEFFICIENTS
               PERFORM CALCULATE-DISCRIMINANT
               
               IF WS-DISCRIMINANT > 0
                   PERFORM TWO-REAL-ROOTS
               ELSE IF WS-DISCRIMINANT = 0
                   PERFORM ONE-ROOT
               ELSE
                   PERFORM COMPLEX-ROOTS
               END-IF
               END-IF
               
               DISPLAY " "
               DISPLAY "Do you want to calculate another quadratic "
               DISPLAY "equation? (Y/N): "
               ACCEPT WS-ANOTHER
           END-PERFORM.
           
           DISPLAY " "
           DISPLAY "Thank you for using Quadratic Equation Solver!"
           STOP RUN.
       
       GET-COEFFICIENTS.
           DISPLAY " ".
           DISPLAY "===== QUADRATIC EQUATION SOLVER =====".
           DISPLAY "For equation: ax^2 + bx + c = 0".
           DISPLAY " ".
           DISPLAY "Enter coefficient a: "
           ACCEPT WS-A.
           DISPLAY "Enter coefficient b: "
           ACCEPT WS-B.
           DISPLAY "Enter coefficient c: "
           ACCEPT WS-C.
           
           IF WS-A = 0
               DISPLAY " "
               DISPLAY "ERROR: 'a' cannot be zero for a quadratic"
               DISPLAY "equation. Please try again."
               PERFORM GET-COEFFICIENTS
           END-IF.
       
       CALCULATE-DISCRIMINANT.
           COMPUTE WS-TEMP = WS-B * WS-B.
           COMPUTE WS-DISCRIMINANT = WS-TEMP - (4 * WS-A * WS-C).
       
       TWO-REAL-ROOTS.
           DISPLAY " ".
           DISPLAY "Discriminant = " WS-DISCRIMINANT.
           DISPLAY "The equation has two distinct real roots."
           DISPLAY " ".
           
           PERFORM CALCULATE-SQUARE-ROOT.
           
           COMPUTE WS-NUMERATOR1 = -WS-B + WS-SQRT-DISCRIMINANT.
           COMPUTE WS-NUMERATOR2 = -WS-B - WS-SQRT-DISCRIMINANT.
           COMPUTE WS-DENOMINATOR = 2 * WS-A.
           
           COMPUTE WS-ROOT1 = WS-NUMERATOR1 / WS-DENOMINATOR.
           COMPUTE WS-ROOT2 = WS-NUMERATOR2 / WS-DENOMINATOR.
           
           DISPLAY "Root 1 (x1) = " WS-ROOT1.
           DISPLAY "Root 2 (x2) = " WS-ROOT2.
       
       ONE-ROOT.
           DISPLAY " ".
           DISPLAY "Discriminant = 0".
           DISPLAY "The equation has one repeated real root."
           DISPLAY " ".
           
           COMPUTE WS-DENOMINATOR = 2 * WS-A.
           COMPUTE WS-ROOT1 = -WS-B / WS-DENOMINATOR.
           
           DISPLAY "Root (x) = " WS-ROOT1.
       
       COMPLEX-ROOTS.
           DISPLAY " ".
           DISPLAY "Discriminant = " WS-DISCRIMINANT.
           DISPLAY "The equation has two complex conjugate roots."
           DISPLAY " ".
           
           PERFORM CALCULATE-SQUARE-ROOT.
           
           COMPUTE WS-NUMERATOR1 = -WS-B.
           COMPUTE WS-DENOMINATOR = 2 * WS-A.
           
           DISPLAY "Root 1 (x1) = " WS-NUMERATOR1 / WS-DENOMINATOR
               " + " WS-SQRT-DISCRIMINANT / WS-DENOMINATOR "i".
           DISPLAY "Root 2 (x2) = " WS-NUMERATOR1 / WS-DENOMINATOR
               " - " WS-SQRT-DISCRIMINANT / WS-DENOMINATOR "i".
       
       CALCULATE-SQUARE-ROOT.
           MOVE WS-DISCRIMINANT TO WS-TEMP.
           IF WS-TEMP < 0
               COMPUTE WS-TEMP = -WS-TEMP
           END-IF.
           COMPUTE WS-SQRT-DISCRIMINANT = 
               FUNCTION SQRT(WS-TEMP).
