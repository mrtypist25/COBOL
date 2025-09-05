       IDENTIFICATION DIVISION.
       PROGRAM-ID. atm_program.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT DFile ASSIGN TO "customers.txt"
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD DFile.
       01 Customer.
           02 IDnum PIC 9(5).
           02 spc PIC X(1).
           02 Loan PIC 9(4).
           02 CustName.
               03 FName PIC X(15).
               03 LName PIC X(15).
           
           02 Debt PIC 9(3).
           02 Withdraw PIC 9(3).
           02 Balance PIC 9(3).
           02 ABalance PIC 9(3).
       WORKING-STORAGE SECTION.
       01 WCustomer.
           02 WLoan PIC 9(4).
           02 WIDnum PIC 9(5).
           02 WCustName.
               03 WFName PIC X(15).
               03 WLName PIC X(15).
           
           02 WDebt PIC 9(3).
           02 WWithdraw PIC 9(3).
           02 WBalance PIC 9(3).
           02 WABalance PIC 9(3).
       01 Dec PIC X(25).
       
       PROCEDURE DIVISION.
           MOVE ALL "*" TO Dec.
               DISPLAY Dec" WELCOME "Dec.
               DISPLAY "Amount to withdraw: "WITH NO ADVANCING 
               ACCEPT WWithdraw.
               IF WWithdraw < 301
                   COMPUTE WBalance = WLoan - WWithdraw
                   DISPLAY "Actual balance: "WBalance
               ELSE
                   DISPLAY "The max to withdraw is 300"
               END-IF.


           OPEN OUTPUT DFile
               MOVE 00001 TO IDnum.
               MOVE " " TO spc.
               MOVE "Mike" TO FName.
               MOVE "White" TO LName.
               MOVE 1000 TO Loan.
               MOVE WBalance TO Debt.
               WRITE Customer
               END-WRITE.
           CLOSE DFile.
       STOP RUN.
       END PROGRAM atm_program.
