C OAPPLI- OBJECT SPECIAL ACTION ROUTINES
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
       LOGICAL FUNCTION OAPPLI(RI,ARG)
       IMPLICIT INTEGER (A-Z)
       LOGICAL SOBJS,NOBJS
       LOGICAL QOPEN,QON,LIT
       LOGICAL MOVETO,RMDESC,CLOCKD
       LOGICAL THIEFP,CYCLOP,TROLLP,BALLOP,LIGHTP
       LOGICAL QEMPTY,QHERE,F,OPNCLS
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
       COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
     1       LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
       COMMON /BATS/ BATDRP(9)
C
C PUZZLE ROOM
C
       COMMON /PUZZLE/ CPDR(16),CPWL(8),CPVEC(64)
C
C ROOMS
C
       COMMON /ROOMS/ RLNT,RDESC2,RDESC1(200),REXIT(200),
     1       RACTIO(200),RVAL(200),RFLAG(200)
C
       COMMON /RFLAG/ RSEEN,RLIGHT,RLAND,RWATER,RAIR,
     1       RSACRD,RFILL,RMUNG,RBUCK,RHOUSE,RNWALL,REND
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
     1       OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
     2       OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
     3       OADV(220),OCAN(220),OREAD(220)
C
       COMMON /OFLAGS/ VISIBT,READBT,TAKEBT,DOORBT,TRANBT,FOODBT,
     1       NDSCBT,DRNKBT,CONTBT,LITEBT,VICTBT,BURNBT,FLAMBT,
     2       TOOLBT,TURNBT,ONBT
       COMMON /OFLAGS/ FINDBT,SLEPBT,SCRDBT,TIEBT,CLMBBT,ACTRBT,
     1       WEAPBT,FITEBT,VILLBT,STAGBT,TRYBT,NOCHBT,OPENBT,
     2       TCHBT,VEHBT,SCHBT
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
       COMMON /CEVENT/ CLNT,CTICK(25),CACTIO(25),CFLAG(25)
C
       COMMON /CINDEX/ CEVCUR,CEVMNT,CEVLNT,CEVMAT,CEVCND,
     1       CEVBAL,CEVBRN,CEVFUS,CEVLED,CEVSAF,CEVVLG,
     2       CEVGNO,CEVBUC,CEVSPH,CEVEGH,
     3       CEVFOR,CEVSCL,CEVZGI,CEVZGO,CEVSTE,
     5       CEVMRS,CEVPIN,CEVINQ,CEVFOL
 
C
C ADVENTURERS
C
       COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
     1       AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
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
     1       DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
     2       MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
     3       EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
     4       GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
     5       GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
     6       MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
     7       FOLLWF,SPELLF,CPOUTF,CPUSHF
       COMMON /FINDEX/ BTIEF,BINFF
       COMMON /FINDEX/ RVMNT,RVCLR,RVCYC,RVSND,RVGUA
       COMMON /FINDEX/ ORRUG,ORCAND,ORMTCH,ORLAMP
       COMMON /FINDEX/ MDIR,MLOC,POLEUF
       COMMON /FINDEX/ QUESNO,NQATT,CORRCT
       COMMON /FINDEX/ LCELL,PNUMB,ACELL,DCELL,CPHERE
C
C FUNCTIONS AND DATA
C
       QOPEN(R)=ZAND(OFLAG2(R),OPENBT).NE.0
       QON(R)=ZAND(OFLAG1(R),ONBT).NE.0
       DATA MXSMP/99/
C OAPPLI, PAGE 2
C
       IF(RI.EQ.0) GO TO 10
C ZERO IS FALSE APP.
       IF(RI.LE.MXSMP) GO TO 100
C SIMPLE OBJECT?
c   A bug was found here, where PRSO could get out of bounds
c   for some few situations where ODO2 isn't used anyway. The
c   array bounds error can cause a segmentation fault on some
c   unix systems (Linux), but was apparently unnoticed on many
c   other systems where the bounds error caused no problem.
c                   -- "fix" by Rick Slater 10/15/98
      if( (PRSO .lt. 221) .and. (PRSO .gt. 0) ) then
       IF(PRSO.NE.0) ODO2=ODESC2(PRSO)
      end if
       IF(PRSI.NE.0) ODI2=ODESC2(PRSI)
       AV=AVEHIC(WINNER)
       FLOBTS=FLAMBT+LITEBT+ONBT
       OAPPLI=.TRUE.
