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
       01 gettingData.
           02 idNum PIC 9(5).
           02 spc PIC X(1).
           02 sName PIC X(15).
           02 cName PIC X(15).
           02 timeAndDate.
               03 tdate.
                   04 tyear PIC 9(4).
                   04 tmonth PIC 9(2).
                   04 tday PIC 9(2).
               03 ttime.
                   04 thour PIC 9(2).
                   04 tminute PIC 9(2).
                   04 tsecond PIC 9(2).
       FD SortedFile.
       01 SgettingData.
           02 SidNum PIC 9(5).
           02 Sspc PIC X(1).
           02 SsName PIC X(15).
           02 ScName PIC X(15).
           02 StimeAndDate.
               03 Stdate.
                   04 Styear PIC 9(4).
                   04 Stmonth PIC 9(2).
                   04 Stday PIC 9(2).
               03 sttime.
                   04 Sthour PIC 9(2).
                   04 Stminute PIC 9(2).
                   04 Stsecond PIC 9(2).
       SD WorkFile.
       01 WgettingData.
           02 WidNum PIC 9(5).
           02 Wspc PIC X(1).
           02 WsName PIC X(15).
           02 WcName PIC X(15).
           02 WtimeAndDate.
               03 Wtdate.
                   04 Wtyear PIC 9(4).
                   04 Wtmonth PIC 9(2).
                   04 Wtday PIC 9(2).
               03 wttime.
                   04 Wthour PIC 9(2).
                   04 Wtminute PIC 9(2).
                   04 Wtsecond PIC 9(2).
       WORKING-STORAGE SECTION.
       01 ws-gettingData.
           02 ws-idNum PIC 9(5).
           02 ws-spc PIC X(1).
           02 ws-sName PIC X(15).
           02 ws-cName PIC X(15).
           02 ws-timeAndDate.
               03 ws-tdate.
                   04 ws-tyear PIC 9(4).
                   04 ws-tmonth PIC 9(2).
                   04 ws-tday PIC 9(2).
               03 ws-ttime.
                   04 ws-thour PIC 9(2).
                   04 ws-tminute PIC 9(2).
                   04 ws-tsecond PIC 9(2).
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
           DISPLAY"Type y to store data: "WITH NO ADVANCING
           ACCEPT spc
           MOVE SPACE TO spc

      *    Every time a record is included the time and date is set
           MOVE FUNCTION CURRENT-DATE TO ws-gettingData

           OPEN EXTEND OrgFile
               MOVE ws-gettingData TO timeAndDate
               WRITE gettingData
               END-WRITE
           CLOSE OrgFile.
       
       sortAfile.
       SORT WorkFile ON ASCENDING KEY idNum
           USING OrgFile
           GIVING SortedFile.
       
