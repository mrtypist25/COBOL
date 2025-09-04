       IDENTIFICATION DIVISION.
       PROGRAM-ID. bank_account.  
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Curr PIC $,$$9.99.
       01 SCurr PIC $,$$9.99.
       01 OAApproved PIC 9(4)V99 VALUE 1000.
       01 AmountWithdraw PIC 999V99 VALUE 0.
       01 AvailableAmount PIC 9(3)V99.
       01 CurrentAmount PIC 999V99.
       01 Dec PIC X(20).
       PROCEDURE DIVISION.
       MOVE ALL "*" TO Dec.
       DISPLAY Dec" WELCOME "Dec.
       DISPLAY "Amount to withdraw: "WITH NO ADVANCING
       ACCEPT AmountWithdraw
       IF AmountWithdraw less than 101
           COMPUTE AvailableAmount = OAApproved - 
           AmountWithdraw
           MOVE AmountWithdraw to Curr
           MOVE AvailableAmount TO CurrentAmount
           MOVE CurrentAmount TO SCurr
           DISPLAY "Amount withdrawn: "Curr
           DISPLAY "Money available: "SCurr
       ELSE 
           DISPLAY "ERROR: max to withdraw is 100"
       END-IF.
       
       STOP RUN.
       END PROGRAM bank_account.
       