       IDENTIFICATION DIVISION.
       PROGRAM-ID. GCD.
       AUTHOR. COBOL Developer.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       DATA DIVISION.
       FILE SECTION.
       
       WORKING-STORAGE SECTION.
       01  NUM1                   PIC 9(10).
       01  NUM2                   PIC 9(10).
       01  NUM1-ORIGINAL          PIC 9(10).
       01  NUM2-ORIGINAL          PIC 9(10).
       01  TEMP                   PIC 9(10).
       01  REMAINDER-VAL          PIC 9(10).
       01  RESULT-GCD             PIC 9(10).
       01  ANOTHER-CALCULATION    PIC X(1) VALUE 'Y'.
       01  INPUT-STATUS           PIC 9(1) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM UNTIL ANOTHER-CALCULATION = 'N' 
               OR ANOTHER-CALCULATION = 'n'
               
               PERFORM GET-INPUT
               
               IF INPUT-STATUS = 1
                   PERFORM CALCULATE-GCD
                   DISPLAY " "
                   DISPLAY "==============================="
                   DISPLAY "The GCD of " NUM1-ORIGINAL 
                       " and " NUM2-ORIGINAL " is: " RESULT-GCD
                   DISPLAY "==============================="
                   DISPLAY " "
               END-IF
               
               DISPLAY "Do you want to calculate another GCD? (Y/N): "
               ACCEPT ANOTHER-CALCULATION
           END-PERFORM.
           
           DISPLAY " "
           DISPLAY "Thank you for using GCD Calculator!"
           STOP RUN.

       GET-INPUT.
           DISPLAY " "
           DISPLAY "========== GCD CALCULATOR =========="
           DISPLAY " "
           DISPLAY "Enter first number: " WITH NO ADVANCING
           ACCEPT NUM1
           
           DISPLAY "Enter second number: " WITH NO ADVANCING
           ACCEPT NUM2
           
           IF NUM1 = 0 OR NUM2 = 0
               DISPLAY " "
               DISPLAY "ERROR: Numbers must be non-zero."
               DISPLAY "Please try again."
               MOVE 0 TO INPUT-STATUS
               PERFORM GET-INPUT
           ELSE
               MOVE NUM1 TO NUM1-ORIGINAL
               MOVE NUM2 TO NUM2-ORIGINAL
               MOVE 1 TO INPUT-STATUS
           END-IF.

       CALCULATE-GCD.
           MOVE NUM1 TO NUM1
           MOVE NUM2 TO NUM2
           
           PERFORM UNTIL NUM2 = 0
               DIVIDE NUM1 BY NUM2 
                   GIVING TEMP 
                   REMAINDER REMAINDER-VAL
               MOVE NUM2 TO NUM1
               MOVE REMAINDER-VAL TO NUM2
           END-PERFORM.
           
           MOVE NUM1 TO RESULT-GCD.
