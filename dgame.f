C GAME- MAIN COMMAND LOOP FOR DUNGEON
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
       SUBROUTINE GAME
       IMPLICIT INTEGER (A-Z)
       LOGICAL RMDESC,VAPPLI,RAPPLI,AAPPLI
       LOGICAL F,PARSE,FINDXT,XVEHIC,LIT
       CHARACTER SECHO(4),GDTSTR(3)
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
C MISCELLANEOUS VARIABLES
C
       CHARACTER INLINE
       COMMON /INPUTL/ INLNT
       COMMON /INPUT/ INLINE(78)
       COMMON /CHAN/ INPCH,OUTCH,DBCH,ZRECL
C
C ROOMS
C
       COMMON /ROOMS/ RLNT,RDESC2,RDESC1(200),REXIT(200),
     1       RACTIO(200),RVAL(200),RFLAG(200)
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
       DATA SECHO/'E','C','H','O'/
       DATA GDTSTR/'G','D','T'/
C GAME, PAGE 2
C
C START UP, DESCRIBE CURRENT LOCATION.
C
       CALL RSPEAK(1)   
C WELCOME ABOARD.
       F=RMDESC(3)   
C START GAME.
C
C NOW LOOP, READING AND EXECUTING COMMANDS.
C
100       WINNER=PLAYER   
C PLAYER MOVING.
       TELFLG=.FALSE.   
C ASSUME NOTHING TOLD.
       IF(PRSCON.LE.1) CALL RDLINE(INLINE,INLNT,1) 
C READ COMMAND.
C
       DO 150 I=1,3
C CALL ON GDT?
         IF(INLINE(I+PRSCON-1).NE.GDTSTR(I)) GO TO 200
150       CONTINUE
       CALL GDT   
C YES, INVOKE.
       GO TO 100   
C ONWARD.
C
200       MOVES=MOVES+1
       PRSWON=PARSE(INLINE,INLNT,.TRUE.)     
C PARSE INPUT, NORMAL MODE.
       IF(.NOT.PRSWON) GO TO 400    
C PARSE LOSES?
       IF(XVEHIC(1)) GO TO 400   
C VEHICLE HANDLE?
C
       IF(PRSA.EQ.TELLW) GO TO 2000    
C TELL?
300       IF((PRSO.EQ.VALUA).OR.(PRSO.EQ.EVERY)) GO TO 900
       IF(.NOT.VAPPLI(PRSA)) GO TO 400    
C VERB OK?
350       IF(.NOT.ECHOF.AND.(HERE.EQ.ECHOR)) GO TO 1000
       F=RAPPLI(RACTIO(HERE))
C
400       CALL XENDMV(TELFLG)   
C DO END OF MOVE.
       IF(.NOT.LIT(HERE)) PRSCON=1
       GO TO 100
C
900       CALL VALUAC(VALUA)
       GO TO 350
C GAME, PAGE 3
C
C SPECIAL CASE-- ECHO ROOM.
C IF INPUT IS NOT 'ECHO' OR A DIRECTION, JUST ECHO.
C
1000       CALL RDLINE(INLINE,INLNT,0)    
C READ LINE.
       MOVES=MOVES+1   
C CHARGE FOR MOVES.
       DO 1100 I=1,4   
C INPUT = ECHO?
         IF(INLINE(I).NE.SECHO(I)) GO TO 1300
1100       CONTINUE
C
       DO 1200 I=5,78   
C REST BLANK?
         IF(INLINE(I).NE.' ') GO TO 1300
1200       CONTINUE
C
       CALL RSPEAK(571)   
C KILL THE ECHO.
       ECHOF=.TRUE.
       OFLAG2(BAR)=ZAND(OFLAG2(BAR),ZNOT(SCRDBT)) 
C LET THIEF STEAL BAR.
       PRSWON=.TRUE.   
C FAKE OUT PARSER.
       PRSCON=1   
C FORCE NEW INPUT.
       GO TO 400
