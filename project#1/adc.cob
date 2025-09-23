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
      * Files used for this program.
       FILE-CONTROL.
       SELECT WorkFile ASSIGN TO "work.tmp".
       SELECT OrgFile ASSIGN TO "statenames.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT SortedFile ASSIGN TO "statenames2.txt"
           ORGANIZATION IS LINE SEQUENTIAL.       
       DATA DIVISION.
      * Establishing file layout.
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
       
       
       PROCEDURE DIVISION.
      *Setting a password
       PERFORM keyPass UNTIL secretKey = 1357
      
      *Collecting data          
       PERFORM updateCustFile

      *Organizing data
       PERFORM sortAfile


       STOP RUN.
      
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


           OPEN EXTEND OrgFile
               WRITE StateData
               END-WRITE
           CLOSE OrgFile.
       
       sortAfile.
       SORT WorkFile ON ASCENDING KEY idNum
           USING OrgFile
           GIVING SortedFile.
       
