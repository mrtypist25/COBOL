       IDENTIFICATION DIVISION.
       PROGRAM-ID. adc. 

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       *> File use to collect the user data.
       FILE-CONTROL.
       SELECT customerFile ASSIGN TO "customers.txt"
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS IS SEQUENTIAL.       
       DATA DIVISION.
       *> defining layout for the file.
       FILE SECTION.
       FD customerFile.
       01 custData.
           02 idNum PIC 9(5).
           02 fName PIC A(15).
           02 lName PIC A(15).
       WORKING-STORAGE SECTION.
       01 ws-custData.
           02 ws-idNum PIC 9(5).
           02 ws-fName PIC 9(15).
           02 ws-lName PIC 9(15).
       01 secretKey PIC 9(4).

       PROCEDURE DIVISION.
       PERFORM keyPass UNTIL secretKey = 1357
       *> We append the data in the file           
       PERFORM updateCustFile

       STOP RUN.
       *>Setting a key code to get acces to database
       keyPass.       
       DISPLAY"Enter your secret code: "WITH NO ADVANCING
       ACCEPT secretKey.


       updateCustFile.
           display"ID number: "WITH NO ADVANCING 
               ACCEPT idNum

           DISPLAY"First name: "WITH NO ADVANCING 
               ACCEPT fName
           
           DISPLAY"Last name: "WITH NO ADVANCING 
               ACCEPT lName

           OPEN EXTEND customerFile
               WRITE custData
               END-WRITE
           CLOSE customerFile.