C
       GO TO (2000,5000,10000,11000,12000,15000,18000,
     1 19000,20000,22000,25000,26000,32000,35000,39000,40000,
     2 45000,47000,48000,49000,50000,51000,52000,54000,55000,
     3 56000,57000,58000,59000,60000,61000,62000),
     3       (RI-MXSMP)
       CALL BUG(6,RI)
C
C RETURN HERE TO DECLARE FALSE RESULT
C
10       OAPPLI=.FALSE.
       RETURN
C
C SIMPLE OBJECTS, PROCESSED EXTERNALLY.
C
100       IF(RI.LT.32) OAPPLI=SOBJS(RI,ARG)
       IF(RI.GE.32) OAPPLI=NOBJS(RI,ARG)
       RETURN
C OAPPLI, PAGE 3
C
C O100--       MACHINE FUNCTION
C
2000       IF(HERE.NE.MMACH) GO TO 10
C NOT HERE? F
       OAPPLI=OPNCLS(MACHI,123,124)
C HANDLE OPN/CLS.
       RETURN
C
C O101--       WATER FUNCTION
C
5000       IF(PRSA.NE.FILLW) GO TO 5050
C FILL X WITH Y IS
       PRSA=PUTW
C MADE INTO
       I=PRSI
       PRSI=PRSO
       PRSO=I
C PUT Y IN X.
       I=ODI2
       ODI2=ODO2
       ODO2=I
5050       IF((PRSO.EQ.WATER).OR.(PRSO.EQ.GWATE)) GO TO 5100
       CALL RSPEAK(561)
C WATER IS IND OBJ,
       RETURN
C PUNT.
C
5100       IF(PRSA.NE.TAKEW) GO TO 5400
C TAKE WATER?
       IF((OADV(BOTTL).EQ.WINNER).AND.(OCAN(PRSO).NE.BOTTL))
     1       GO TO 5500
C TAKE, NOT IN BOTTLE.
       IF(OCAN(PRSO).EQ.0) GO TO 5200
C INSIDE ANYTHING?
       IF(QOPEN(OCAN(PRSO))) GO TO 5200
C YES, OPEN?
C ????????????????????????JDM
       CALL RSPSUB(525,ODESC2(OCAN(PRSO)))
C INSIDE, CLOSED, PUNT.
       RETURN
C
5200       CALL RSPEAK(615)
C NOT INSIDE OR OPEN,
       RETURN
C SLIPS THRU FINGERS.
C
5400       IF(PRSA.NE.PUTW) GO TO 5700
C PUT WATER IN X?
       IF((AV.NE.0).AND.(PRSI.EQ.AV)) GO TO 5800
C IN VEH?
       IF(PRSI.EQ.BOTTL) GO TO 5500
C IN BOTTLE?
       CALL RSPSUB(297,ODI2)
C WONT GO ELSEWHERE.
       CALL NEWSTA(PRSO,0,0,0,0)
C VANISH WATER.
       RETURN
C
5500       IF(QOPEN(BOTTL)) GO TO 5550
C BOTTLE OPEN?
       CALL RSPEAK(612)
C NO, LOSE.
       RETURN
C
5550       IF(QEMPTY(BOTTL)) GO TO 5600
C OPEN, EMPTY?
       CALL RSPEAK(613)
C NO, ALREADY FULL.
       RETURN
C
5600       CALL NEWSTA(WATER,614,0,BOTTL,0)
C TAKE WATER TO BOTTLE.
       RETURN
C
5700       IF((PRSA.NE.DROPW).AND.(PRSA.NE.POURW).AND.
     1       (PRSA.NE.GIVEW)) GO TO 5900
C DROP, POUR, GIVE?
       IF(AV.NE.0) GO TO 5800
