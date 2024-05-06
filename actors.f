C AAPPLI- APPLICABLES FOR ADVENTURERS
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
       LOGICAL FUNCTION AAPPLI(RI)
       IMPLICIT INTEGER (A-Z)
       LOGICAL F,MOVETO
C
C PARSER OUTPUT
C
       LOGICAL PRSWON
       COMMON /PRSVEC/ PRSA,PRSI,PRSO,PRSWON,PRSCON
C
C GAME STATE
C
       LOGICAL TELFLG
       COMMON /PLAY/ WINNER,HERE,TELFLG
C
C ROOMS
C
       COMMON /ROOMS/ RLNT,RDESC2,RDESC1(200),REXIT(200),
     1         RACTIO(200),RVAL(200),RFLAG(200)
C
       COMMON /RFLAG/ RSEEN,RLIGHT,RLAND,RWATER,RAIR,
     1         RSACRD,RFILL,RMUNG,RBUCK,RHOUSE,RNWALL,REND
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
C EXITS
C
       COMMON /XSRCH/ XMIN,XMAX,XDOWN,XUP,
     &         XNORTH,XSOUTH,XENTER,XEXIT,XEAST,XWEST
C
C OBJECTS
C
       COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
     1         OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
     2         OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
     3         OADV(220),OCAN(220),OREAD(220)
C
       COMMON /OFLAGS/ VISIBT,READBT,TAKEBT,DOORBT,TRANBT,FOODBT,
     1         NDSCBT,DRNKBT,CONTBT,LITEBT,VICTBT,BURNBT,FLAMBT,
     2         TOOLBT,TURNBT,ONBT
       COMMON /OFLAGS/ FINDBT,SLEPBT,SCRDBT,TIEBT,CLMBBT,ACTRBT,
     1         WEAPBT,FITEBT,VILLBT,STAGBT,TRYBT,NOCHBT,OPENBT,
     2         TCHBT,VEHBT,SCHBT
C
       COMMON /OINDEX/ GARLI,FOOD,GUNK,COAL,MACHI,DIAMO,TCASE,BOTTL
       COMMON /OINDEX/ WATER,ROPE,KNIFE,SWORD,LAMP,BLAMP,RUG
       COMMON /OINDEX/ LEAVE,TROLL,AXE
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
       COMMON /CEVENT/ CLNT,CTICK(25),CACTIO(25),CFLAG(25)
C
       COMMON /CINDEX/ CEVCUR,CEVMNT,CEVLNT,CEVMAT,CEVCND,
     1         CEVBAL,CEVBRN,CEVFUS,CEVLED,CEVSAF,CEVVLG,
     2         CEVGNO,CEVBUC,CEVSPH,CEVEGH,
     3         CEVFOR,CEVSCL,CEVZGI,CEVZGO,CEVSTE,
     4         CEVMRS,CEVPIN,CEVINQ,CEVFOL
     5
C
C ADVENTURERS
C
       COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
     1         AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
       COMMON /AINDEX/ PLAYER,AROBOT,AMASTR
C
C VERBS
C
       COMMON /VINDEX/ CINTW,DEADXW,FRSTQW,INXW,OUTXW
       COMMON /VINDEX/ WALKIW,FIGHTW,FOOW
       COMMON /VINDEX/ MELTW,READW,INFLAW,DEFLAW,ALARMW,EXORCW
       COMMON /VINDEX/ PLUGW,KICKW,WAVEW,RAISEW,LOWERW,RUBW
       COMMON /VINDEX/ PUSHW,UNTIEW,TIEW,TIEUPW,TURNW,BREATW
       COMMON /VINDEX/ KNOCKW,LOOKW,EXAMIW,SHAKEW,MOVEW,TRNONW,TRNOFW
       COMMON /VINDEX/OPENW,CLOSEW,FINDW,WAITW,SPINW,BOARDW,UNBOAW,TAKEW
       COMMON /VINDEX/ INVENW,FILLW,EATW,DRINKW,BURNW
       COMMON /VINDEX/ MUNGW,KILLW,ATTACW,SWINGW
       COMMON /VINDEX/ WALKW,TELLW,PUTW,DROPW,GIVEW,POURW,THROWW
       COMMON /VINDEX/ DIGW,LEAPW,STAYW,FOLLOW
       COMMON /VINDEX/ HELLOW,LOOKIW,LOOKUW,PUMPW,WINDW
       COMMON /VINDEX/ CLMBW,CLMBUW,CLMBDW,TRNTOW