C
1300       PRSWON=PARSE(INLINE,INLNT,.FALSE.)     
C PARSE INPUT, ECHO MODE.
       IF(.NOT.PRSWON .OR. (PRSA.NE.WALKW))
     1       GO TO 1400   
C WALK?
       IF(FINDXT(PRSO,HERE)) GO TO 300    
C VALID EXIT?
C
1400       WRITE(OUTCH,1410) (INLINE(J),J=1,INLNT)     
C ECHO INPUT.
1410       FORMAT(1X,78A1)
       TELFLG=.TRUE.   
C INDICATE OUTPUT.
       GO TO 1000   
C MORE ECHO ROOM.
C GAME, PAGE 4
C
C SPECIAL CASE-- TELL <ACTOR>, NEW COMMAND
C NOTE THAT WE CANNOT BE IN THE ECHO ROOM.
C
2000       IF(ZAND(OFLAG2(PRSO),ACTRBT).NE.0) GO TO 2100 
C ACTOR?
       CALL RSPEAK(602)   
C CANT DO IT.
       GO TO 350   
C VAPPLI SUCCEEDS.
C
2100       WINNER=OACTOR(PRSO)   
C NEW PLAYER.
       HERE=AROOM(WINNER)   
C NEW LOCATION.
       IF(PRSCON.LE.1) GO TO 2700    
C ANY INPUT?
       IF(PARSE(INLINE,INLNT,.TRUE.)) GO TO 2150     
C PARSE COMMAND.
2700       I=341   
C FAILS.
       IF(TELFLG) I=604   
C GIVE RESPONSE.
       CALL RSPEAK(I)
2600       WINNER=PLAYER   
C RESTORE STATE.
       HERE=AROOM(WINNER)
       GO TO 350
C
2150       IF(AAPPLI(AACTIO(WINNER))) GO TO 2400     
C ACTOR HANDLE?
       IF(XVEHIC(1)) GO TO 2400    
C VEHICLE HANDLE?
       IF((PRSO.EQ.VALUA).OR.(PRSO.EQ.EVERY)) GO TO 2900
       IF(.NOT.VAPPLI(PRSA)) GO TO 2400     
C VERB HANDLE?
2350       F=RAPPLI(RACTIO(HERE))
C
2400       CALL XENDMV(TELFLG)   
C DO END OF MOVE.
       GO TO 2600   
C DONE.
C
2900       CALL VALUAC(VALUA)   
C ALL OR VALUABLES.
       GO TO 350
C
       END
C XENDMV-       EXECUTE END OF MOVE FUNCTIONS.
C
C DECLARATIONS
C
       SUBROUTINE XENDMV(FLAG)
       IMPLICIT INTEGER(A-Z)
       LOGICAL F,CLOCKD,FLAG,XVEHIC
C
C PARSER OUTPUT
C
       LOGICAL PRSWON
       COMMON /PRSVEC/ PRSA,PRSO,PRSI,PRSWON,PRSCON
C
C VILLAINS AND DEMONS
C
       LOGICAL THFFLG,SWDACT,THFACT
       COMMON /HACK/ THFPOS,THFFLG,THFACT,SWDACT,SWDSTA
C
       IF(.NOT.FLAG) CALL RSPEAK(341)    
C DEFAULT REMARK.
       IF(THFACT) CALL THIEFD   
C THIEF DEMON.
       IF(PRSWON) CALL FIGHTD   
C FIGHT DEMON.
       IF(SWDACT) CALL SWORDD   
C SWORD DEMON.
       IF(PRSWON) F=CLOCKD(X)   
C CLOCK DEMON.
       IF(PRSWON) F=XVEHIC(2)   
C VEHICLE READOUT.
       RETURN
       END
C XVEHIC- EXECUTE VEHICLE FUNCTION
C
C DECLARATIONS
C
       LOGICAL FUNCTION XVEHIC(N)
       IMPLICIT INTEGER(A-Z)
       LOGICAL OAPPLI
