C GDT- GAME DEBUGGING TOOL
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
       SUBROUTINE GDT
       IMPLICIT INTEGER (A-Z)
       CHARACTER*2 DBGCMD(38), CMD
       INTEGER ARGTYP(38)
       LOGICAL VALID1,VALID2,VALID3
C
C PARSER OUTPUT
C
       LOGICAL PRSWON
       COMMON /PRSVEC/ PRSA,PRSI,PRSO,PRSWON,PRSCON
C
C PARSER STATE
C
       COMMON /ORPHS/ ORP(5)
       COMMON /LAST/ LASTIT
       COMMON /PV/ PVEC(5)
       COMMON /SYNTAX/ SYN(11)
C
C GAME STATE
C
       LOGICAL TELFLG
       COMMON /PLAY/ WINNER,HERE,TELFLG
       COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
     1       LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
C SCREEN OF LIGHT
C
       COMMON /SCREEN/ FROMDR,SCOLRM,SCOLAC
       COMMON /SCREEN/ SCOLDR(8),SCOLWL(12)
C
C PUZZLE ROOM
C
       COMMON /PUZZLE/ CPDR(16),CPWL(8),CPVEC(64)
C
C MISCELLANEOUS VARIABLES
C
       COMMON /STAR/ MBASE,STRBIT
       COMMON /CHAN/ INPCH,OUTCH,DBCH,ZRECL
C
C MESSAGE INDEX
C
       COMMON /RMSG/ MLNT,RTEXT(1050)
C
       COMMON /DEBUG/ DBGFLG,PRSFLG,GDTFLG
C
C ROOMS
C
       COMMON /ROOMS/ RLNT,RDESC2,EQR(200,5)
C
       COMMON /RINDEX/ WHOUS,LROOM,CELLA
       COMMON /RINDEX/ MTROL,MAZE1
       COMMON /RINDEX/ MGRAT,MAZ15
       COMMON /RINDEX/ FORE1,FORE3,CLEAR,RESER
       COMMON /RINDEX/ STREA,EGYPT,ECHOR
       COMMON /RINDEX/ TSHAF
       COMMON /RINDEX/ BSHAF,MMACH,DOME,MTORC
       COMMON /RINDEX/ CAROU
       COMMON /RINDEX/ RIDDL,LLD2,TEMP1,TEMP2,MAINT
       COMMON /RINDEX/ BLROO,TREAS,RIVR1,RIVR2,RIVR3,MCYCL
       COMMON /RINDEX/ RIVR4,RIVR5,FCHMP,FALLS,MBARR
       COMMON /RINDEX/ MRAIN,POG,VLBOT,VAIR1,VAIR2,VAIR3,VAIR4
       COMMON /RINDEX/ LEDG2,LEDG3,LEDG4,MSAFE,CAGER
       COMMON /RINDEX/ CAGED,TWELL,BWELL,ALICE,ALISM,ALITR
       COMMON /RINDEX/ MTREE,BKENT,BKVW,BKTWI,BKVAU,BKBOX
       COMMON /RINDEX/ CRYPT,TSTRS,MRANT,MREYE
       COMMON /RINDEX/ MRA,MRB,MRC,MRG,MRD,FDOOR
       COMMON /RINDEX/ MRAE,MRCE,MRCW,MRGE,MRGW,MRDW,INMIR
       COMMON /RINDEX/ SCORR,NCORR,PARAP,CELL,PCELL,NCELL
       COMMON /RINDEX/ CPANT,CPOUT,CPUZZ
C
       COMMON /OROOM2/ R2LNT,O2(20),R2(20)
C
C EXITS
C
       COMMON /EXITS/ XLNT,TRAVEL(900)
C
C OBJECTS
C
       COMMON /OBJCTS/ OLNT,EQO(220,14)