C
C FLAGS
C
       LOGICAL TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF
       LOGICAL DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF
       LOGICAL MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF
       LOGICAL EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF
       LOGICAL GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF
       LOGICAL GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF
       LOGICAL MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF
       LOGICAL FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF,
     1         DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
     2         MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
     3         EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
     4         GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
     5         GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
     6         MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
     7         FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ BTIEF,BINFF
       COMMON /FINDEX/ RVMNT,RVCLR,RVCYC,RVSND,RVGUA
       COMMON /FINDEX/ ORRUG,ORCAND,ORMTCH,ORLAMP
       COMMON /FINDEX/ MDIR,MLOC,POLEUF
       COMMON /FINDEX/ QUESNO,NQATT,CORRCT
       COMMON /FINDEX/ LCELL,PNUMB,ACELL,DCELL,CPHERE
C AAPPLI, PAGE 2
C
       IF(RI.EQ.0) GO TO 10 
C IF ZERO, NO APP.
       AAPPLI=.TRUE.   
C ASSUME WINS.
       GO TO (1000,2000),RI 
C BRANCH ON ADV.
       CALL BUG(11,RI)
C
C COMMON FALSE RETURN.
C
10      AAPPLI=.FALSE.
       RETURN
C
C A1--  ROBOT.  PROCESS MOST COMMANDS GIVEN TO ROBOT.
C
1000    IF((PRSA.NE.RAISEW).OR.(PRSO.NE.RCAGE)) GO TO 1200
       CFLAG(CEVSPH)=.FALSE.    
C ROBOT RAISED CAGE.
       WINNER=PLAYER   
C RESET FOR PLAYER.
       F=MOVETO(CAGER,WINNER)   
C MOVE TO NEW ROOM.
       CALL NEWSTA(CAGE,567,CAGER,0,0)   
C INSTALL CAGE IN ROO
       CALL NEWSTA(ROBOT,0,CAGER,0,0)    
C INSTALL ROBOT IN RO
       AROOM(AROBOT)=CAGER  
C ALSO MOVE ROBOT/ADV
       CAGESF=.TRUE.   
C CAGE SOLVED.
       OFLAG1(ROBOT)=ZAND(OFLAG1(ROBOT),ZNOT(NDSCBT))
       OFLAG1(SPHER)=ZOR(OFLAG1(SPHER),TAKEBT)  
C RESET FLAGS.
       RETURN
C
1200    IF((PRSA.NE.DRINKW).AND.(PRSA.NE.EATW)) GO TO 1300
       CALL RSPEAK(568) 
C EAT OR DRINK, JOKE.
       RETURN
C
1300    IF(PRSA.NE.READW) GO TO 1400  
C READ,
       CALL RSPEAK(569) 
C JOKE.
       RETURN
C
1400    IF((PRSA.EQ.WALKW).OR.(PRSA.EQ.TAKEW).OR.(PRSA.EQ.DROPW)
     1   .OR.(PRSA.EQ.PUTW).OR.(PRSA.EQ.PUSHW).OR.(PRSA.EQ.THROWW)
     2    .OR.(PRSA.EQ.TURNW).OR.(PRSA.EQ.LEAPW)) GO TO 10
       CALL RSPEAK(570) 
C JOKE.
       RETURN
C AAPPLI, PAGE 3
C
C A2--  MASTER.  PROCESS MOST COMMANDS GIVEN TO MASTER.
C
2000    IF(ZAND(OFLAG2(QDOOR),OPENBT).NE.0) GO TO 2100
       CALL RSPEAK(783) 
