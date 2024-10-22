C DUNGEON-- MAIN PROGRAM
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
       PROGRAM DUNGEO
C 1) INITIALIZE DATA STRUCTURES
C 2) PLAY GAME
C
       IMPLICIT INTEGER (A-Z)
       LOGICAL INIT
C      COMMONS ARE PRESENT TO AVOID "SAVE" STATEMENTS
       CHARACTER*20 INFMTX
       COMMON /XINFMT/ INFMTX 
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
       COMMON /PV/ ACT,OBJ1,OBJ2,PREP1,PREP2
       COMMON /SYNTAX/ SYN(11)
       COMMON /SYNFLG/ SDIR,SIND,SSTD,SFLIP,SDRIV,SVMASK
       COMMON /OBJFLG/ VABIT,VRBIT,VTBIT,VCBIT,VEBIT,VFBIT,VPMASK
C
C GAME STATE
C
       LOGICAL TELFLG
       COMMON /PLAY/ WINNER,HERE,TELFLG
       COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
     1       LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
C SCREEN OF LIGHT STATE
C
       COMMON /SCREEN/ FROMDR,SCOLRM,SCOLAC
       COMMON /SCREEN/ SCOLDR(8),SCOLWL(12)
C
C PUZZLE ROOM STATE
C
       COMMON /PUZZLE/ CPDR(16),CPWL(8),CPVEC(64)
C
C MESSAGE INDEX
C
       COMMON /RMSG/ MLNT,RTEXT(1050)
C
C MISCELLANEOUS VARIABLES
C
       CHARACTER INBUF
        COMMON /INPUTL/ INLNT
       COMMON /INPUT/ INBUF(78)
       COMMON /STAR/ MBASE,STRBIT
       COMMON /VERS/ VMAJ,VMIN,VEDIT
       COMMON /TIME/ PLTIME,SHOUR,SMIN,SSEC
       COMMON /BATS/ BATDRP(9)
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
       COMMON /XSRCH/ XMIN,XMAX,XDOWN,XUP,
     1       XNORTH,XSOUTH,XENTER,XEXIT,XEAST,XWEST
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
       COMMON /AFLAGS/ ASTAG
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


       IF(INIT()) CALL GAME       
C IF INIT, PLAY GAME.
C DONE
       END
 
       BLOCK DATA AAAAA
C
C DECLARATIONS
C
       IMPLICIT INTEGER (A-Z)
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
       COMMON /PV/ ACT,OBJ1,OBJ2,PREP1,PREP2
       COMMON /SYNTAX/ SYN(11)
       COMMON /SYNFLG/ SDIR,SIND,SSTD,SFLIP,SDRIV,SVMASK
       COMMON /OBJFLG/ VABIT,VRBIT,VTBIT,VCBIT,VEBIT,VFBIT,VPMASK
C
C GAME STATE
C
       LOGICAL TELFLG
       COMMON /PLAY/ WINNER,HERE,TELFLG
       COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
     1       LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
C SCREEN OF LIGHT STATE
C
       COMMON /SCREEN/ FROMDR,SCOLRM,SCOLAC
       COMMON /SCREEN/ SCOLDR(8),SCOLWL(12)
C
C PUZZLE ROOM STATE
C
       COMMON /PUZZLE/ CPDR(16),CPWL(8),CPVEC(64)
C
C MESSAGE INDEX
C
       COMMON /RMSG/ MLNT,RTEXT(1050)
C
C MISCELLANEOUS VARIABLES
C
       CHARACTER INBUF
        COMMON /INPUTL/ INLNT
       COMMON /INPUT/ INBUF(78)
       COMMON /STAR/ MBASE,STRBIT
       COMMON /VERS/ VMAJ,VMIN,VEDIT
       COMMON /TIME/ PLTIME,SHOUR,SMIN,SSEC
       COMMON /BATS/ BATDRP(9)
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
       COMMON /XSRCH/ XMIN,XMAX,XDOWN,XUP,
     1       XNORTH,XSOUTH,XENTER,XEXIT,XEAST,XWEST
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
       COMMON /AFLAGS/ ASTAG
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
C DUNGEON, PAGE 2
C
C DATA STATEMENTS FOR CONSTANT ARRAYS
C
       DATA VMAJ/2/,VMIN/5/,VEDIT/2/
C
       DATA SDIR/16384/,SIND/8192/,SSTD/4096/,
     1       SFLIP/2048/,SDRIV/1024/,SVMASK/511/
       DATA VABIT/16384/,VRBIT/8192/,VTBIT/4096/,
     1       VCBIT/2048/,VEBIT/1024/,VFBIT/512/,VPMASK/511/
C
       DATA BATDRP/66,67,68,69,70,71,72,65,73/
C
       DATA SCOLDR/1024,153,5120,154,3072,152,7168,151/
       DATA SCOLWL/151,207,3072,152,208,7168,
     1       153,206,5120,154,205,1024/
C
       DATA HFACTR/500/