C
C GAME STATE
C
       LOGICAL TELFLG
       COMMON /PLAY/ WINNER,HERE,TELFLG
C
C OBJECTS
C
       COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
     1       OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
     2       OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
     3       OADV(220),OCAN(220),OREAD(220)
C
C ADVENTURERS
C
       COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
     1       AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
       XVEHIC=.FALSE.   
C ASSUME LOSES.
       AV=AVEHIC(WINNER)   
C GET VEHICLE.
       IF(AV.NE.0) XVEHIC=OAPPLI(OACTIO(AV),N)
       RETURN
       END
C
C INIT-- DUNGEON INITIALIZATION SUBROUTINE
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
       LOGICAL FUNCTION INIT()
       IMPLICIT INTEGER (A-Z)
       LOGICAL PROTCT
C
C PARSER OUTPUT
C
       LOGICAL PRSWON
       COMMON /PRSVEC/ PRSA,PRSI,PRSO,PRSWON,PRSCON
C
C PARSER STATE
C
       COMMON /ORPHS/ OFLAG,OACT,OSLOT,OPREP,ONAME
       COMMON /LAST/ LASTIT
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
C MESSAGE INDEX
C
       COMMON /RMSG/ MLNT,RTEXT(1050)
C
C MISCELLANEOUS VARIABLES
C
       COMMON /STAR/ MBASE,STRBIT
       COMMON /VERS/ VMAJ,VMIN,VEDIT
       COMMON /TIME/ PLTIME,SHOUR,SMIN,SSEC
       COMMON /CHAN/ INPCH,OUTCH,DBCH,ZRECL
       COMMON /DEBUG/ DBGFLG,PRSFLG,GDTFLG
       COMMON /HYPER/ HFACTR
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
C EXITS
C
       COMMON /EXITS/ XLNT,TRAVEL(900)
C
       COMMON /CURXT/ XTYPE,XROOM1,XSTRNG,XACTIO,XOBJ
C
       COMMON /XPARS/ XRMASK,XDMASK,XFMASK,XFSHFT,XASHFT,
     1       XELNT(4),XNORM,XNO,XCOND,XDOOR,XLFLAG
C
C OBJECTS
C
       COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
     1       OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
     2       OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
     3       OADV(220),OCAN(220),OREAD(220)
C
       COMMON /OROOM2/ R2LNT,O2(20),R2(20)
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
C VILLAINS AND DEMONS
C
       LOGICAL THFFLG,SWDACT,THFACT
       COMMON /HACK/ THFPOS,THFFLG,THFACT,SWDACT,SWDSTA
       COMMON /VILL/ VLNT,VILLNS(4),VPROB(4),VOPPS(4),VBEST(4),VMELEE(4)
C
C ADVENTURERS
C
       COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
     1       AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
       COMMON /AINDEX/ PLAYER,AROBOT,AMASTR
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
       LOGICAL FLAGS(46)
       INTEGER SWITCH(22)
       EQUIVALENCE (FLAGS(1),TROLLF)
       EQUIVALENCE (SWITCH(1),BTIEF)
C INIT, PAGE 2
C
C
C
C NOW START INITIALIZATION PROPER
C
10000       INIT=.FALSE.  
C ASSUME INIT FAILS.
       MMAX=1050  
C SET UP ARRAY LIMITS.
       OMAX=220
       RMAX=200
       VMAX=4
       AMAX=4
       CMAX=25
       FMAX=46
       SMAX=22
       XMAX=900
       R2MAX=20
       DIRMAX=15
C
       MLNT=0 
C INIT ARRAY COUNTERS.
       OLNT=0
       RLNT=0
       VLNT=0
       ALNT=0
       CLNT=0
       XLNT=1
       R2LNT=0
C
       LTSHFT=10  