C
       COMMON /OINDEX/ GARLI,FOOD,GUNK,COAL,MACHI,DIAMO,TCASE,BOTTL
       COMMON /OINDEX/ WATER,ROPE,KNIFE,SWORD,LAMP,BLAMP,RUG
       COMMON /OINDEX/       LEAVE,TROLL,AXE
       COMMON /OINDEX/ RKNIF,KEYS,ICE,BAR
       COMMON /OINDEX/ COFFI,TORCH,TBASK,FBASK,IRBOX
       COMMON /OINDEX/ GHOST,TRUNK,BELL,BOOK,CANDL
       COMMON /OINDEX/ MATCH,TUBE,PUTTY,WRENC,SCREW,CYCLO,CHALI
       COMMON /OINDEX/ THIEF,STILL,WINDO,GRATE,DOOR
       COMMON /OINDEX/ HPOLE,LEAK,RBUTT,RAILI
       COMMON /OINDEX/ POT,STATU,IBOAT,DBOAT,PUMP,RBOAT
       COMMON /OINDEX/ STICK,BUOY,SHOVE,BALLO,RECEP,GUANO
       COMMON /OINDEX/ BROPE,HOOK1,HOOK2,SAFE,SSLOT,BRICK,FUSE
       COMMON /OINDEX/ GNOME,BLABE,DBALL,TOMB
       COMMON /OINDEX/ LCASE,CAGE,RCAGE,SPHER,SQBUT
       COMMON /OINDEX/ FLASK,POOL,SAFFR,BUCKE,ECAKE,ORICE,RDICE,BLICE
       COMMON /OINDEX/ ROBOT,FTREE,BILLS,PORTR,SCOL,ZGNOM
       COMMON /OINDEX/ EGG,BEGG,BAUBL,CANAR,BCANA
       COMMON /OINDEX/ YLWAL,RDWAL,PINDR,RBEAM
       COMMON /OINDEX/ ODOOR,QDOOR,CDOOR,NUM1,NUM8
       COMMON /OINDEX/ WARNI,CSLIT,GCARD,STLDR
       COMMON /OINDEX/ HANDS,WALL,LUNGS,SAILO,AVIAT,TEETH
       COMMON /OINDEX/ ITOBJ,EVERY,VALUA,OPLAY,WNORT,GWATE,MASTER
C
C CLOCK INTERRUPTS
C
       LOGICAL CFLAG
       COMMON /CEVENT/ CLNT,EQC(25,2),CFLAG(25)
C
C VILLAINS AND DEMONS
C
       LOGICAL THFFLG,SWDACT,THFACT
       COMMON /HACK/ THFPOS,THFFLG,THFACT,SWDACT,SWDSTA
       COMMON /VILL/ VLNT,EQV(4,5)
C
C ADVENTURERS
C
       COMMON /ADVS/ ALNT,EQA(4,7)
C
C FLAGS
C
       LOGICAL FLAGS(46)
       INTEGER SWITCH(22)
       LOGICAL TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF
       LOGICAL DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF
       LOGICAL MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF
       LOGICAL EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF
       LOGICAL GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF
       LOGICAL GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF
       LOGICAL MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF
       LOGICAL FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF,
     1       DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
     2       MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
     3       EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
     4       GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
     5       GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
     6       MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
     7       FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ SWITCH
       EQUIVALENCE (FLAGS(1),TROLLF)
       CHARACTER*2 GDTCOD(2)
C
C FUNCTIONS AND DATA
C
       VALID1(A1,L1)=(A1.GT.0).AND.(A1.LE.L1)
       VALID2(A1,A2,L1)=VALID1(A1,L1).AND.VALID1(A2,L1).AND.
     1       (A1.LE.A2)
       VALID3(A1,L1,A2,L2)=VALID1(A1,L1).AND.VALID1(A2,L2)
       DATA CMDMAX/38/
       DATA DBGCMD/'DR','DO','DA','DC','DX','DH','DL','DV','DF','DS',
     1       'AF','HE','NR','NT','NC','ND','RR','RT','RC','RD',
     2       'TK','EX','AR','AO','AA','AC','AX','AV','D2','DN',
     3       'AN','DM','DT','AH','DP','PD','DZ','AZ'/
       DATA ARGTYP/  2 ,  2 ,  2 ,  2 ,  2 ,  0 ,  0 ,  2 ,  2 ,  0 ,
     1         1 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,
     2         1 ,  0 ,  3 ,  3 ,  3 ,  3 ,  1 ,  3 ,  2 ,  2 ,
     3         1 ,  2 ,  1 ,  0 ,  0 ,  0 ,  0 ,  1 /
C GDT, PAGE 2
C
C FIRST, VALIDATE THAT THE CALLER IS AN IMPLEMENTER.
C
       FMAX=46
C SET ARRAY LIMITS.
       SMAX=22
C
       WRITE(OUTCH,8000)
       READ(INPCH,8001)GDTCOD