C INTO VEHICLE?
       CALL NEWSTA(PRSO,133,0,0,0)
C NO, VANISHES.
       RETURN
C
5800       CALL NEWSTA(WATER,0,0,AV,0)
C WATER INTO VEHICLE.
       CALL RSPSUB(296,ODESC2(AV))
C DESCRIBE.
       RETURN
C
5900       IF(PRSA.NE.THROWW) GO TO 10
C LAST CHANCE, THROW?
       CALL NEWSTA(PRSO,132,0,0,0)
C VANISHES.
       RETURN
C OAPPLI, PAGE 4
C
C O102--       LEAF PILE
C
10000       IF(PRSA.NE.BURNW) GO TO 10500
C BURN?
       IF(OROOM(PRSO).EQ.0) GO TO 10100
C WAS HE CARRYING?
       CALL NEWSTA(PRSO,158,0,0,0)
C NO, BURN IT.
       RETURN
C
10100       CALL NEWSTA(PRSO,0,HERE,0,0)
C DROP LEAVES.
       CALL JIGSUP(159)
C BURN HIM.
       RETURN
C
10500       IF(PRSA.NE.MOVEW) GO TO 10600
C MOVE?
       CALL RSPEAK(2)
C DONE.
       RETURN
C
10600       IF((PRSA.NE.LOOKUW).OR.(RVCLR.NE.0)) GO TO 10
       CALL RSPEAK(344)
C LOOK UNDER?
       RETURN
C
C O103--       TROLL, DONE EXTERNALLY.
C
11000       OAPPLI=TROLLP(ARG)
C TROLL PROCESSOR.
       RETURN
C
C O104--       RUSTY KNIFE.
C
12000       IF(PRSA.NE.TAKEW) GO TO 12100
C TAKE?
       IF(OADV(SWORD).EQ.WINNER) CALL RSPEAK(160) 
C PULSE SWORD.
       GO TO 10
C
12100       IF((((PRSA.NE.ATTACW).AND.(PRSA.NE.KILLW)).OR.
     1       (PRSI.NE.RKNIF)).AND.
     2  (((PRSA.NE.SWINGW).AND.(PRSA.NE.THROWW)).OR.
     3       (PRSO.NE.RKNIF))) GO TO 10
       CALL NEWSTA(RKNIF,0,0,0,0)
C KILL KNIFE.
       CALL JIGSUP(161)
C KILL HIM.
       RETURN
C OAPPLI, PAGE 5
C
C O105--       GLACIER
C
15000       IF(PRSA.NE.THROWW) GO TO 15500
C THROW?
       IF(PRSO.NE.TORCH) GO TO 15400
C TORCH?
       CALL NEWSTA(ICE,169,0,0,0)
C MELT ICE.
       ODESC1(TORCH)=174
C MUNG TORCH.
       ODESC2(TORCH)=173
       OFLAG1(TORCH)=ZAND(OFLAG1(TORCH),ZNOT(FLOBTS))
       CALL NEWSTA(TORCH,0,STREA,0,0)
C MOVE TORCH.
       GLACRF=.TRUE.
C GLACIER GONE.
       IF(.NOT.LIT(HERE)) CALL RSPEAK(170)
C IN DARK?
       RETURN
C
15400       CALL RSPEAK(171)
C JOKE IF NOT TORCH.
       RETURN
C
15500       IF((PRSA.NE.MELTW).OR.(PRSO.NE.ICE)) GO TO 10
       IF(ZAND(OFLAG1(PRSI),FLOBTS).EQ.FLOBTS) GO TO 15600
       CALL RSPSUB(298,ODI2)
C CANT MELT WITH THAT.
       RETURN
C
15600       GLACMF=.TRUE.
C PARTIAL MELT.
       IF(PRSI.NE.TORCH) GO TO 15700
C MELT WITH TORCH?
       ODESC1(TORCH)=174
C MUNG TORCH.
       ODESC2(TORCH)=173
       OFLAG1(TORCH)=ZAND(OFLAG1(TORCH),ZNOT(FLOBTS))