C SET UP STATE VARIABLES.
       MXSCOR=LTSHFT
       EGSCOR=0
       EGMXSC=0
       MXLOAD=100
       RWSCOR=0
       DEATHS=0
       MOVES=0
       PLTIME=0
       MUNGRM=0
       HS=0
       PRSA=0 
C CLEAR PARSE VECTOR.
       PRSI=0
       PRSO=0
       PRSCON=1
       OFLAG=0 
C CLEAR ORPHANS.
       OACT=0
       OSLOT=0
       OPREP=0
       ONAME=0
       THFFLG=.FALSE.  
C THIEF NOT INTRODUCED BUT
       THFACT=.TRUE.  
C IS ACTIVE.
       SWDACT=.FALSE.  
C SWORD IS INACTIVE.
       SWDSTA=0  
C SWORD IS OFF.
C
       RECNO=1 
C INIT DB FILE POINTER.
       MBASE=0 
C INIT MELEE BASE.
       CALL MACHDV
C      INITIALIZE FILE STUFF
C INIT, PAGE 3
C
C INIT ALL ARRAYS.
C
       DO 5 I=1,CMAX  
C CLEAR CLOCK EVENTS
         CFLAG(I)=.FALSE.
         CTICK(I)=0
         CACTIO(I)=0
5       CONTINUE
C
       DO 10 I=1,FMAX  
C CLEAR FLAGS.
         FLAGS(I)=.FALSE.
10       CONTINUE
       BUOYF=.TRUE.  
C SOME START AS TRUE.
       EGYPTF=.TRUE.
       CAGETF=.TRUE.
       MR1F=.TRUE.
       MR2F=.TRUE.
       FOLLWF=.TRUE.
       DO 12 I=1,SMAX  
C CLEAR SWITCHES.
         SWITCH(I)=0
12       CONTINUE
       ORMTCH=4  
C NUMBER OF MATCHES.
       LCELL=1
       PNUMB=1
       MDIR=270
       MLOC=MRB
       CPHERE=10
C
       DO 15 I=1,R2MAX 
C CLEAR ROOM 2 ARRAY.
         R2(I)=0
         O2(I)=0
15       CONTINUE
C
       DO 20 I=1,XMAX 
C CLEAR TRAVEL ARRAY.
         TRAVEL(I)=0
20       CONTINUE
C
       DO 30 I=1,VMAX  
C CLEAR VILLAINS ARRAYS.
         VOPPS(I)=0
         VPROB(I)=0
         VILLNS(I)=0
         VBEST(I)=0
         VMELEE(I)=0
30       CONTINUE
C
       DO 40 I=1,OMAX  
C CLEAR OBJECT ARRAYS.
         ODESC1(I)=0
         ODESC2(I)=0
         ODESCO(I)=0
         OREAD(I)=0
         OACTIO(I)=0
         OFLAG1(I)=0
         OFLAG2(I)=0
         OFVAL(I)=0
         OTVAL(I)=0
         OSIZE(I)=0
         OCAPAC(I)=0
         OCAN(I)=0
         OADV(I)=0
         OROOM(I)=0
40       CONTINUE
C
       RDESC2=0  
C CLEAR DESC BASE PTR.
       DO 50 I=1,RMAX  
C CLEAR ROOM ARRAYS.
         RDESC1(I)=0
         RACTIO(I)=0
         RFLAG(I)=0
         RVAL(I)=0
         REXIT(I)=0
50       CONTINUE
C
       DO 60 I=1,MMAX  
C CLEAR MESSAGE DIRECTORY.
         RTEXT(I)=0
60       CONTINUE
C
       DO 70 I=1,AMAX  
C CLEAR ADVENTURER'S ARRAYS.
         AROOM(I)=0
         ASCORE(I)=0
         AVEHIC(I)=0
         AOBJ(I)=0
         AACTIO(I)=0
         ASTREN(I)=0
         AFLAG(I)=0
70       CONTINUE
C
       DBGFLG=0
       PRSFLG=0
       GDTFLG=0
C
       FROMDR=0  