8000       FORMAT(1X,'CODE?')
8001       FORMAT(2A2)
       IF(GDTCOD(1).NE.'BE'.OR.GDTCOD(2).NE.'AR')RETURN
c GDT, PAGE 2A
C
C HERE TO GET NEXT COMMAND
C
2000       WRITE(OUTCH,200)
C OUTPUT PROMPT.
       READ(INPCH,210) CMD
C GET COMMAND.
       IF(CMD.EQ.'  ') GO TO 2000
C IGNORE BLANKS.
       DO 2100 I=1,CMDMAX
C LOOK IT UP.
         IF(CMD.EQ.DBGCMD(I)) GO TO 2300
C FOUND?
2100       CONTINUE
2200       WRITE(OUTCH,220)
C NO, LOSE.
       GO TO 2000
C
200       FORMAT(' GDT:')
210       FORMAT(A2)
220       FORMAT(' ?')
230       FORMAT(2I6)
240       FORMAT(I6)
225       FORMAT(' Limits:   ')
235       FORMAT(' Entry:    ')
245       FORMAT(' Idx,Ary:  ')
c
2300       GO TO (2400,2500,2600,2700),ARGTYP(I)+1
C BRANCH ON ARG TYPE.
       GO TO 2200
C ILLEGAL TYPE.
C
2700       WRITE(OUTCH,245)
C TYPE 3, REQUEST ARRAY COORDS.
       READ(INPCH,230) J,K
       GO TO 2400
C
2600       WRITE(OUTCH,225)
C TYPE 2, READ BOUNDS.
       READ(INPCH,230) J,K
       IF(K.EQ.0) K=J
       GO TO 2400
C
2500       WRITE(OUTCH,235)
C TYPE 1, READ ENTRY NO.
       READ(INPCH,240) J
2400       GO TO (10000,11000,12000,13000,14000,15000,16000,17000,18000,
     1 19000,20000,21000,22000,23000,24000,25000,26000,27000,28000,
     2 29000,30000,31000,32000,33000,34000,35000,36000,37000,38000,
     3 39000,40000,41000,42000,43000,44000,45000,46000,47000),I
       GO TO 2200
C WHAT???
C GDT, PAGE 3
C
C DR-- DISPLAY ROOMS
C
10000       IF(.NOT.VALID2(J,K,RLNT)) GO TO 2200
C ARGS VALID?
       WRITE(OUTCH,300)
C COL HDRS.
       DO 10100 I=J,K
         WRITE(OUTCH,310) I,(EQR(I,L),L=1,5)
10100       CONTINUE
       GO TO 2000
C
300       FORMAT(' RM#  DESC1  EXITS ACTION  VALUE  FLAGS')
310       FORMAT(1X,I3,4(1X,I6),1X,Z6)
C
C DO-- DISPLAY OBJECTS
C
11000       IF(.NOT.VALID2(J,K,OLNT)) GO TO 2200
C ARGS VALID?
       WRITE(OUTCH,320)
C COL HDRS
       DO 11100 I=J,K
         WRITE(OUTCH,330) I,(EQO(I,L),L=1,14)
11100       CONTINUE
       GO TO 2000