C
       DATA CPDR/1024,-8,2048,-7,3072,1,4096,9,
     1       5120,8,6144,7,7168,-1,8192,-9/
       DATA CPWL/205,-8,206,8,207,1,208,-1/
       DATA CPVEC/1,1,1,1,1,1,1,1,
     1       1,0,-1,0,0,-1,0,1,
     2       1,-1,0,1,0,-2,0,1,
     3       1,0,0,0,0,1,0,1,
     4       1,-3,0,0,-1,-1,0,1,
     5       1,0,0,-1,0,0,0,1,
     6       1,1,1,0,0,0,1,1,
     7       1,1,1,1,1,1,1,1/
C
       DATA CEVCUR/1/,CEVMNT/2/,CEVLNT/3/,CEVMAT/4/,
     1       CEVCND/5/,CEVBAL/6/,CEVBRN/7/,CEVFUS/8/,
     2       CEVLED/9/,CEVSAF/10/,CEVVLG/11/,CEVGNO/12/,
     3       CEVBUC/13/,CEVSPH/14/,CEVEGH/15/,
     4       CEVFOR/16/,CEVSCL/17/,CEVZGI/18/,CEVZGO/19/,
     5       CEVSTE/20/,CEVMRS/21/,CEVPIN/22/,CEVINQ/23/,
     6       CEVFOL/24/
C
       DATA XRMASK/255/,XDMASK/31744/,XFMASK/3/
       DATA XFSHFT/256/,XASHFT/256/
       DATA XNORM/1/,XNO/2/,XCOND/3/,XDOOR/4/
       DATA XELNT/1,2,3,3/,XLFLAG/32768/
       DATA XMIN/1024/,XMAX/16384/,XUP/9216/,XDOWN/10240/
       DATA XNORTH/1024/,XSOUTH/5120/,XENTER/13312/,XEXIT/14336/
       DATA XEAST/3072/,XWEST/7168/
C
       DATA PLAYER/1/,AROBOT/2/,AMASTR/3/
       DATA ASTAG/32768/
C
       DATA RSEEN/32768/,RLIGHT/16384/,RLAND/8192/
       DATA RWATER/4096/,RAIR/2048/,RSACRD/1024/,RFILL/512/
       DATA RMUNG/256/,RBUCK/128/,RHOUSE/64/,RNWALL/32/,REND/16/
C
       DATA WHOUS/2/,LROOM/8/,CELLA/9/
       DATA MTROL/10/,MAZE1/11/
       DATA MGRAT/25/,MAZ15/30/
       DATA FORE1/31/,FORE3/33/,CLEAR/36/,RESER/40/
       DATA STREA/42/,EGYPT/44/,ECHOR/49/
       DATA TSHAF/61/
       DATA BSHAF/76/,MMACH/77/,DOME/79/,MTORC/80/
       DATA CAROU/83/
       DATA RIDDL/91/,LLD2/94/,TEMP1/96/,TEMP2/97/,MAINT/100/
       DATA MCYCL/101/,BLROO/102/,TREAS/103/,RIVR1/107/,RIVR2/108/
       DATA        RIVR3/109/
       DATA RIVR4/112/,RIVR5/113/,FCHMP/114/,MBARR/119/,FALLS/120/
       DATA MRAIN/121/,POG/122/,VLBOT/126/,VAIR1/127/,VAIR2/128/
       DATA        VAIR3/129/,VAIR4/130/
       DATA LEDG2/131/,LEDG3/132/,LEDG4/133/,MSAFE/135/,CAGER/140/
       DATA CAGED/141/,TWELL/142/,BWELL/143/,ALICE/144/,ALISM/145/
       DATA        ALITR/146/,MTREE/147/,BKENT/148/
       DATA BKVW/151/,BKTWI/153/,BKVAU/154/,BKBOX/155/
       DATA       CRYPT/157/,TSTRS/158/,MRANT/159/
       DATA MREYE/160/,MRA/161/,MRB/162/,MRC/163/,MRG/164/
       DATA       MRD/165/,FDOOR/166/,MRAE/167/
       DATA MRCE/171/,MRCW/172/,MRGE/173/,MRGW/174/,MRDW/176/
       DATA       INMIR/177/,SCORR/179/
       DATA NCORR/182/,PARAP/183/,CELL/184/,PCELL/185/,NCELL/186/
       DATA       CPANT/188/,CPOUT/189/
       DATA CPUZZ/190/
C
       DATA CINTW/1/,DEADXW/2/,FRSTQW/3/,INXW/4/
       DATA OUTXW/5/,WALKIW/6/,FIGHTW/7/,FOOW/8/