C NO MASTER YET.
       RETURN
C
2100    IF(PRSA.NE.WALKW) GO TO 2200  
C WALK?
       I=784  
C ASSUME WONT.
       IF(((HERE.EQ.SCORR).AND.
     1         ((PRSO.EQ.XNORTH).OR.(PRSO.EQ.XENTER))).OR.
     2     ((HERE.EQ.NCORR).AND.
     3         ((PRSO.EQ.XSOUTH).OR.(PRSO.EQ.XENTER))))
     4         I=785   
C IF PRISON, CANT.
       CALL RSPEAK(I)
       RETURN
C
2200    IF((PRSA.EQ.TAKEW).OR.(PRSA.EQ.DROPW).OR.(PRSA.EQ.PUTW).OR.
     1     (PRSA.EQ.THROWW).OR.(PRSA.EQ.PUSHW).OR.(PRSA.EQ.TURNW).OR.
     2     (PRSA.EQ.SPINW).OR.(PRSA.EQ.TRNTOW).OR.(PRSA.EQ.FOLLOW).OR.
     3     (PRSA.EQ.STAYW).OR.(PRSA.EQ.OPENW).OR.(PRSA.EQ.CLOSEW).OR.
     4     (PRSA.EQ.KILLW)) GO TO 10  
C MASTER CAN DO.
       CALL RSPEAK(786) 
C MASTER CANT DO IT.
       RETURN
C
       END
C THIEFD-       INTERMOVE THIEF DEMON
C
C DECLARATIONS
C
       SUBROUTINE THIEFD
       IMPLICIT INTEGER (A-Z)
       LOGICAL DFLAG,ONCE,PROB,QHERE,QSTILL,LIT,WINNIN
C
C GAME STATE
C
       LOGICAL TELFLG
       COMMON /PLAY/ WINNER,HERE,TELFLG
C
       COMMON /DEBUG/ DBGFLG,PRSFLG,GDTFLG
C
C ROOMS
C
       COMMON /ROOMS/ RLNT,RDESC2,RDESC1(200),REXIT(200),
     1         RACTIO(200),RVAL(200),RFLAG(200)
C
       COMMON /RFLAG/ RSEEN,RLIGHT,RLAND,RWATER,RAIR,
     1         RSACRD,RFILL,RMUNG,RBUCK,RHOUSE,RNWALL,REND
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
C OBJECTS
C
       COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
     &         OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
     &         OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
     &         OADV(220),OCAN(220),OREAD(220)
C
       COMMON /OFLAGS/ VISIBT,READBT,TAKEBT,DOORBT,TRANBT,FOODBT,
     &         NDSCBT,DRNKBT,CONTBT,LITEBT,VICTBT,BURNBT,FLAMBT,
     &         TOOLBT,TURNBT,ONBT
       COMMON /OFLAGS/ FINDBT,SLEPBT,SCRDBT,TIEBT,CLMBBT,ACTRBT,
     &         WEAPBT,FITEBT,VILLBT,STAGBT,TRYBT,NOCHBT,OPENBT,
     &         TCHBT,VEHBT,SCHBT
C
       COMMON /OINDEX/ GARLI,FOOD,GUNK,COAL,MACHI,DIAMO,TCASE,BOTTL
       COMMON /OINDEX/ WATER,ROPE,KNIFE,SWORD,LAMP,BLAMP,RUG
       COMMON /OINDEX/ LEAVE,TROLL,AXE
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
C VILLAINS AND DEMONS
C
       LOGICAL THFFLG,SWDACT,THFACT
       COMMON /HACK/ THFPOS,THFFLG,THFACT,SWDACT,SWDSTA
