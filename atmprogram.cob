       IDENTIFICATION DIVISION.
       PROGRAM-ID. bank_account.  
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 IDNum PIC 9(5).
       01 Customer.
           02 OriginalAmount PIC 9(4) VALUE 1000.
           02 FName PIC X(15).
           02 LName PIC X(15).
           02 Withdraw PIC 9(3).
           02 Balance PIC 9(3).
           02 NewAmount PIC 9(3).
      
       01 Dec PIC X(20).

       PROCEDURE DIVISION.
       MOVE ALL "*" TO Dec.
       DISPLAY Dec" WELCOME "Dec.
       DISPLAY "Amount to withdraw: $"WITH NO ADVANCING
       ACCEPT Withdraw
       IF Withdraw less than 101
           COMPUTE Balance = OriginalAmount - Withdraw
           MOVE Balance TO NewAmount
           DISPLAY "Original amount: $"OriginalAmount
           DISPLAY "Withdraw: $"Balance
           DISPLAY "Available amount: $"NewAmount
           
           
       ELSE 
           DISPLAY "ERROR: max to withdraw is 100"
       END-IF.
           

       STOP RUN.
       END PROGRAM bank_account.
       