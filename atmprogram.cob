       IDENTIFICATION DIVISION.
       PROGRAM-ID. atm_program.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
       SELECT DataFile ASSIGN TO "customers.txt"
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS IS SEQUENTIAL. 
       DATA DIVISION.
       FILE SECTION. 
       FD DataFile.
       01 Table1.
           02 DData PIC X(15) OCCURS 6 TIMES.
       WORKING-STORAGE SECTION.
       01 WIDnum PIC 9(5) VALUE 00002.
       01 WFname PIC X(15) VALUE "Michael".
       01 WLname PIC X(15) VALUE "White".
       01 WLoan  PIC 9(4) VALUE 1000.
       01 WDebt PIC 9(3) VALUE 000.
       01 WWithdraw PIC 9(3).
       01 WBalance PIC 9(3).
       01 WDec PIC X(25).
       PROCEDURE DIVISION.
       MOVE ALL "*" TO WDec.
       DISPLAY WDec" WELCOME "WDec.
       DISPLAY "Amount to withdraw: $"WITH NO ADVANCING
       ACCEPT WWithdraw.
       IF WWithdraw < 301
           COMPUTE WBalance = WDebt + WWithdraw
           MOVE WBalance TO WDebt
           DISPLAY "You withdrawn $: "WWithdraw
           COMPUTE WBalance = WLoan - WWithdraw
           MOVE WBalance TO WLoan
      
       ELSE 
           DISPLAY "Max to withdraw is $300.00"
       END-IF.
       OPEN OUTPUT DataFile
           MOVE WIDnum TO DData(1).
           MOVE WFname TO DData(2).
           MOVE WLname TO DData(3).
           MOVE WLoan TO DData(4).
           MOVE WDebt TO DData(5)
           WRITE Table1
           END-WRITE.

       CLOSE DataFile.        
           
           
           
       STOP RUN.