C
C FLAGS
C
       LOGICAL TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF
       LOGICAL DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF
       LOGICAL MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF
       LOGICAL EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF
       LOGICAL GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF
       LOGICAL GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF
       LOGICAL MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF
       LOGICAL FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF,
     1         DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
     2         MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
     3         EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
     4         GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
     5         GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
     6         MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
     7         FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ BTIEF,BINFF
       COMMON /FINDEX/ RVMNT,RVCLR,RVCYC,RVSND,RVGUA
       COMMON /FINDEX/ ORRUG,ORCAND,ORMTCH,ORLAMP
       COMMON /FINDEX/ MDIR,MLOC,POLEUF
       COMMON /FINDEX/ QUESNO,NQATT,CORRCT
       COMMON /FINDEX/ LCELL,PNUMB,ACELL,DCELL,CPHERE
C
C FUNCTIONS AND DATA
C
       QSTILL(R)=(QHERE(STILL,R).OR.(OADV(STILL).EQ.-THIEF))
C THIEFD, PAGE 2
C "100000 OCTAL BELOW
       DFLAG=ZAND(PRSFLG,Q16384+16384).NE.0   
       Q16384=16384   
C SET UP DETAIL FLAG.
       ONCE=.FALSE.    
C INIT FLAG.
1025    RHERE=OROOM(THIEF)   
C VISIBLE POS.
       IF(RHERE.NE.0) THFPOS=RHERE
C
       IF(THFPOS.EQ.HERE) GO TO 1100 
C THIEF IN WIN RM?
       IF(THFPOS.NE.TREAS) GO TO 1400    
C THIEF NOT IN TREAS?
C
C THIEF IS IN TREASURE ROOM, AND WINNER IS NOT.
C
       IF(RHERE.EQ.0) GO TO 1050 
C VISIBLE?
       CALL NEWSTA(THIEF,0,0,0,0)    
C YES, VANISH.
       RHERE=0
       IF(QSTILL(TREAS)) CALL NEWSTA(STILL,0,0,THIEF,0)
1050    I=ROBADV(-THIEF,THFPOS,0,0)  
C DROP VALUAB
       IF(QHERE(EGG,THFPOS)) OFLAG2(EGG)=ZOR(OFLAG2(EGG),OPENBT)
       GO TO 1700
C
C THIEF AND WINNER IN SAME ROOM.
C
1100    IF(THFPOS.EQ.TREAS) GO TO 1700    
C IF TREAS ROOM, NOTH
       IF(ZAND(RFLAG(THFPOS),RLIGHT).NE.0) GO TO 1400
C NOT IF LIGHT
       IF(THFFLG) GO TO 1300    
C THIEF ANNOUNCED?
       IF((RHERE.NE.0).OR.PROB(70,70)) GO TO 1150
C IF INVIS AND 30%
       IF(OCAN(STILL).NE.THIEF) GO TO 1700    
C ABORT IF NO STILLET
       CALL NEWSTA(THIEF,583,THFPOS,0,0)  
C INSERT THIEF INTO R
       THFFLG=.TRUE.   
C THIEF IS ANNOUNCED.
       RETURN
C
1150    IF((RHERE.EQ.0).OR.(ZAND(OFLAG2(THIEF),FITEBT).EQ.0))
     1         GO TO 1200   
C IF VISIBLE AND FIGH
       IF(WINNIN(THIEF,WINNER)) GO TO 1175    
C WINNING?
       CALL NEWSTA(THIEF,584,0,0,0)  
C NO, VANISH THIEF.
       OFLAG2(THIEF)=ZAND(OFLAG2(THIEF),ZNOT(FITEBT))
       IF(QSTILL(THFPOS)) CALL NEWSTA(STILL,0,0,THIEF,0)
       RETURN
C
1175    IF(PROB(90,90)) GO TO 1700    
C 90% CHANCE TO STAY.
C
1200    IF((RHERE.EQ.0).OR.PROB(70,70)) GO TO 1250
C IF VISIBLE AND 3
       CALL NEWSTA(THIEF,585,0,0,0)  
C VANISH THIEF.
       IF(QSTILL(THFPOS)) CALL NEWSTA(STILL,0,0,THIEF,0)
       RETURN
C
1300    IF(RHERE.EQ.0) GO TO 1700 
C ANNOUNCED.  VISIBLE
1250    IF(PROB(70,70)) RETURN   
C 70% CHANCE TO DO NO
       THFFLG=.TRUE.
       NR=ROBRM(THFPOS,100,0,0,-THIEF)+ROBADV(WINNER,0,0,-THIEF)
       I=586  