15700       CALL JIGSUP(172)
C DROWN.
       RETURN
C
C O106--       BLACK BOOK
C
18000       IF(PRSA.NE.OPENW) GO TO 18100
C OPEN?
       CALL RSPEAK(180)
C JOKE.
       RETURN
C
18100       IF(PRSA.NE.CLOSEW) GO TO 18200
C CLOSE?
       CALL RSPEAK(181)
       RETURN
C
18200       IF(PRSA.NE.BURNW) GO TO 10
C BURN?
       CALL NEWSTA(PRSO,0,0,0,0)
C FATAL JOKE.
       CALL JIGSUP(182)
       RETURN
C OAPPLI, PAGE 6
C
C O107--       CANDLES, PROCESSED EXTERNALLY
C
19000       OAPPLI=LIGHTP(CANDL)
       RETURN
C
C O108--       MATCHES, PROCESSED EXTERNALLY
C
20000       OAPPLI=LIGHTP(MATCH)
       RETURN
C
C O109--       CYCLOPS, PROCESSED EXTERNALLY.
C
22000       OAPPLI=CYCLOP(ARG)
C CYCLOPS
       RETURN
C
C O110--       THIEF, PROCESSED EXTERNALLY
C
25000       OAPPLI=THIEFP(ARG)
       RETURN
C
C O111--       WINDOW
C
26000       OAPPLI=OPNCLS(WINDO,208,209)
C OPEN/CLS WINDOW.
       RETURN
C
C O112--       PILE OF BODIES
C
32000       IF(PRSA.NE.TAKEW) GO TO 32500
C TAKE?
       CALL RSPEAK(228)
C CANT.
       RETURN
C
32500       IF((PRSA.NE.BURNW).AND.(PRSA.NE.MUNGW)) GO TO 10
       IF(ONPOLF) RETURN
C BURN OR MUNG?
       ONPOLF=.TRUE.
C SET HEAD ON POLE.
       CALL NEWSTA(HPOLE,0,LLD2,0,0)
       CALL JIGSUP(229)
C BEHEADED.
       RETURN
C
C O113--       VAMPIRE BAT
C
35000       CALL RSPEAK(50)
C TIME TO FLY, JACK.
       F=MOVETO(BATDRP(ZRND(9)+1),WINNER)
C SELECT RANDOM DEST.
       F=RMDESC(0)
       RETURN
C OAPPLI, PAGE 7
C
C O114--       STICK
C
39000       IF(PRSA.NE.WAVEW) GO TO 10
C WAVE?
       IF(HERE.EQ.MRAIN) GO TO 39500
C ON RAINBOW?
       IF((HERE.EQ.POG).OR.(HERE.EQ.FALLS)) GO TO 39200
       CALL RSPEAK(244)
C NOTHING HAPPENS.
       RETURN
C
39200       OFLAG1(POT)=ZOR(OFLAG1(POT),VISIBT)
C MAKE GOLD VISIBLE.
       RAINBF=.NOT. RAINBF
C COMPLEMENT RAINBOW.
       I=245
C ASSUME OFF.
       IF(RAINBF) I=246
C IF ON, SOLID.
       CALL RSPEAK(I)
C DESCRIBE.
       RETURN
C
39500       RAINBF=.FALSE.
C ON RAINBOW,
       CALL JIGSUP(247)
C TAKE A FALL.
       RETURN
C
C O115--       BALLOON, HANDLED EXTERNALLY
C
40000       OAPPLI=BALLOP(ARG)
       RETURN
C
C O116--       HEADS
C
45000       IF(PRSA.NE.HELLOW) GO TO 45100
C HELLO HEADS?
       CALL RSPEAK(633)
C TRULY BIZARRE.
       RETURN
C
45100       IF(PRSA.EQ.READW) GO TO 10
C READ IS OK.
       CALL NEWSTA(LCASE,260,LROOM,0,0)
C MAKE LARGE CASE.
       I=ROBADV(WINNER,0,LCASE,0)+ROBRM(HERE,100,0,LCASE,0)
       CALL JIGSUP(261)
C KILL HIM.
       RETURN