C
       DATA READW/100/,MELTW/101/
       DATA INFLAW/102/,DEFLAW/103/,ALARMW/104/,EXORCW/105/
       DATA PLUGW/106/,KICKW/107/,WAVEW/108/,RAISEW/109/,LOWERW/110/
       DATA RUBW/111/,PUSHW/112/,UNTIEW/113/,TIEW/114/,TIEUPW/115/
       DATA TURNW/116/,BREATW/117/,KNOCKW/118/,LOOKW/119/
       DATA EXAMIW/120/,SHAKEW/121/,MOVEW/122/,TRNONW/123/,TRNOFW/124/
       DATA OPENW/125/,CLOSEW/126/,FINDW/127/,WAITW/128/,SPINW/129/
       DATA BOARDW/130/,UNBOAW/131/,TAKEW/132/,INVENW/133/
       DATA FILLW/134/,EATW/135/,DRINKW/136/,BURNW/137/
       DATA MUNGW/138/,KILLW/139/,ATTACW/141/
       DATA SWINGW/140/,WALKW/142/,TELLW/143/,PUTW/144/
       DATA DROPW/145/,GIVEW/146/,POURW/147/,THROWW/148/
C
       DATA DIGW/89/,LEAPW/91/,STAYW/73/,FOLLOW/85/
       DATA HELLOW/151/,LOOKIW/152/,LOOKUW/153/,PUMPW/154/
       DATA WINDW/155/,CLMBW/156/,CLMBUW/157/,CLMBDW/158/,TRNTOW/159/
C
       DATA VISIBT/32768/,READBT/16384/,TAKEBT/8192/,DOORBT/4096/,
     1       TRANBT/2048/,FOODBT/1024/,NDSCBT/512/,DRNKBT/256/,
     2       CONTBT/128/,LITEBT/64/,VICTBT/32/,BURNBT/16/,
     3       FLAMBT/8/,TOOLBT/4/,TURNBT/2/,ONBT/1/
C
       DATA FINDBT/32768/,SLEPBT/16384/,SCRDBT/8192/,TIEBT/4096/,
     1       CLMBBT/2048/,ACTRBT/1024/,WEAPBT/512/,FITEBT/256/,
     2       VILLBT/128/,STAGBT/64/,TRYBT/32/,NOCHBT/16/,
     3       OPENBT/8/,TCHBT/4/,VEHBT/2/,SCHBT/1/
C
       DATA GARLI/2/,FOOD/3/,GUNK/4/,COAL/5/,MACHI/7/,DIAMO/8/
       DATA       TCASE/9/,BOTTL/10/
       DATA WATER/11/,ROPE/12/,KNIFE/13/,SWORD/14/,LAMP/15/,BLAMP/16/
       DATA       RUG/17/,LEAVE/18/,TROLL/19/,AXE/20/
       DATA RKNIF/21/,KEYS/23/,BAR/26/,ICE/30/
       DATA COFFI/33/,TORCH/34/,TBASK/35/,FBASK/36/,IRBOX/39/
       DATA GHOST/42/,TRUNK/45/,BELL/46/,BOOK/47/,CANDL/48/
       DATA MATCH/51/,TUBE/54/,PUTTY/55/,WRENC/56/,SCREW/57/
       DATA       CYCLO/58/,CHALI/59/
       DATA THIEF/61/,STILL/62/,WINDO/63/,GRATE/65/,DOOR/66/
       DATA HPOLE/71/,RBUTT/79/,LEAK/78/,RAILI/75/
       DATA POT/85/,STATU/86/,IBOAT/87/,DBOAT/88/,PUMP/89/,RBOAT/90/
       DATA STICK/92/,BUOY/94/,SHOVE/96/,GUANO/97/,BALLO/98/,RECEP/99/
       DATA BROPE/101/,HOOK1/102/,HOOK2/103/,SAFE/105/,SSLOT/107/
       DATA       BRICK/109/,FUSE/110/
       DATA GNOME/111/,BLABE/112/,DBALL/113/,TOMB/119/
       DATA LCASE/123/,CAGE/124/,RCAGE/125/,SPHER/126/,SQBUT/127/
       DATA FLASK/132/,POOL/133/,SAFFR/134/,BUCKE/137/,ORICE/139/
       DATA       ECAKE/138/,RDICE/140/
       DATA BLICE/141/,ROBOT/142/,FTREE/145/,BILLS/148/,PORTR/149/
       DATA SCOL/151/,ZGNOM/152/,EGG/154/,BEGG/155/,BAUBL/156/
       DATA       CANAR/157/,BCANA/158/,YLWAL/159/
       DATA RDWAL/161/,PINDR/164/
       DATA RBEAM/171/,ODOOR/172/,QDOOR/173/,CDOOR/175/
       DATA       NUM1/178/
       DATA NUM8/185/,WARNI/186/,CSLIT/187/,GCARD/188/,STLDR/189/
       DATA ITOBJ/192/,OPLAY/193/,EVERY/194/
       DATA       VALUA/195/,SAILO/196/,TEETH/197/,WALL/198/
       DATA HANDS/200/,LUNGS/201/,AVIAT/202/
       DATA WNORT/205/,GWATE/209/,MASTER/215/
C DUNGEON, PAGE 3
C
       END