C ROBBED EM.
       IF(RHERE.NE.0) I=588 
C WAS HE VISIBLE?
       IF(NR.NE.0) I=I+1    
C DID HE GET ANYTHING
       CALL NEWSTA(THIEF,I,0,0,0)    
C VANISH THIEF.
       IF(QSTILL(THFPOS))
     1         CALL NEWSTA(STILL,0,0,THIEF,0) 
C RECLAIM STILLETTO.
       IF((NR.NE.0).AND..NOT.LIT(THFPOS)) CALL RSPEAK(406)
       RHERE=0
       GO TO 1700  
C ONWARD.
C
C NOT IN ADVENTURERS ROOM.
C
1400    CALL NEWSTA(THIEF,0,0,0,0)    
C VANISH.
       RHERE=0
       IF(QSTILL(THFPOS))
     1         CALL NEWSTA(STILL,0,0,THIEF,0)
       IF(ZAND(RFLAG(THFPOS),RSEEN).EQ.0) GO TO 1700  
C CANT ROB UN
       I=ROBRM(THFPOS,75,0,0,-THIEF) 
C ROB ROOM 75%.
       IF((THFPOS.LT.MAZE1).OR.(THFPOS.GT.MAZ15).OR.
     1         (HERE.LT.MAZE1).OR.(HERE.GT.MAZ15)) GO TO 1500
       DO 1450 I=1,OLNT 
C BOTH IN MAZE.
         IF(.NOT.QHERE(I,THFPOS).OR.PROB(60,60).OR.
     2         (ZAND(OFLAG1(I),(VISIBT+TAKEBT)).NE.(VISIBT+TAKEBT)))
     3         GO TO 1450
         CALL RSPSUB(590,ODESC2(I))  
C TAKE OBJECT.
         IF(PROB(40,20)) GO TO 1700
         CALL NEWSTA(I,0,0,0,-THIEF) 
C MOST OF THE TIME.
         OFLAG2(I)=ZOR(OFLAG2(I),TCHBT)
         GO TO 1700
1450    CONTINUE
       GO TO 1700
C
1500    DO 1550 I=1,OLNT 
C NOT IN MAZE.
         IF(.NOT.QHERE(I,THFPOS).OR.(OTVAL(I).NE.0).OR.PROB(80,60).OR.
     1         (ZAND(OFLAG1(I),(VISIBT+TAKEBT)).NE.(VISIBT+TAKEBT)))
     2         GO TO 1550
         CALL NEWSTA(I,0,0,0,-THIEF)
         OFLAG2(I)=ZOR(OFLAG2(I),TCHBT)
         GO TO 1700
1550    CONTINUE
C
C NOW MOVE TO NEW ROOM.
C
1700    IF(OADV(ROPE).EQ.-THIEF) DOMEF=.FALSE.
       IF(ONCE) GO TO 1800
       ONCE=.NOT.ONCE
1750    THFPOS=THFPOS-1  
C NEXT ROOM.
       IF(THFPOS.LE.0) THFPOS=RLNT
       IF(ZAND(RFLAG(THFPOS),(RLAND+RSACRD+REND)).NE.RLAND)
     1         GO TO 1750   
C MUST BE LAND, PROFA
       THFFLG=.FALSE.  
C NOT ANNOUNCED.
       GO TO 1025  
C ONCE MORE.
C
C ALL DONE.
C
1800    IF(THFPOS.EQ.TREAS) RETURN   
C IN TREASURE
       J=591  
C NO, DROP STUFF.
       IF(THFPOS.NE.HERE) J=0
       DO 1850 I=1,OLNT
         IF((OADV(I).NE.-THIEF).OR.PROB(70,70).OR.
     1         (OTVAL(I).GT.0)) GO TO 1850
         CALL NEWSTA(I,J,THFPOS,0,0)
         J=0
1850    CONTINUE
       RETURN
C
       END
