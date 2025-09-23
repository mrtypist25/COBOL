       IDENTIFICATION DIVISION.
       PROGRAM-ID. adc. 
      *---------------------------------------------
      *     
      *                   ADC
      *         Automated Data Collector Program
      *  
      *---------------------------------------------

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       *> File use to collect the user data.
       FILE-CONTROL.
       SELECT WorkFile ASSIGN TO "work.tmp".
       SELECT OrgFile ASSIGN TO "statenames.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT SortedFile ASSIGN TO "statenames2.txt"
           ORGANIZATION IS LINE SEQUENTIAL.       
       DATA DIVISION.
       *> defining layout for the file.
       FILE SECTION.
       FD OrgFile.
       01 StateData.
           02 idNum PIC 9(5).
           02 sName PIC X(15).
           02 cName PIC X(15).
       FD SortedFile.
       01 SStateData.
           02 SidNum PIC 9(5).
           02 SsName PIC X(15).
           02 ScName PIC X(15).
       SD WorkFile.
       01 WStateData.
           02 WidNum PIC 9(5).
           02 WsName PIC X(15).
           02 WcName PIC X(15).
       WORKING-STORAGE SECTION.
       01 ws-StateData.
           02 ws-idNum PIC 9(5).
           02 ws-sName PIC X(15).
           02 ws-cName PIC X(15).
       01 secretKey PIC 9(4).
       
       01 ws-dateAndTime.
           02 ws-date.
               03 ws-month PIC 9(2).
               03 ws-day PIC 9(2).
               03 ws-year PIC 9(4).
           02 ws-time.
               03 ws-hour PIC 9(2).
               03 ws-minut PIC 9(2).
               03 ws-seconds PIC 9(2).

       PROCEDURE DIVISION.
       PERFORM keyPass UNTIL secretKey = 1357
       *> Data is appended in the file           
       PERFORM updateCustFile
       *> Sorting file
       PERFORM sortAfile

       STOP RUN.
       *>Setting a key code to get acces to database
       keyPass.       
       DISPLAY"Enter your secret code: "WITH NO ADVANCING
       ACCEPT secretKey.


       updateCustFile.
           display"ID number: "WITH NO ADVANCING 
               ACCEPT idNum

           DISPLAY"State name: "WITH NO ADVANCING 
               ACCEPT sName
           
           DISPLAY"City name: "WITH NO ADVANCING 
               ACCEPT cName

           MOVE FUNCTION CURRENT-DATE TO ws-dateAndTime

           OPEN EXTEND OrgFile
               WRITE StateData
               END-WRITE
           CLOSE OrgFile.
       
       sortAfile.
       SORT WorkFile ON ASCENDING KEY idNum
           USING OrgFile
           GIVING SortedFile.
       