C INIT SCOL GOODIES.
       SCOLRM=0
       SCOLAC=0
C INIT, PAGE 4
C
C NOW RESTORE FROM EXISTING INDEX FILE.
C
       OPEN(UNIT=11,FILE='DINDX.DAT',STATUS='OLD',ERR=1900)
       READ(11,130) I,J,K 
C GET VERSION.
       IF((I.NE.VMAJ).OR.(J.NE.VMIN))
     1       GO TO 1925 
C MATCH TO OURS?
 
       READ(11,130) MXSCOR,STRBIT,EGMXSC
       READ(11,130) RLNT,RDESC2,RDESC1,REXIT,RACTIO,RVAL,RFLAG
       READ(11,130) XLNT,TRAVEL
       READ(11,130) OLNT,ODESC1,ODESC2,ODESCO,OACTIO,OFLAG1,OFLAG2,
     1       OFVAL,OTVAL,OSIZE,OCAPAC,OROOM,OADV,OCAN,
     2       OREAD
       READ(11,130) R2LNT,O2,R2
       READ(11,130) CLNT,CTICK,CACTIO
       READ(11,135) CFLAG
       READ(11,130) VLNT,VILLNS,VPROB,VOPPS,VBEST,VMELEE
       READ(11,130) ALNT,AROOM,ASCORE,AVEHIC,AOBJ,AACTIO,ASTREN,AFLAG
       READ(11,130) MBASE,MLNT,RTEXT
C

       CLOSE(UNIT=11)
 
       OPEN(UNIT=DBCH,FILE='DTEXT.DAT',STATUS='OLD',
     1       FORM='UNFORMATTED',ACCESS='DIRECT',
     2       RECL=ZRECL,ERR=1950)
       GO TO 1025  
C INIT DONE.
C
130       FORMAT(I8)
135       FORMAT(L4)
C INIT, PAGE 5
C
C THE INTERNAL DATA BASE IS NOW ESTABLISHED.
C SET UP TO PLAY THE GAME.
C
1025       CALL ITIME(SHOUR,SMIN,SSEC)  
C GET TIME AND DATE.
       CALL KDATE(I,J,K)
       CALL INIRND(ZOR(ZOR(I,J),K),ZOR(ZOR(SHOUR,SMIN),SSEC))
C
       WINNER=PLAYER
       THFPOS=OROOM(THIEF)
       BLOC=OROOM(BALLO)
       HERE=AROOM(WINNER)
       LASTIT=AOBJ(PLAYER)
       INIT=.TRUE.
C
C
       RETURN
C INIT, PAGE 6
C
C ERRORS-- INIT FAILS.
C
1900   WRITE(*, 910)  
C DINDX.DAT OPEN ERR
       WRITE(*,980)
       RETURN
1925   WRITE(*,920)I,J,K,VMAJ,VMIN,VEDIT  
C WRONG DINDX.DAT VER
       WRITE(*, 980)
       RETURN
1950   write(*, 960)  
C DTEXT.DAT OPEN ERR
       WRITE(*,980)
       RETURN
910       FORMAT(' I can''t open "DINDX.DAT".')
920       FORMAT(' "DINDX.DAT" is version ',I1,'.',I1,A1,'.'/
     1       ' I require version ',I1,'.',I1,A1,'.')
960       FORMAT(' I can''t open "DTEXT.DAT".')
980       FORMAT(
     1 ' Suddenly a sinister, wraithlike figure appears before you',
     1 /' seeming to float in the air.  In a low, sorrowful voice ',
     2 'he says,'/' "Alas, the very nature of the world has changed, '
     3 'and the dungeon'/' cannot be found.  All must now pass away."',
     4 '  Raising his oaken staff'/' in farewell, he fades into the ',
     5 'spreading darkness.  In his place'/' appears a tastefully ',
     6 'lettered sign reading:'//23X,'INITIALIZATION FAILURE'//
     7' The darkness becomes all encompassing, and your vision fails.')
C
       END
