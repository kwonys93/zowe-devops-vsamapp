       ID DIVISION.
       PROGRAM-ID. COBDEMO.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  S999-FIELD1             PIC S9(3).                           
       77  S999-FIELD2             PIC S9(3)       VALUE +50.           
       77  999-FIELD1              PIC 9(3).                            
       77  999-FIELD2              PIC 9(3)        VALUE 50.            
       77  COMMAREA-LEN            PIC S9(4) COMP  VALUE +59.           
       77  LINK-COMMAREA-LEN       PIC S9(4) COMP  VALUE +59.           
       77  TSQ-LEN                 PIC S9(4) COMP  VALUE +59.           
       77  REC-LEN                 PIC S9(4) COMP.                      
       77  NUM-CHOICES             PIC S9(4) COMP  VALUE +7.            
       77  SUB                     PIC S9(4) COMP.                      
       77  SUB-1                   PIC S9(3) COMP-3.                    
       77  SUB-2                   PIC S9(4) COMP.                      
       77  SUB-3                   PIC S9(4) COMP.                      
       77  VAR-SS                  PIC S9(4) COMP.                      
       77  TSQ-ITEM                PIC S9(4) COMP  VALUE +1.            
       77  REC-RBA                 PIC X(9) VALUE SPACES.               
       77  INITIMG-VAL             PIC X VALUE LOW-VALUES.              
       01  MAPNAME                 PIC X(8).                            
       01  GETM-AREA1              PIC X(20).                           
       01  NEW-DATA       REDEFINES GETM-AREA1                          
                                   PIC X(20).
       01  TSQ-NAME.                                                    
           03 TSQ-TRANID            PIC XXXX.                           
           03 TSQ-TERMID            PIC XXXX.                           
       01  TASK-STRUCTURE.                                              
           03 TASK-CNTL             PIC X(4)  VALUE 'CNTL'.             
           03 TASK-PROTCPF          PIC X(8)  VALUE 'PROTCPF'.          
           03 TASK-PROTHLF          PIC X(8)  VALUE 'PROTHLF'.          
           03 TASK-SWITCH           PIC X.                              
           03 TASK-SWITCH2          PIC 99.                             
           03 TASK-SWITCH3          PIC X.                              
           03 TASKNUM               PIC S9(5)  COMP-3.                  
           03 TASKNUM-CHAR REDEFINES TASKNUM PIC X(3).                  
           03 TASK-TEXT.                                                
              05 TASK-ID-NO         PIC 9(3)  COMP-3  VALUE 0.          
              05 FILLER             PIC X     VALUE SPACES.             
              05 TASK-MESG          PIC X(20)                           
                                    VALUE 'THIS IS A MESSAGE'.
              05 FILLER             PIC X     VALUE SPACES.             
              05 TASK-DATE.                                             
                 07 TASK-MM         PIC 99    VALUE 12.                 
                 07 TASK-SL1        PIC X     VALUE '/'.                
                 07 TASK-DD         PIC 99    VALUE 25.                 
                 07 TASK-SL2        PIC X     VALUE '/'.                
                 07 TASK-YY         PIC 99    VALUE 99.                 
       01  TASK-STRUCTURE-2.                                            
           03 TASK-TEXT             PIC X(32) VALUE ALL '*'.            
       01  NUP-ON.                                                      
           03  CNTL-1               PIC X(4)  VALUE 'CNTL'.             
           03  FILLER               PIC X(24)                           
               VALUE '=ON,PROG=COBDEMO,NUP=ON '.
       01  RFC-OFF.                                                     
           03  CNTL-2               PIC X(4)  VALUE 'CNTL'.             
           03  FILLER               PIC X(29)                           
               VALUE '=OFF,PROG=COBDEMO,RFC=(PROTH,'.
           03  PROTHLF-1            PIC X(7)  VALUE 'PROTHLF'.          
           03  FILLER               PIC X(3)  VALUE ')  '.              
       01  RECORD-KEY               PIC X(100).                         
       01  VSAM-AREA.                                                   
           03  VSAM-KEY             PIC X(9).                           
           03  VSAM-NAME            PIC X(20).                          
           03  FILLER               PIC X(52).                          
           03  FILLER               PIC X(200).                         
           03  FILLER               PIC X(200).                         
           03  FILLER               PIC X(200).                         
       01  WK-REC                VALUE SPACES.                          
           03  WK-REC-TEXT1         PIC X(40).                          
           03  WK-REC-TEXT2         PIC X(40).                          
           03  WK-REC-TEXT3         PIC X(40).                          
           03  WK-REC-TEXT4         PIC X(40).                          
       01  WK-REC-2 REDEFINES WK-REC.                                   
           03  WK-BYTE              PIC X OCCURS 160.                   
       01  TRL-TABLE.                                                   
           03  FILLER               PIC X(27) VALUE                     
                        ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
           03  FILLER               PIC X(10) VALUE                     
                        '1234567890'.
           03  FILLER               PIC X(19) VALUE                     
                        '-+=.,;:#*/()@&%$�?!'.
       01  TRL-TABLE-2 REDEFINES TRL-TABLE.                             
           03  PRINTABLE            PIC X OCCURS 56 INDEXED BY IDX.     
       01  THREE-DIM-TABLE.                                             
           03  STATE                OCCURS 2 TIMES                      
                                    INDEXED BY STATE-X.                 
               05  STATE-NUMBER     PIC 9.                              
               05  COUNTY           OCCURS 9 TIMES                      
                                    INDEXED BY COUNTY-X.                
                   07  COUNTY-NUM1  PIC 9.                              
                   07  COUNTY-COMM  PIC X.                              
                   07  COUNTY-NUM2  PIC 9.                              
                   07  DISTRICT-POP PIC S9(3) COMP-3                    
                                    OCCURS 5 TIMES
                                    INDEXED BY DISTRICT-X.              
       01  VARIABLE-LENGTH-RECORD.                                      
           03  VAR-REC-LEN          PIC S9(4) COMP.                     
           03  VAR-LENGTH-DATA      PIC X                               
                                    OCCURS 1 TO 100 TIMES
                                    DEPENDING ON VAR-REC-LEN.           
           COPY DFHAID.
      *****************************************************************
      *                                                               *
      *                                                               *
      *                                                               *
      *     Licensed Materials - Property of IBM                      *
      *                                                               *
      *     "Restricted Materials of IBM"                             *
      *                                                               *
      *     5655-Y04                                                  *
      *                                                               *
      *     (C) Copyright IBM Corp. 1988, 2010"                       *
      *                                                               *
      *                                                               *
      *                                                               *
      *                                                               *
      *   STATUS = 7.2.0                                              *
      *                                                               *
      * CHANGE ACTIVITY :                                             *
      *                                                               *
      *   $SEG(DFHAID),COMP(BMS),PROD(CICS TS ):                      *
      *                                                               *
      *  PN= REASON REL YYMMDD HDXXIII : REMARKS                      *
      * $D1= I07991 670 100820 HDIGPG  : Translate unprintable char   *
      * $L0= Base   210 88     HD1MA   : Base                         *
      *                                                               *
      *****************************************************************
      *
      *
       01    DFHAID.                                                    
         02  DFHNULL   PIC  X  VALUE IS X'00'.                          
         02  DFHENTER  PIC  X  VALUE IS ''''.                           
         02  DFHCLEAR  PIC  X  VALUE IS '_'.                            
         02  DFHCLRP   PIC  X  VALUE IS '�'.                            
         02  DFHPEN    PIC  X  VALUE IS '='.                            
         02  DFHOPID   PIC  X  VALUE IS 'W'.                            
         02  DFHMSRE   PIC  X  VALUE IS 'X'.                            
         02  DFHSTRF   PIC  X  VALUE IS 'h'.                            
         02  DFHTRIG   PIC  X  VALUE IS '"'.                            
         02  DFHPA1    PIC  X  VALUE IS '%'.                            
         02  DFHPA2    PIC  X  VALUE IS '>'.                            
         02  DFHPA3    PIC  X  VALUE IS ','.                            
         02  DFHPF1    PIC  X  VALUE IS '1'.                            
         02  DFHPF2    PIC  X  VALUE IS '2'.                            
         02  DFHPF3    PIC  X  VALUE IS '3'.                            
         02  DFHPF4    PIC  X  VALUE IS '4'.                            
         02  DFHPF5    PIC  X  VALUE IS '5'.                            
         02  DFHPF6    PIC  X  VALUE IS '6'.                            
         02  DFHPF7    PIC  X  VALUE IS '7'.                            
         02  DFHPF8    PIC  X  VALUE IS '8'.                            
         02  DFHPF9    PIC  X  VALUE IS '9'.                            
         02  DFHPF10   PIC  X  VALUE IS ':'.                            
         02  DFHPF11   PIC  X  VALUE IS '#'.                            
         02  DFHPF12   PIC  X  VALUE IS '@'.                            
         02  DFHPF13   PIC  X  VALUE IS 'A'.                            
         02  DFHPF14   PIC  X  VALUE IS 'B'.                            
         02  DFHPF15   PIC  X  VALUE IS 'C'.                            
         02  DFHPF16   PIC  X  VALUE IS 'D'.                            
         02  DFHPF17   PIC  X  VALUE IS 'E'.                            
         02  DFHPF18   PIC  X  VALUE IS 'F'.                            
         02  DFHPF19   PIC  X  VALUE IS 'G'.                            
         02  DFHPF20   PIC  X  VALUE IS 'H'.                            
         02  DFHPF21   PIC  X  VALUE IS 'I'.                            
         02  DFHPF22   PIC  X  VALUE IS '�'.                            
         02  DFHPF23   PIC  X  VALUE IS '.'.                            
         02  DFHPF24   PIC  X  VALUE IS '<'.                            
           COPY IN25CMP.
       01  DMAP04AI.                                                    
           02  FILLER PIC X(12).                                        
           02  RECOUT1L    COMP  PIC  S9(4).                            
           02  RECOUT1F    PICTURE X.                                   
           02  FILLER REDEFINES RECOUT1F.                               
             03 RECOUT1A    PICTURE X.                                  
           02  RECOUT1I  PIC X(40).                                     
           02  RECOUT2L    COMP  PIC  S9(4).                            
           02  RECOUT2F    PICTURE X.                                   
           02  FILLER REDEFINES RECOUT2F.                               
             03 RECOUT2A    PICTURE X.                                  
           02  RECOUT2I  PIC X(40).                                     
           02  RECOUT3L    COMP  PIC  S9(4).                            
           02  RECOUT3F    PICTURE X.                                   
           02  FILLER REDEFINES RECOUT3F.                               
             03 RECOUT3A    PICTURE X.                                  
           02  RECOUT3I  PIC X(40).                                     
           02  RECOUT4L    COMP  PIC  S9(4).                            
           02  RECOUT4F    PICTURE X.                                   
           02  FILLER REDEFINES RECOUT4F.                               
             03 RECOUT4A    PICTURE X.                                  
           02  RECOUT4I  PIC X(40).                                     
           02  RECLENL    COMP  PIC  S9(4).                             
           02  RECLENF    PICTURE X.                                    
           02  FILLER REDEFINES RECLENF.                                
             03 RECLENA    PICTURE X.                                   
           02  RECLENI  PIC X(4).                                       
       01  DMAP04AO REDEFINES DMAP04AI.                                 
           02  FILLER PIC X(12).                                        
           02  FILLER PICTURE X(3).                                     
           02  RECOUT1O  PIC X(40).                                     
           02  FILLER PICTURE X(3).                                     
           02  RECOUT2O  PIC X(40).                                     
           02  FILLER PICTURE X(3).                                     
           02  RECOUT3O  PIC X(40).                                     
           02  FILLER PICTURE X(3).                                     
           02  RECOUT4O  PIC X(40).                                     
           02  FILLER PICTURE X(3).                                     
           02  RECLENO PIC 9999.                                        
       01  DMAPBEGI.                                                    
           02  FILLER PIC X(12).                                        
       01  DMAPBEGO REDEFINES DMAPBEGI.                                 
           02  FILLER PIC X(12).                                        
       01  DMAPASRI.                                                    
           02  FILLER PIC X(12).                                        
       01  DMAPASRO REDEFINES DMAPASRI.                                 
           02  FILLER PIC X(12).                                        
       01  DMAPSUMI.                                                    
           02  FILLER PIC X(12).                                        
       01  DMAPSUMO REDEFINES DMAPSUMI.                                 
           02  FILLER PIC X(12).                                        
       01  DMAPENDI.                                                    
           02  FILLER PIC X(12).                                        
           02  ENDLINEL    COMP  PIC  S9(4).                            
           02  ENDLINEF    PICTURE X.                                   
           02  FILLER REDEFINES ENDLINEF.                               
             03 ENDLINEA    PICTURE X.                                  
           02  ENDLINEI  PIC X(22).                                     
       01  DMAPENDO REDEFINES DMAPENDI.                                 
           02  FILLER PIC X(12).                                        
           02  FILLER PICTURE X(3).                                     
           02  ENDLINEO  PIC X(22).                                     
       01  DMAP00I.                                                     
           02  FILLER PIC X(12).                                        
           02  REQCDL    COMP  PIC  S9(4).                              
           02  REQCDF    PICTURE X.                                     
           02  FILLER REDEFINES REQCDF.                                 
             03 REQCDA    PICTURE X.                                    
           02  REQCDI  PIC 99.                                          
           02  MSGL    COMP  PIC  S9(4).                                
           02  MSGF    PICTURE X.                                       
           02  FILLER REDEFINES MSGF.                                   
             03 MSGA    PICTURE X.                                      
           02  MSGI  PIC X(79).                                         
       01  DMAP00O REDEFINES DMAP00I.                                   
           02  FILLER PIC X(12).                                        
           02  FILLER PICTURE X(3).                                     
           02  REQCDO  PIC X(2).                                        
           02  FILLER PICTURE X(3).                                     
           02  MSGO  PIC X(79).                                         
       01  DMAP01I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP01O REDEFINES DMAP01I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP02I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP02O REDEFINES DMAP02I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP03I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP03O REDEFINES DMAP03I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP04I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP04O REDEFINES DMAP04I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP05I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP05O REDEFINES DMAP05I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP06I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP06O REDEFINES DMAP06I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP07I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP07O REDEFINES DMAP07I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP08I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP08O REDEFINES DMAP08I.                                   
           02  FILLER PIC X(12).                                        
       01  DMAP09I.                                                     
           02  FILLER PIC X(12).                                        
       01  DMAP09O REDEFINES DMAP09I.                                   
           02  FILLER PIC X(12).                                        
       01  DERRORI.                                                     
           02  FILLER PIC X(12).                                        
           02  ERRORL    COMP  PIC  S9(4).                              
           02  ERRORF    PICTURE X.                                     
           02  FILLER REDEFINES ERRORF.                                 
             03 ERRORA    PICTURE X.                                    
           02  ERRORI  PIC X(20).                                       
       01  DERRORO REDEFINES DERRORI.                                   
           02  FILLER PIC X(12).                                        
           02  FILLER PICTURE X(3).                                     
           02  ERRORO  PIC X(20).                                       
       LINKAGE SECTION.
       01  DFHCOMMAREA.                                                 
           03  COMM-CNTL           PIC X(4).                            
           03  COMM-PROTCPF        PIC X(8).                            
           03  COMM-PROTHLF        PIC X(8).                            
           03  COMM-SW             PIC X.                               
           03  COMM-SW2            PIC 99.                              
           03  COMM-SW3            PIC X.                               
           03  COMM-TASK-NUMBER    PIC S9(5)       COMP-3.              
           03  COMM-TEXT           PIC X(32).                           
           03  FILLER              PIC X(4096).                         
           03  FILLER              PIC X(4096).                         
           03  FILLER              PIC X(4096).                         
           03  FILLER              PIC X(4096).                         
       01  RECORD-AREA.                                                 
           03  REC-TEXT            PIC X(160).                          
           03  REC-TXT REDEFINES REC-TEXT PIC X OCCURS 160.             
       01  GETMAIN-AREA            PIC X(4096).                         
       01  STG-AREA.                                                    
           03  STG-AREA1           PIC X(20).                           
       01  IN25OPTS-AREA.                                               
           03  FILLER              PIC X(38).                           
           03  OPTS-PROTCPF        PIC X(8).                            
           03  OPTS-CNTL           PIC X(4).                            
           03  FILLER              PIC X(18).                           
           03  OPTS-PROTHLF        PIC X(8).                            

       PROCEDURE DIVISION.                                              
           MOVE EIBTRNID TO TSQ-TRANID.                                 
           MOVE EIBTRMID TO TSQ-TERMID.                                 
      *** THIS CODE INITIALIZES THE MAPS BECAUSE COBOL2 DOESN'T ***
           MOVE LOW-VALUES TO DMAP04AI                                  
                        DMAPBEGI                                        
                        DMAPASRI                                        
                        DMAPSUMI                                        
                        DMAPENDI                                        
                        DMAP00I                                         
                        DMAP01I                                         
                        DMAP02I                                         
                        DMAP03I                                         
                        DMAP04I                                         
                        DMAP05I                                         
                        DMAP06I                                         
                        DMAP07I                                         
                        DMAP08I                                         
                        DMAP09I                                         
                        DERRORI.                                        
           EXEC CICS HANDLE CONDITION
                     QIDERR(WRITE-TSQ)
                     ERROR(GEN-ERR)
                     END-EXEC.                                          
           IF EIBAID = DFHCLEAR                                         
               GO TO SEND-END-MSG.                                      
      ** THIS INITIALIZES TASKNUM TO INVALID DATA FORCING THE OC7 **
      ** SINCE COBOL2 RETRIEVES THE SAME STORAGE IT USED PREVIOUSLY **
           MOVE LOW-VALUES TO TASKNUM-CHAR.                             
           EXEC CICS READQ TS
                     QUEUE(TSQ-NAME)
                     INTO(TASK-STRUCTURE)
                     LENGTH(TSQ-LEN)
                     ITEM(TSQ-ITEM)
                     END-EXEC.                                          
           IF EIBAID = DFHPF2                                           
            OR EIBAID = DFHPF14                                         
            OR TASK-SWITCH = DFHPF2                                     
               GO TO EXPANDED-DEMO.                                     
           IF EIBCALEN = 0                                              
               GO TO SEND-FIRST-SCREEN.                                 
           GO TO CONTINUE-TASK.                                         
       WRITE-TSQ.
           EXEC CICS HANDLE CONDITION
                     PGMIDERR(NO-OPTS)
                     END-EXEC.                                          
           EXEC CICS LOAD
                     PROGRAM('IN25OPTS')
                     SET(ADDRESS OF IN25OPTS-AREA)
                     END-EXEC.                                          
           MOVE OPTS-CNTL TO TASK-CNTL.                                 
           MOVE OPTS-PROTCPF TO TASK-PROTCPF.                           
           MOVE OPTS-PROTHLF TO TASK-PROTHLF.                           
           EXEC CICS RELEASE
                     PROGRAM('IN25OPTS')
                     END-EXEC.                                          
           EXEC CICS HANDLE CONDITION
                     PGMIDERR(GEN-ERR)
                     END-EXEC.                                          
       NO-OPTS.
           MOVE SPACE TO TASK-SWITCH.                                   
           MOVE ZERO  TO TASK-SWITCH2.                                  
           MOVE SPACE TO TASK-SWITCH3.                                  
           EXEC CICS WRITEQ TS
                     QUEUE(TSQ-NAME)
                     FROM(TASK-STRUCTURE)
                     LENGTH(TSQ-LEN)
                     MAIN
                     END-EXEC.                                          
       SEND-FIRST-SCREEN.
           EXEC CICS SEND
                     MAP ('DMAPBEG')
                     MAPSET ('IN25CMP')
                     MAPONLY
                     ERASE
                     END-EXEC.                                          
           EXEC CICS RECEIVE
                     END-EXEC.
           IF EIBAID = DFHENTER GO TO CONTINUE-TASK.                    
           IF EIBAID = DFHCLEAR GO TO SEND-END-MSG.                     
           IF EIBAID = DFHPF3   GO TO SEND-END-MSG.                     
           IF EIBAID = DFHPF15  GO TO SEND-END-MSG.                     
           IF EIBAID = DFHPF2   GO TO EXPANDED-DEMO.                    
           IF EIBAID = DFHPF14  GO TO EXPANDED-DEMO.                    
           GO TO SEND-FIRST-SCREEN.                                     
       CONTINUE-TASK.
      **** TASKNUM *NOTE* FIELD MUST BE INITIALIZED
           ADD +1 TO TASKNUM.                                           
           IF TASKNUM = 1                                               
               MOVE 'DMAPASR'  TO MAPNAME.                              
           IF TASKNUM = 2                                               
               MOVE 'DMAPSUM'  TO MAPNAME.                              
           IF TASKNUM GREATER 2                                         
               GO TO SEND-END-MSG.                                      
           GO TO REWRITE-TSQ.                                           
       REWRITE-TSQ.
           EXEC CICS WRITEQ TS
                     REWRITE
                     QUEUE(TSQ-NAME)
                     FROM(TASK-STRUCTURE)
                     LENGTH(TSQ-LEN)
                     ITEM(TSQ-ITEM)
                     END-EXEC.                                          
       RETURN-TRANSID.
           EXEC CICS SEND
                     MAP(MAPNAME)
                     MAPSET('IN25CMP')
                     MAPONLY
                     ERASE
                     END-EXEC.                                          
           EXEC CICS RETURN
                     TRANSID(EIBTRNID)
                     COMMAREA(TASK-STRUCTURE)
                     LENGTH(COMMAREA-LEN)  END-EXEC.                    
       SEND-END-MSG.
           EXEC CICS HANDLE CONDITION
                     QIDERR(LAST-SCREEN)
                     END-EXEC.                                          
           EXEC CICS DELETEQ TS
                     QUEUE(TSQ-NAME)
                     END-EXEC.                                          
       LAST-SCREEN.
           EXEC CICS SEND
                     MAP('DMAPEND')
                     MAPSET('IN25CMP')
                     ERASE
                     END-EXEC.                                          
       RETURN-TO-CICS.
           EXEC CICS RETURN   END-EXEC.

       EXPANDED-DEMO.
           MOVE DFHPF2 TO TASK-SWITCH.                                  
           IF  TASK-SWITCH2 = 0                                         
               GO TO SEND-MAP00.                                        
           IF  TASK-SWITCH2 = 99                                        
               GO TO RECEIVE-MAP00.                                     
           GO TO WHICH-ONE.                                             
      *    THIS SECTION (WHICH-ONE) GIVES
      *    CONTROL TO THE APPROPRIATE
      *    SECTION OF THE DEMO.
      *    THE INFORMATION IS RECEIVED WHEN
      *    THE USER ENTERS THE SELECTION
      *    CRITERIA. 01 IS FIRST ENTRY, 02 IS SECOND ... ETC.

       SEND-MAP00.
           IF  TASK-SWITCH2 LESS NUM-CHOICES                            
               ADD 1, TASK-SWITCH2 GIVING REQCDI                        
           ELSE
               MOVE '01' TO REQCDO.                                     
           MOVE 99 TO TASK-SWITCH2.                                     
           MOVE SPACE TO TASK-SWITCH3.                                  
           EXEC CICS SEND
                     MAP ('DMAP00')
                     MAPSET ('IN25CMP')
                     ERASE
                     END-EXEC.                                          
           GO TO REWRITE-RETURN.                                        

       RECEIVE-MAP00.
           EXEC CICS HANDLE CONDITION
                     MAPFAIL(SEND-MAP00)
                     END-EXEC.                                          
           EXEC CICS RECEIVE
                     MAP ('DMAP00')
                     MAPSET ('IN25CMP')
                     END-EXEC.                                          
           IF  REQCDI NUMERIC                                           
               NEXT SENTENCE
           ELSE
               MOVE 'INVALID CODE - PLEASE RE-ENTER' TO MSGO            
               GO TO SEND-MAP00.                                        

      **********************************
           IF  REQCDI = 99                                              
               GO TO TEST-SPECIAL-THINGS.                               
      **********************************

           IF  (REQCDI GREATER 0) AND                                   
               (REQCDI LESS (NUM-CHOICES + 1))                          
               NEXT SENTENCE
           ELSE
               MOVE 'INVALID CODE - PLEASE RE-ENTER' TO MSGO            
               GO TO SEND-MAP00.                                        
           MOVE REQCDI TO TASK-SWITCH2.                                 
           GO TO WHICH-ONE.                                             

      **************************************************
       TEST-SPECIAL-THINGS.
           EXEC CICS HANDLE CONDITION
                     PGMIDERR(GEN-ERR)
                     END-EXEC.                                          
           EXEC CICS XCTL
                     PROGRAM('ASMDEMO')
                     END-EXEC.                                          
      **************************************************

       PROCESS-TABLE.
           IF  TASK-SWITCH3 EQUAL SPACE                                 
               MOVE 'DMAP01' TO MAPNAME                                 
               MOVE 'A' TO TASK-SWITCH3                                 
               GO TO SEND-REWRITE-RETURN.                               
           PERFORM INITIALIZE-TABLE                                     
             VARYING SUB-1 FROM 1 BY 1                                  
                     UNTIL SUB-1 GREATER +2                             
               AFTER SUB-2 FROM 1 BY 1                                  
                     UNTIL SUB-2 GREATER +9.                            
      **** NOTE * DISTRICT-POP IS NOT INITIALIZED ****
           SET STATE-X TO 1.                                            
           SET COUNTY-X TO 3.                                           
           SET DISTRICT-X TO 5.                                         
           ADD +1 TO DISTRICT-POP (STATE-X, COUNTY-X, DISTRICT-X).      
           MOVE SPACES TO TASK-TEXT OF TASK-STRUCTURE.                  
           MOVE ALL '*' TO TASK-TEXT OF TASK-STRUCTURE-2.               
           GO TO SEND-MAP00.                                            
       INITIALIZE-TABLE.
           MOVE SUB-1 TO STATE-NUMBER (SUB-1),                          
                         COUNTY-NUM1 (SUB-1, SUB-2).                    
           MOVE ','   TO COUNTY-COMM (SUB-1, SUB-2).                    
           MOVE SUB-2 TO COUNTY-NUM2 (SUB-1, SUB-2).                    

       DATA-NAME.
           IF  TASK-SWITCH3 EQUAL SPACE                                 
           MOVE 'A' TO TASK-SWITCH3                                     
           MOVE 'DMAP02' TO MAPNAME                                     
           GO TO SEND-REWRITE-RETURN.                                   
           GO TO SEND-MAP00.                                            
       SET-VAR-REC.
           IF TASK-SWITCH3 EQUAL SPACE                                  
           MOVE 'A' TO TASK-SWITCH3                                     
           MOVE 'DMAP03' TO MAPNAME                                     
           GO TO SEND-REWRITE-RETURN.                                   
           MOVE +100 TO VAR-REC-LEN.                                    
           MOVE ZERO TO VAR-SS.                                         
       PROCESS-VAR.
           ADD 1 TO VAR-SS.                                             
           IF VAR-SS GREATER THAN VAR-REC-LEN                           
               GO TO DO-READ-VAR.                                       
           MOVE '+' TO VAR-LENGTH-DATA(VAR-SS).                         
           GO TO PROCESS-VAR.                                           
       DO-READ-VAR.
      **** THIS SECTION OF THE DEMO SHOWS HOW YOU ****
      **** CAN LOOK AT VARIABLE LENGTH DATA **********
           MOVE +48 TO VAR-REC-LEN.                                     
           GO TO SEND-MAP00.                                            
       REPLACE-FILE.
           IF  TASK-SWITCH3 EQUAL SPACE                                 
               MOVE 'A' TO TASK-SWITCH3                                 
               MOVE 'DMAP04' TO MAPNAME                                 
               GO TO SEND-REWRITE-RETURN.                               
           IF  TASK-SWITCH3 EQUAL 'A'                                   
               GO TO READ-DATASET                                       
           ELSE
               GO TO SEND-MAP00.                                        
       READ-DATASET.
           EXEC CICS HANDLE CONDITION
                     DSIDERR
                     NOTOPEN(NOT-OPEN)
                     END-EXEC.                                          
           MOVE ZEROES TO RECORD-KEY.                                   
      **** NOTE * DATASET NAME IS WRONG ****
           EXEC CICS STARTBR DATASET('PROTH') RIDFLD(RECORD-KEY)
                     END-EXEC.                                          
           MOVE +1 TO SUB.                                              
           EXEC CICS READNEXT DATASET('PROTH')
                     SET(ADDRESS OF RECORD-AREA)
                     LENGTH(REC-LEN) RIDFLD(RECORD-KEY) END-EXEC.
      *
      *
      *    AFTER ENDING THE BROWSE WE MUST
      *    SET UP THE DISPLAY ARE FOR THE
      *    TERMINAL.  THIS WILL DISPLAY THE
      *    RECORD FROM THE CORRECT HELP FILE.
      *    AFTER DISPLAYING THE RECORD WE MUST
      *    BE SURE TO REMOVE THE REPLACE FILE
      *    FACILITY.  IF WE DONT, THE NEXT ONE
      *    TO USE THE OPTION WONT GET THE AEIL.
      *
       MOVE-RECORD.
           PERFORM TRANSFRM VARYING SUB FROM +1 BY +1                   
                             UNTIL  SUB GREATER REC-LEN                 
                              OR    SUB GREATER +160.                   
           MOVE REC-LEN TO RECLENO.                                     
           MOVE WK-REC-TEXT1 TO RECOUT1O.                               
           MOVE WK-REC-TEXT2 TO RECOUT2O.                               
           MOVE WK-REC-TEXT3 TO RECOUT3O.                               
           MOVE WK-REC-TEXT4 TO RECOUT4O.                               
           MOVE 'B' TO TASK-SWITCH3.                                    
           EXEC CICS SEND MAP('DMAP04A')
                     MAPSET ('IN25CMP') ERASE END-EXEC.                 
      *
           EXEC CICS ENDBR DATASET('PROTH') END-EXEC.
           MOVE TASK-CNTL TO CNTL-2.                                    
           MOVE TASK-PROTHLF TO PROTHLF-1.                              
      *
           EXEC CICS START TRANSID (TASK-CNTL) FROM (RFC-OFF)
                     LENGTH (LENGTH OF RFC-OFF) END-EXEC.               
           GO TO REWRITE-RETURN.                                        
       TRANSFRM.
           SET IDX TO 1.                                                
           SEARCH PRINTABLE AT END MOVE '.' TO WK-BYTE (SUB)            
            WHEN REC-TXT (SUB) = PRINTABLE (IDX)                        
             MOVE REC-TXT (SUB) TO WK-BYTE (SUB).                       
       NOT-OPEN.
           MOVE 'B' TO TASK-SWITCH3.                                    
           MOVE 'NOT OPEN' TO ERRORO.                                   
           EXEC CICS SEND
                     MAP ('DERROR')
                     MAPSET ('IN25CMP')
                     ERASE
                     END-EXEC.                                          
           GO TO REWRITE-RETURN.                                        

       MXR-OPTION.
           IF  TASK-SWITCH3 EQUAL SPACE                                 
               MOVE 'A' TO TASK-SWITCH3                                 
               MOVE 'DMAP05' TO MAPNAME                                 
               GO TO SEND-REWRITE-RETURN.                               
       LOOP-RTN.
           PERFORM CICS-LOOP 50 TIMES.                                  
           GO TO MXS-OPTION.                                            
       CICS-LOOP.
           EXEC CICS ASKTIME
                     END-EXEC.

       MXS-OPTION.
           IF  TASK-SWITCH3 EQUAL SPACE                                 
               MOVE 'A' TO TASK-SWITCH3                                 
               MOVE 'DMAP06' TO MAPNAME                                 
               GO TO SEND-REWRITE-RETURN.                               
           EXEC CICS HANDLE CONDITION
                     NOSTG(NO-STORAGE)
                     END-EXEC.                                          
           PERFORM GETMAIN-LOOP 10 TIMES.                               
           GO TO SEND-MAP00.                                            
       GETMAIN-LOOP.
           EXEC CICS GETMAIN
                     SET (ADDRESS OF GETMAIN-AREA)
                     LENGTH (6144)
                     END-EXEC.                                          
       NO-STORAGE.
           MOVE 'B' TO TASK-SWITCH3.                                    
           MOVE 'NO STORAGE' TO ERRORO.                                 
           EXEC CICS SEND
                     MAP ('DERROR')
                     MAPSET ('IN25CMP')
                     ERASE
                     END-EXEC.                                          
           GO TO REWRITE-RETURN.                                        

       SEND-REWRITE-RETURN.
           EXEC CICS SEND
                     MAP (MAPNAME)
                     MAPSET ('IN25CMP')
                     MAPONLY
                     ERASE
                     END-EXEC.                                          
       REWRITE-RETURN.
           EXEC CICS WRITEQ TS
                     REWRITE
                     QUEUE(TSQ-NAME)
                     FROM(TASK-STRUCTURE)
                     LENGTH(TSQ-LEN)
                     ITEM(TSQ-ITEM)
                     END-EXEC.                                          
           EXEC CICS RETURN
                     TRANSID(EIBTRNID)
                     COMMAREA(TASK-STRUCTURE)
                     LENGTH(COMMAREA-LEN)
                     END-EXEC.                                          

       GEN-ERR.
           MOVE 'GENERAL ERROR OCCURRED' TO ENDLINEO.                   
           GO TO SEND-END-MSG.                                          
       READ-FOR-UPDATE.
           IF TASK-SWITCH3 EQUAL SPACE                                  
               MOVE 'A' TO TASK-SWITCH3                                 
               MOVE 'DMAP07' TO MAPNAME                                 
               MOVE TASK-CNTL TO CNTL-1                                 
               EXEC CICS START
                    TRANSID(TASK-CNTL)
                    FROM(NUP-ON)
                    LENGTH(LENGTH OF NUP-ON)
                    END-EXEC                                            
               GO TO SEND-REWRITE-RETURN.                               
       NUP-READ.
           PERFORM SET-UP-READ.                                         
           EXEC CICS READ DATASET(TASK-PROTCPF) INTO(VSAM-AREA) EQUAL
                LENGTH(REC-LEN) RIDFLD(REC-RBA) UPDATE
                END-EXEC.                                               
       VSAM-REWRITE.
           MOVE 'THIS IS NOT A NAME  ' TO VSAM-NAME.                    
           EXEC CICS REWRITE
                DATASET(TASK-PROTCPF)
                FROM(VSAM-AREA)
                LENGTH(REC-LEN)
                END-EXEC.                                               
       AFTER-REWRITE.
           MOVE 'THIS IS AFTER REWRITE' TO TASK-TEXT                    
                 OF TASK-STRUCTURE.                                     
           GO TO SEND-MAP00.                                            
       SET-UP-READ.
           MOVE 681 TO REC-LEN.                                         
           EXEC CICS HANDLE CONDITION NOTOPEN(OPENFIL) END-EXEC.        
       OPENFIL.
           IF TASK-SWITCH3 = 'B' GO TO SEND-MAP00.                      
           MOVE 'B' TO TASK-SWITCH3.                                    
           MOVE 'PROTCPF NOT OPEN' TO ERRORO.                           
           EXEC CICS SEND
                     MAP ('DERROR')
                     MAPSET ('IN25CMP')
                     ERASE
                     END-EXEC.                                          
           GO TO REWRITE-RETURN.                                        
       STG-VIOL.
           IF TASK-SWITCH3 EQUAL SPACE                                  
               MOVE 'A' TO TASK-SWITCH3                                 
               MOVE 'DMAP08' TO MAPNAME                                 
               GO TO SEND-REWRITE-RETURN.                               
           EXEC CICS GETMAIN SET(ADDRESS OF STG-AREA)
                     LENGTH(80) END-EXEC.                               
           EXEC CICS FREEMAIN DATA(STG-AREA) END-EXEC.                  
           MOVE STG-AREA1 TO GETM-AREA1.                                
      *
      **** NOW MOVE NEW DATA INTO ACQUIRED AREA
      *
           MOVE NEW-DATA TO STG-AREA1.                                  
           GO TO SEND-MAP00.                                            
       WHICH-ONE.
           GO TO REPLACE-FILE                                           
                 MXR-OPTION                                             
                 READ-FOR-UPDATE                                        
                 SET-VAR-REC                                            
                 PROCESS-TABLE                                          
                 STG-VIOL                                               
                 LINK-DEML                                              
                 PROG-ABEND                                             
               DEPENDING ON TASK-SWITCH2.                               
       LINK-DEML.
           MOVE 'ABC' TO TASKNUM-CHAR.                                  
           IF TASK-SWITCH3 EQUAL SPACE                                  
               MOVE 'A' TO TASK-SWITCH3                                 
               MOVE 'DMAP09' TO MAPNAME                                 
               GO TO SEND-REWRITE-RETURN.                               
           EXEC CICS LINK PROGRAM('COBDEML')
                     COMMAREA(TASK-STRUCTURE)
                     LENGTH(LINK-COMMAREA-LEN)
                     END-EXEC.                                          
           GO TO SEND-MAP00.                                            
       PROG-ABEND.
           EXEC CICS ABEND ABCODE('MIKE') END-EXEC.                     
           GOBACK.