C
320       FORMAT(' OB# DESC1 DESC2 DESCO ACT FLAGS1 FLAGS2 FVL TVL
     1  SIZE CAPAC ROOM ADV CON  READ')
330       FORMAT(1X,I3,3I6,I4,2Z7,2I4,2I6,1X,3I4,I6)
C
C DA-- DISPLAY ADVENTURERS
C
12000       IF(.NOT.VALID2(J,K,ALNT)) GO TO 2200
C ARGS VALID?
       WRITE(OUTCH,340)
       DO 12100 I=J,K
         WRITE(OUTCH,350) I,(EQA(I,L),L=1,7)
12100       CONTINUE
       GO TO 2000
C
340    FORMAT(' AD#   ROOM  SCORE  VEHIC OBJECT ACTION  STREN  FLAGS')
350       FORMAT(1X,I3,6(1X,I6),1X,Z6)
C
C DC-- DISPLAY CLOCK EVENTS
C
13000       IF(.NOT.VALID2(J,K,CLNT)) GO TO 2200
C ARGS VALID?
       WRITE(OUTCH,360)
       DO 13100 I=J,K
         WRITE(OUTCH,370) I,(EQC(I,L),L=1,2),CFLAG(I)
13100       CONTINUE
       GO TO 2000
C
360       FORMAT(' CL#   TICK ACTION  FLAG')
370       FORMAT(1X,I3,1X,I6,1X,I6,5X,L1)
C
C DX-- DISPLAY EXITS
C
14000       IF(.NOT.VALID2(J,K,XLNT)) GO TO 2200
C ARGS VALID?
       WRITE(OUTCH,380)
C COL HDRS.
       DO 14100 I=J,K,10
C TEN PER LINE.
         L=MIN0(I+9,K)
C COMPUTE END OF LINE.
         WRITE(OUTCH,390) I,L,(TRAVEL(L1),L1=I,L)
14100       CONTINUE
       GO TO 2000
C
380       FORMAT('   RANGE   CONTENTS')
390       FORMAT(1X,I3,'-',I3,3X,10Z7)
C
C DH-- DISPLAY HACKS
C
15000       WRITE(OUTCH,400) THFPOS,THFFLG,THFACT,SWDACT,SWDSTA
       GO TO 2000
C
400       FORMAT(' THFPOS=',I6,', THFFLG=',L2,',THFACT=',L2/
     1' SWDACT=',L2,', SWDSTA=',I2)
C
C DL-- DISPLAY LENGTHS
C
16000       WRITE(OUTCH,410) RLNT,XLNT,OLNT,CLNT,VLNT,ALNT,MLNT,R2LNT,
     1       MBASE,STRBIT
       GO TO 2000
C
410       FORMAT(' R=',I6,', X=',I6,', O=',I6,', C=',I6/
     1' V=',I6,', A=',I6,', M=',I6,', R2=',I5/
     2' MBASE=',I6,', STRBIT=',I6)
C
C DV-- DISPLAY VILLAINS
C
17000       IF(.NOT.VALID2(J,K,VLNT)) GO TO 2200
C ARGS VALID?
       WRITE(OUTCH,420)
C COL HDRS
       DO 17100 I=J,K
         WRITE(OUTCH,430) I,(EQV(I,L),L=1,5)
17100       CONTINUE
       GO TO 2000
C
420       FORMAT(' VL# OBJECT   PROB   OPPS   BEST  MELEE')
430       FORMAT(1X,I3,5(1X,I6))
C
C DF-- DISPLAY FLAGS
C
18000       IF(.NOT.VALID2(J,K,FMAX)) GO TO 2200
C ARGS VALID?
       DO 18100 I=J,K
         WRITE(OUTCH,440) I,FLAGS(I)
18100       CONTINUE
       GO TO 2000
C
440       FORMAT(' Flag #',I2,' = ',L1)
C
C DS-- DISPLAY STATE
C
19000       WRITE(OUTCH,450) PRSA,PRSO,PRSI,PRSWON,PRSCON
       WRITE(OUTCH,460) WINNER,HERE,TELFLG
       WRITE(OUTCH,470) MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,LTSHFT,BLOC,
     1       MUNGRM,HS,EGSCOR,EGMXSC
       WRITE(OUTCH,475) FROMDR,SCOLRM,SCOLAC
       GO TO 2000
C
450       FORMAT(' Parse vector=',3(1X,I6),1X,L6,1X,I6)
460       FORMAT(' Play vector= ',2(1X,I6),1X,L6)
470       FORMAT(' State vector=',9(1X,I6)/14X,2(1X,I6))
475       FORMAT(' Scol vector= ',1X,Z6,2(1X,I6))
C GDT, PAGE 4
C
C AF-- ALTER FLAGS
C
20000       IF(.NOT.VALID1(J,FMAX)) GO TO 2200
C ENTRY NO VALID?
       WRITE(OUTCH,480) FLAGS(J)
C TYPE OLD, GET NEW.
       READ(INPCH,490) FLAGS(J)
       GO TO 2000
C
480       FORMAT(' Old=',L2,6X,'New: ')
490       FORMAT(L1)
C
C 21000-- HELP
C
21000       WRITE(OUTCH,900)
       GO TO 2000
C
900       FORMAT(' Valid commands are:'/' AA- Alter ADVS'/
     1' AC- Alter CEVENT'/' AF- Alter FINDEX'/' AH- Alter HERE'/
     2' AN- Alter switches'/' AO- Alter OBJCTS'/' AR- Alter ROOMS'/
     3' AV- Alter VILLS'/' AX- Alter EXITS'/
     3' AZ- Alter PUZZLE'/' DA- Display ADVS'/
     4' DC- Display CEVENT'/' DF- Display FINDEX'/' DH- Display HACKS'/
     5' DL- Display lengths'/' DM- Display RTEXT'/
     6' DN- Display switches'/
     6' DO- Display OBJCTS'/' DP- Display parser'/
     6' DR- Display ROOMS'/' DS- Display state'/' DT- Display text'/
     7' DV- Display VILLS'/' DX- Display EXITS'/' DZ- Display PUZZLE'/
     8' D2- Display ROOM2'/' EX- Exit'/' HE- Type this message'/
     9' NC- No cyclops'/' ND- No deaths'/' NR- No robber'/
     1' NT- No troll'/' PD- Program detail'/
     1' RC- Restore cyclops'/' RD- Restore deaths'/
     2' RR- Restore robber'/' RT- Restore troll'/' TK- Take.')
C
C NR-- NO ROBBER
C
22000       THFFLG=.FALSE.
C DISABLE ROBBER.
       THFACT=.FALSE.
       CALL NEWSTA(THIEF,0,0,0,0)
C VANISH THIEF.
       WRITE(OUTCH,500)
       GO TO 2000
C
500       FORMAT(' No robber.')
C
C NT-- NO TROLL
C
23000       TROLLF=.TRUE.
       CALL NEWSTA(TROLL,0,0,0,0)
       WRITE(OUTCH,510)
       GO TO 2000
C
510       FORMAT(' No troll.')
C
C NC-- NO CYCLOPS
C
24000       CYCLOF=.TRUE.
       CALL NEWSTA(CYCLO,0,0,0,0)
       WRITE(OUTCH,520)
       GO TO 2000
C
520       FORMAT(' No cyclops.')
C
C ND-- IMMORTALITY MODE
C
25000       DBGFLG=1
       WRITE(OUTCH,530)
       GO TO 2000
C
530       FORMAT(' No deaths.')
C
C RR-- RESTORE ROBBER
C
26000       THFACT=.TRUE.
       WRITE(OUTCH,540)
       GO TO 2000
C
540       FORMAT(' Restored robber.')
C
C RT-- RESTORE TROLL
C
27000       TROLLF=.FALSE.
       CALL NEWSTA(TROLL,0,MTROL,0,0)
       WRITE(OUTCH,550)
       GO TO 2000
C
550       FORMAT(' Restored troll.')
C
C RC-- RESTORE CYCLOPS
C
28000       CYCLOF=.FALSE.
       MAGICF=.FALSE.
       CALL NEWSTA(CYCLO,0,MCYCL,0,0)
       WRITE(OUTCH,560)
       GO TO 2000
C
560       FORMAT(' Restored cyclops.')
C
C RD-- MORTAL MODE
C
29000       DBGFLG=0
       WRITE(OUTCH,570)
       GO TO 2000
C
570       FORMAT(' Restored deaths.')
C GDT, PAGE 5
C
C TK-- TAKE
C
30000       IF(.NOT.VALID1(J,OLNT)) GO TO 2200
C VALID OBJECT?
       CALL NEWSTA(J,0,0,0,WINNER)
C YES, TAKE OBJECT.
       WRITE(OUTCH,580)
C TELL.
       GO TO 2000
C
580       FORMAT(' Taken.')
C
C EX-- GOODBYE
C
31000       PRSCON=1
       RETURN
C
C AR--       ALTER ROOM ENTRY
C
32000       IF(.NOT.VALID3(J,RLNT,K,5)) GO TO 2200
C INDICES VALID?
       WRITE(OUTCH,590) EQR(J,K)
C TYPE OLD, GET NEW.
       READ(INPCH,600) EQR(J,K)
       GO TO 2000
C
590       FORMAT(' Old= ',I6,6X,'New: ')
600       FORMAT(I6)
C
C AO-- ALTER OBJECT ENTRY
C
33000       IF(.NOT.VALID3(J,OLNT,K,14)) GO TO 2200
C INDICES VALID?
       WRITE(OUTCH,590) EQO(J,K)
       READ(INPCH,600) EQO(J,K)
       GO TO 2000
C
C AA-- ALTER ADVS ENTRY
C
34000       IF(.NOT.VALID3(J,ALNT,K,7)) GO TO 2200
C INDICES VALID?
       WRITE(OUTCH,590) EQA(J,K)
       READ(INPCH,600) EQA(J,K)
       GO TO 2000
C
C AC-- ALTER CLOCK EVENTS
C
35000       IF(.NOT.VALID3(J,CLNT,K,3)) GO TO 2200
C INDICES VALID?
       IF(K.EQ.3) GO TO 35500
C FLAGS ENTRY?
       WRITE(OUTCH,590) EQC(J,K)
       READ(INPCH,600) EQC(J,K)
       GO TO 2000
C
35500       WRITE(OUTCH,480) CFLAG(J)
       READ(INPCH,490) CFLAG(J)
       GO TO 2000
C GDT, PAGE 6
C
C AX-- ALTER EXITS
C
36000       IF(.NOT.VALID1(J,XLNT)) GO TO 2200
C ENTRY NO VALID?
       WRITE(OUTCH,610) TRAVEL(J)
       READ(INPCH,620) TRAVEL(J)
       GO TO 2000
C
610       FORMAT(' Old= ',Z6,6X,'New: ')
620       FORMAT(Z6)
C
C AV-- ALTER VILLAINS
C
37000       IF(.NOT.VALID3(J,VLNT,K,5)) GO TO 2200
C INDICES VALID?
       WRITE(OUTCH,590) EQV(J,K)
       READ(INPCH,600) EQV(J,K)
       GO TO 2000
C
C D2-- DISPLAY ROOM2 LIST
C
38000       IF(.NOT.VALID2(J,K,R2LNT)) GO TO 2200
       DO 38100 I=J,K
         WRITE(OUTCH,630) I,R2(I),O2(I)
38100       CONTINUE
       GO TO 2000
C
630       FORMAT(' #',I2,'   Room=',I6,'   Obj=',I6)
C
C DN-- DISPLAY SWITCHES
C
39000       IF(.NOT.VALID2(J,K,SMAX)) GO TO 2200
C VALID?
       DO 39100 I=J,K
         WRITE(OUTCH,640) I,SWITCH(I)
39100       CONTINUE
       GO TO 2000
C
640       FORMAT(' Switch #',I2,' = ',I6)
C
C AN-- ALTER SWITCHES
C
40000       IF(.NOT.VALID1(J,SMAX)) GO TO 2200
C VALID ENTRY?
       WRITE(OUTCH,590) SWITCH(J)
       READ(INPCH,600) SWITCH(J)
       GO TO 2000
C
C DM-- DISPLAY MESSAGES
C
41000       IF(.NOT.VALID2(J,K,MLNT)) GO TO 2200
C VALID LIMITS?
       WRITE(OUTCH,380)
       DO 41100 I=J,K,10
         L=MIN0(I+9,K)
         WRITE(OUTCH,650) I,L,(RTEXT(L1),L1=I,L)
41100       CONTINUE
       GO TO 2000
C
650       FORMAT(1X,I3,'-',I3,3X,10(1X,I6))
C
C DT-- DISPLAY TEXT
C
42000       CALL RSPEAK(J)
       GO TO 2000
C
C AH--       ALTER HERE
C
43000       WRITE(OUTCH,590) HERE
       READ(INPCH,600) HERE
       EQA(1,1)=HERE
       GO TO 2000
C
C DP--       DISPLAY PARSER STATE
C
44000       WRITE(OUTCH,660) ORP,LASTIT,PVEC,SYN
       GO TO 2000
C
660       FORMAT(' ORPHS= ',I7,Z7,4I7/
     1' PV=    ',Z7,4I7/' SYN=   ',6Z7/15X,5Z7)
C
C PD--       PROGRAM DETAIL DEBUG
C
45000       WRITE(OUTCH,610) PRSFLG
C TYPE OLD, GET NEW.
       READ(INPCH,620) PRSFLG
       GO TO 2000
C
C DZ--       DISPLAY PUZZLE ROOM
C
46000       DO 46100 I=1,64,8
C DISPLAY PUZZLE
         WRITE(OUTCH,670) (CPVEC(J),J=I,I+7)
46100       CONTINUE
       GO TO 2000
C
670       FORMAT(2X,8I3)
C
C AZ--       ALTER PUZZLE ROOM
C
47000       IF(.NOT.VALID1(J,64)) GO TO 2200
C VALID ENTRY?
       WRITE(OUTCH,590) CPVEC(J)
C OUTPUT OLD,
       READ(OUTCH,600) CPVEC(J)
C GET NEW.
       GO TO 2000
C
       END