C OAPPLI, PAGE 8
C
C O117--       SPHERE
C
47000       IF(CAGESF.OR.(PRSA.NE.TAKEW)) GO TO 10
C TAKE?
       IF(WINNER.NE.PLAYER) GO TO 47500
C ROBOT TAKE?
       CALL RSPEAK(263)
C NO, DROP CAGE.
       IF(OROOM(ROBOT).NE.HERE) GO TO 47200
C ROBOT HERE?
       F=MOVETO(CAGED,WINNER)
C YES, MOVE INTO CAGE.
       CALL NEWSTA(ROBOT,0,CAGED,0,0)
C MOVE ROBOT.
       AROOM(AROBOT)=CAGED
       OFLAG1(ROBOT)=ZOR(OFLAG1(ROBOT),NDSCBT)
C DONT DESCRIBE ROBOT.
       CTICK(CEVSPH)=10
C GET OUT IN 10 OR ELSE.
       RETURN
C
47200       CALL NEWSTA(SPHER,0,0,0,0)
C YOURE DEAD.
       RFLAG(CAGER)=ZOR(RFLAG(CAGER),RMUNG)
C MUNG CAGE ROOM.
       RVAL(CAGER)=147
       CALL JIGSUP(148)
C MUNG PLAYER.
       RETURN
C
47500       CALL NEWSTA(SPHER,0,0,0,0)
C ROBOT TRIED,
       CALL NEWSTA(ROBOT,264,0,0,0)
C KILL HIM.
       CALL NEWSTA(CAGE,0,HERE,0,0)
C INSERT MANGLED CAGE.
       RETURN
C
C O118--       GEOMETRICAL BUTTONS
C
48000       IF(PRSA.NE.PUSHW) GO TO 10
C PUSH?
       I=PRSO-SQBUT+1
C GET BUTTON INDEX.
       IF((I.LE.0).OR.(I.GE.4)) GO TO 10
C A BUTTON?
       IF(WINNER.NE.PLAYER) GO TO (48100,48200,48300),I
       CALL JIGSUP(265)
C YOU PUSHED, YOU DIE.
       RETURN
C
48100       I=267
       IF(CAROZF) I=266
C SPEED UP?
       CAROZF=.TRUE.
       CALL RSPEAK(I)
       RETURN
C
48200       I=266
C ASSUME NO CHANGE.
       IF(CAROZF) I=268
       CAROZF=.FALSE.
       CALL RSPEAK(I)
       RETURN
C
48300       CAROFF=.NOT.CAROFF
C FLIP CAROUSEL.
       IF(.NOT.QHERE(IRBOX,CAROU)) RETURN
C IRON BOX IN CAROUSEL?
       CALL RSPEAK(269)
C YES, THUMP.
       OFLAG1(IRBOX)=ZXOR(OFLAG1(IRBOX),VISIBT)
C COMPLEMENT VISIBILITY.
       IF(CAROFF) RFLAG(CAROU)=ZAND(RFLAG(CAROU),ZNOT(RSEEN))
       RETURN
C
C O119--       FLASK FUNCTION
C
49000       IF(PRSA.EQ.OPENW) GO TO 49100
C OPEN?
       IF((PRSA.NE.MUNGW).AND.(PRSA.NE.THROWW)) GO TO 10
       CALL NEWSTA(FLASK,270,0,0,0)
C KILL FLASK.
49100       RFLAG(HERE)=ZOR(RFLAG(HERE),RMUNG)
C MUNG ROOM.
       RVAL(HERE)=271
       CALL JIGSUP(272)
C POISONED.
       RETURN
C
C O120--       BUCKET FUNCTION
C
50000       IF(ARG.NE.2) GO TO 10
C READOUT?
       IF((OCAN(WATER).NE.BUCKE).OR.BUCKTF) GO TO 50500
       BUCKTF=.TRUE.
C BUCKET AT TOP.
       CTICK(CEVBUC)=100
C START COUNTDOWN.
       CALL NEWSTA(BUCKE,290,TWELL,0,0)
C REPOSITION BUCKET.
       GO TO 50900
