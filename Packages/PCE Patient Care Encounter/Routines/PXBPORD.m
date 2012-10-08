PXBPORD ;ISL/JVS - PROMPT ORDERING PROVIDER ; 6/27/07 6:45pm
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**124,186**;Aug 12, 1996;Build 3
 ;
ORD ;--Ordering Provider
 N TIMED,DATA,DIC,X,Y,CPTORD
 S CPTORD=$S($P(REQI,U,22):$P(^VA(200,$P(REQI,U,22),0),U,1),1:"")
 S TIMED="I '$T!(DATA[""^"")"
 D WIN17^PXBCC(PXBCNT),LOC^PXBCC(16,0)
 W IOSC,IOEDEOP
O ;--SECOND ENTRY POINT
 ; begin patch *186*
 ;W IORC," Enter Ordering Provider: "_$G(CPTORD)_"//",IOELEOL
 W IORC," Enter Ordering Provider: "_$G(CPTORD)_" // "
 W IOSC,IOELEOL
 ; end patch *186*
 R DATA:DTIME
O1 ;---
 X TIMED I  G ORDX
 I DATA="@" S $P(REQI,"^",22)="@" G ORDX
 I DATA="^"!(DATA="^^")!(DATA["^O") G ORDX
 ;I DATA="?" D EN1^PXBHLP0("PXB","ORD",1,"",1) G O
 ;I DATA="??" S DOUBLEQQ=1 D EN1^PXBHLP0("PXB","ORD","",1,2) S:DATA="O" UDATA="^O" S:$L(DATA,"^")>1 (Y,DATA,EDATA)=$P(DATA,"^",2) S:$G(UDATA)="" UDATA="^O" S:UDATA="^O" (DATA,EDATA,Y)=UDATA G:UDATA="^O" O1
 I DATA="?" D HELP^PXBUTL0("OP1") G O
 I DATA="??" D HELP^PXBUTL0("OP2") G O
 I DATA="",$G(CPTORD)'="" S DATA=CPTORD
 I DATA="" G ORDX
 D CASE^PXBUTL
 ;----SPACE BAR---
 I DATA'=" ",DATA'["^",DATA'="" S ^DISV(DUZ,"PXBORD-22")=DATA
 I DATA=" ",$D(^DISV(DUZ,"PXBORD-22")) S DATA=^DISV(DUZ,"PXBORD-22") W DATA
 ;--If a "?" is NOT entered during lookup
 ; begin patch *186*
 ; S X=DATA,DIC=200,DIC(0)="OQME" D ^DIC
 ; I Y=-1 S $P(REQE,U,22)="" G ORDX
 S DIC("S")="I $$ACTIVPRV^PXAPI(Y,$G(IDATE,DT))"
 S X=DATA,DIC=200,DIC(0)="OQME" D ^DIC
 I +Y>0 D
 . W IORC W:$G(CPTORD)'=X X W IOEDEOP
 E  D  G O
 . N EDATA S EDATA=X
 . D LOC^PXBCC(16,0),HELP^PXBUTL0("PRVM")
 . D HELP1^PXBUTL1("CON") R X:DTIME
 . D LOC^PXBCC(16,0) W IOSC,IOEDEOP
 ; end patch *186*
 ;
 S $P(REQI,U,22)=+Y,$P(REQE,U,22)=$P(Y,U,2)
ORDX ;--EXIT AND CLEANUP
 I '$D(REQE) S REQE=""
 I $P(REQE,U,22)="" S $P(REQI,U,22)=""
 Q