C FINISH UP.
C
50500       IF((OCAN(WATER).EQ.BUCKE).OR..NOT.BUCKTF) GO TO 10
       BUCKTF=.FALSE.
       CALL NEWSTA(BUCKE,291,BWELL,0,0)
C BUCKET AT BOTTOM.
50900       IF(AV.NE.BUCKE) RETURN
C IN BUCKET?
       F=MOVETO(OROOM(BUCKE),WINNER)
C MOVE ADVENTURER.
       F=RMDESC(0)
C DESCRIBE ROOM.
       RETURN
C OAPPLI, PAGE 9
C
C O121--       EATME CAKE
C
51000       IF((PRSA.NE.EATW).OR.(PRSO.NE.ECAKE).OR.
     1       (HERE.NE.ALICE)) GO TO 10
C EAT CAKE IN ALICEROOM?
       CALL NEWSTA(ECAKE,273,0,0,0)
C VANISH CAKE.
       OFLAG1(ROBOT)=ZAND(OFLAG1(ROBOT),ZNOT(VISIBT))
C VANISH ROBOT.
       DO 51100 I=1,OLNT
C MAKE OBJECTS BIG.
         IF((OROOM(I).NE.ALICE).OR.(OSIZE(I).EQ.10000))
     1       GO TO 51100
         OSIZE(I)=OSIZE(I)*64
         OROOM(I)=ALISM
51100       CONTINUE
       OAPPLI=MOVETO(ALISM,WINNER)
C MOVE TO ALICE SMALL.
       RETURN
C
C O122--       ICINGS
C
52000       IF(PRSA.NE.READW) GO TO 52200
C READ?
       I=274
C CANT READ.
       IF(PRSI.NE.0) I=275
C THROUGH SOMETHING?
       IF(PRSI.EQ.BOTTL) I=276
C THROUGH BOTTLE?
       IF(PRSI.EQ.FLASK) I=277+(PRSO-ORICE)
C THROUGH FLASK?
       CALL RSPEAK(I)
C READ FLASK.
       RETURN
C
52200       IF((PRSA.NE.THROWW).OR.(PRSO.NE.RDICE).OR.(PRSI.NE.POOL))
     1       GO TO 52300
C THROW RDICE AT POOL?
       CALL NEWSTA(POOL,280,0,0,0)
C VANISH POOL.
       OFLAG1(SAFFR)=ZOR(OFLAG1(SAFFR),VISIBT)
C MATERIALIZE SPICES.
       RETURN
C
52300       IF((HERE.NE.ALICE).AND.(HERE.NE.ALISM).AND.(HERE.NE.ALITR))
     1       GO TO 10
C IN WONDERLAND?
       IF(((PRSA.NE.EATW).AND.(PRSA.NE.THROWW)).OR.
     1       (PRSO.NE.ORICE)) GO TO 52400
C THROW ORANGE ICE?
       CALL NEWSTA(ORICE,0,0,0,0)
C VANISH ORANGE ICE.
       RFLAG(HERE)=ZOR(RFLAG(HERE),RMUNG)
C VANISH ROOM.
       RVAL(HERE)=281
       CALL JIGSUP(282)
C VANISH ADVENTURER.
       RETURN
C
52400       IF((PRSA.NE.EATW).OR.(PRSO.NE.BLICE))
     1       GO TO 10
C EAT BLUE ICE?
       CALL NEWSTA(BLICE,283,0,0,0)
C VANISH BLUE ICE.
       IF(HERE.NE.ALISM) GO TO 52500
C IN REDUCED ROOM?
       OFLAG1(ROBOT)=ZOR(OFLAG1(ROBOT),VISIBT)
C MATERIALIZE ROBOT.
       DO 52450 I=1,OLNT
C ENLARGE WORLD.
         IF((OROOM(I).NE.HERE).OR.(OSIZE(I).EQ.10000))
     1       GO TO 52450
         OROOM(I)=ALICE
         OSIZE(I)=OSIZE(I)/64
52450       CONTINUE
       OAPPLI=MOVETO(ALICE,WINNER)
C RETURN
       RETURN
C
52500       CALL JIGSUP(284)
C ENLARGED IN WRONG ROOM.
       RETURN
C
C O123--       BRICK
C
54000       IF(PRSA.NE.BURNW) GO TO 10
C BURN?
       CALL JIGSUP(150)
C BOOM
C 
       RETURN
C
C O124--       MYSELF
C
55000       IF(PRSA.NE.GIVEW) GO TO 55100
C GIVE?
       CALL NEWSTA(PRSO,2,0,0,PLAYER)
C DONE.
       RETURN
C
55100       IF(PRSA.NE.TAKEW) GO TO 55200
C TAKE?
       CALL RSPEAK(286)
C JOKE.
       RETURN
C
55200       IF((PRSA.NE.KILLW).AND.(PRSA.NE.MUNGW)) GO TO 10
       CALL JIGSUP(287)
C KILL, NO JOKE.
       RETURN
C OAPPLI, PAGE 10
C
C O125--       PANELS INSIDE MIRROR
C
56000       IF(PRSA.NE.PUSHW) GO TO 10
C PUSH?
       IF(POLEUF.NE.0) GO TO 56100
C SHORT POLE UP?
       I=731
C NO, WONT BUDGE.
       IF(MOD(MDIR,180).EQ.0) I=732
C DIFF MSG IF N-S.
       CALL RSPEAK(I)
C TELL WONT MOVE.
       RETURN
C
56100       IF(MLOC.NE.MRG) GO TO 56200
C IN GDN ROOM?
       CALL RSPEAK(733)
C YOU LOSE.
       CALL JIGSUP(685)
       RETURN
C
56200       I=831
C ROTATE L OR R.
       IF((PRSO.EQ.RDWAL).OR.(PRSO.EQ.YLWAL)) I=830
       CALL RSPEAK(I)
C TELL DIRECTION.
       MDIR=MOD(MDIR+45+(270*(I-830)),360)
C CALCULATE NEW DIR.
       CALL RSPSUB(734,695+(MDIR/45))
C TELL NEW DIR.
       IF(WDOPNF) CALL RSPEAK(730)
C IF PANEL OPEN, CLOSE.
       WDOPNF=.FALSE.
       RETURN
C DONE.
C
C O126--       ENDS INSIDE MIRROR
C
57000       IF(PRSA.NE.PUSHW) GO TO 10
C PUSH?
       IF(MOD(MDIR,180).EQ.0) GO TO 57100
C MIRROR N-S?
       CALL RSPEAK(735)
C NO, WONT BUDGE.
       RETURN
C
57100       IF(PRSO.NE.PINDR) GO TO 57300
C PUSH PINE WALL?
       IF(((MLOC.EQ.MRC).AND.(MDIR.EQ.180)).OR.
     1  ((MLOC.EQ.MRD).AND.(MDIR.EQ.0)).OR.
     2   (MLOC.EQ.MRG)) GO TO 57200
C IN VIEW OF GDN?
       CALL RSPEAK(736)
C NO, OPENS.
       WDOPNF=.TRUE.
C INDICATE OPEN.
       CFLAG(CEVPIN)=.TRUE.
C TIME OPENING.
       CTICK(CEVPIN)=5
       RETURN
C
57200       CALL RSPEAK(737)
C GDN SEES YOU, DIE.
       CALL JIGSUP(685)
       RETURN
C
57300       NLOC=MLOC-1
C NEW LOC IF SOUTH.
       IF(MDIR.EQ.0) NLOC=MLOC+1
C NEW LOC IF NORTH.
       IF((NLOC.GE.MRA).AND.(NLOC.LE.MRD)) GO TO 57400
       CALL RSPEAK(738)
C HAVE REACHED END.
       RETURN
C
57400       I=699
C ASSUME SOUTH.
       IF(MDIR.EQ.0) I=695
C NORTH.
       J=739
C ASSUME SMOOTH.
       IF(POLEUF.NE.0) J=740
C POLE UP, WOBBLES.
       CALL RSPSUB(J,I)
C DESCRIBE.
       MLOC=NLOC
       IF(MLOC.NE.MRG) RETURN
C NOW IN GDN ROOM?
C
       IF(POLEUF.NE.0) GO TO 57500
C POLE UP, GDN SEES.
       IF(MROPNF.OR.WDOPNF) GO TO 57600
C DOOR OPEN, GDN SEES.
       IF(MR1F.AND.MR2F) RETURN
C MIRRORS INTACT, OK.
       CALL RSPEAK(742)
C MIRRORS BROKEN, DIE.
       CALL JIGSUP(743)
       RETURN
C
57500       CALL RSPEAK(741)
C POLE UP, DIE.
       CALL JIGSUP(743)
       RETURN
C
57600       CALL RSPEAK(744)
C DOOR OPEN, DIE.
       CALL JIGSUP(743)
       RETURN
C OAPPLI, PAGE 11
C
C O127--       GLOBAL GUARDIANS
C
58000       IF((PRSA.NE.ATTACW).AND.(PRSA.NE.KILLW).AND.
     1  (PRSA.NE.MUNGW)) GO TO 58100
C AGGRESSIVE?
       CALL JIGSUP(745)
C LOSE.
       RETURN
C
58100       IF(PRSA.NE.HELLOW) GO TO 10
C HELLO?
       CALL RSPEAK(746)
C NO REPLY.
       RETURN
C
C O128--       GLOBAL MASTER
C
59000       IF((PRSA.NE.ATTACW).AND.(PRSA.NE.KILLW).AND.
     1  (PRSA.NE.MUNGW)) GO TO 59100
C AGGRESSIVE?
       CALL JIGSUP(747)
C BAD IDEA.
       RETURN
C
59100       IF(PRSA.NE.TAKEW) GO TO 10
C TAKE?
       CALL RSPEAK(748)
C JOKE.
       RETURN
C
C O129--       NUMERAL FIVE (FOR JOKE)
C
60000       IF(PRSA.NE.TAKEW) GO TO 10
C TAKE FIVE?
       CALL RSPEAK(419)
C TIME PASSES.
       DO 60100 I=1,3
C WAIT A WHILE.
         IF(CLOCKD(X)) RETURN
60100       CONTINUE
       RETURN
C
C O130--       CRYPT FUNCTION
C
61000       IF(.NOT.ENDGMF) GO TO 45000
C IF NOT EG, DIE.
       IF(PRSA.NE.OPENW) GO TO 61100
C OPEN?
       I=793
       IF(QOPEN(TOMB)) I=794
       CALL RSPEAK(I)
       OFLAG2(TOMB)=ZOR(OFLAG2(TOMB),OPENBT)
C NOW TOMB WITH VIEW.
       RETURN
C
61100       IF(PRSA.NE.CLOSEW) GO TO 45000
C CLOSE?
       I=795
       IF(QOPEN(TOMB)) I=796
       CALL RSPEAK(I)
       OFLAG2(TOMB)=ZAND(OFLAG2(TOMB),ZNOT(OPENBT))
       IF(HERE.EQ.CRYPT) CTICK(CEVSTE)=3
C IF IN CRYPT, START EG.
       RETURN
C OAPPLI, PAGE 12
C
C O131--       GLOBAL LADDER
C
62000       IF((CPVEC(CPHERE+1).EQ.-2).OR.(CPVEC(CPHERE-1).EQ.-3))
     1       GO TO 62100
C LADDER HERE?
       CALL RSPEAK(865)
C NO, LOSE.
       RETURN
C
62100       IF((PRSA.EQ.CLMBW).OR.(PRSA.EQ.CLMBUW)) GO TO 62200
       CALL RSPEAK(866)
C CLIMB IT?
       RETURN
C
62200       IF((CPHERE.EQ.10).AND.(CPVEC(CPHERE+1).EQ.-2))
     1       GO TO 62300
C AT EXIT?
       CALL RSPEAK(867)
C NO, HIT YOUR HEAD.
       RETURN
C
62300       F=MOVETO(CPANT,WINNER)
C TO ANTEROOM.
       F=RMDESC(3)
C DESCRIBE.
       RETURN
C
       END
