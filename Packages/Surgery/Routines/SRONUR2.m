SRONUR2 ;B'HAM ISC/MAM - NURSE STAFF REPORT (1) ; [ 09/22/98  11:36 AM ]
 ;;3.0; Surgery ;**77,50**;24 Jun 93
DATE D DATE^SROUTL(.SRSD,.SRED,.SRSOUT) Q:SRSOUT
 K %ZIS,IOP,IO("Q"),POP S %ZIS="QM",%ZIS("A")="Print the Report on which Device: " W !!,"This report is designed to use a 132 column format.",! D ^%ZIS I POP S SRSOUT=1 Q
 I $D(IO("Q")) K IO("Q") S ZTDESC="SURGICAL NURSE STAFFING REPORT",ZTRTN="BEG^SRONUR2",(ZTSAVE("SRSD*"),ZTSAVE("SRED*"),ZTSAVE("SRINST"),ZTSAVE("SRONUR*"),ZTSAVE("SRSITE*"))="" D ^%ZTLOAD Q
 D BEG
 Q
SET ; set variables
 I $Y+6>IOSL D PAGE Q:SRSOUT
 S MATCH=0,SR(0)=^SRF(SRTN,0),DFN=$P(SR(0),"^") D DEM^VADPT S SRNM=VADM(1),SSN=VA("PID") S:$L(SRNM)>25 SRNM=$P(SRNM,",")_", "_$E($P(SRNM,",",2))
 S SROD=$P(SR(0),"^",9),SROD=$E(SROD,4,5)_"/"_$E(SROD,6,7)_"/"_$E(SROD,2,3)
 K SCRUB S SCRUB(1)="",(SCRUB,CNT)=0 F I=0:0 S SCRUB=$O(^SRF(SRTN,23,SCRUB)) Q:'SCRUB  S CNT=CNT+1,Y=$P(^SRF(SRTN,23,SCRUB,0),"^"),X=$P(^VA(200,Y,0),"^") S:$L(X)>17 X=$P(X,",")_", "_$E($P(X,",",2)) S SCRUB(CNT)=X I Y=SRONUR S MATCH=1
 K CIRC S CIRC(1)="",(CIRC,CNT)=0 F I=0:0 S CIRC=$O(^SRF(SRTN,19,CIRC)) Q:'CIRC  S CNT=CNT+1,Y=$P(^SRF(SRTN,19,CIRC,0),"^"),X=$P(^VA(200,Y,0),"^") S:$L(X)>17 SX=$P(X,",")_", "_$E($P(X,",",2)) S CIRC(CNT)=X I Y=SRONUR S MATCH=1
 Q:'MATCH
OPS S SROPER=$P(^SRF(SRTN,"OP"),"^"),OP=0 F I=0:0 S OP=$O(^SRF(SRTN,13,OP)) Q:'OP  D OTHER
 K SROPS,MM,MMM S:$L(SROPER)<50 SROPS(1)=SROPER I $L(SROPER)>49 S SROPER=SROPER_"  " F M=1:1 D LOOP Q:MMM=""
 S SR(.2)=^SRF(SRTN,.2),SRTI=$P(SR(.2),"^",10),SRTO=$P(SR(.2),"^",12),X=SRTI,X1=SRTO D MINS^SRSUTL2 S SRET=X
 S Y=SRTI D D^DIQ S SRFIND=$F(Y,":"),SRTI=$S(SRFIND:$E(Y,SRFIND-3,SRFIND+1),1:"")
 S Y=SRTO D D^DIQ S SRFIND=$F(Y,":"),SRTO=$S(SRFIND:$E(Y,SRFIND-3,SRFIND+1),1:"")
 S:SRTI="" (SRTI,SRET)="-"
PRINT ; print information
 W !!,SROD,?9,SRNM,?35,SROPS(1),?87,$E(SCRUB(1),1,22),?106,$E(CIRC(1),1,22),?125,SRTI
 W !,SRTN,?9,VA("PID") W:$D(SROPS(2)) ?35,SROPS(2) W:$D(SCRUB(2)) ?87,$E(SCRUB(2),1,18) W:$D(CIRC(2)) ?106,$E(CIRC(2),1,18) W ?125,SRTO
 W ! W:$D(SROPS(3)) ?35,SROPS(3) W:$D(SCRUB(3)) ?87,$E(SCRUB(3),1,18) W:$D(CIRC(3)) ?106,$E(CIRC(3),1,18) W ?125,SRET
 S MORE=4 I $D(SROPS(4)) S MORE=5 W !,?35,SROPS(4) W:$D(SCRUB(4)) ?87,$E(SCRUB(4),1,18) I $D(CIRC(4)) W ?106,$E(CIRC(4),1,18)
 F I=MORE:1:10 I $D(SCRUB(I))!$D(CIRC(I)) W ! W:$D(SCRUB(I)) ?87,$E(SCRUB(I),1,18) W:$D(CIRC(I)) ?106,$E(CIRC(I),1,18)
 Q
OTHER ; other operations
 S SRLONG=1 I $L(SROPER)+$L($P(^SRF(SRTN,13,OP,0),"^"))>250 S SRLONG=0,OP=999,SROPERS=" ..."
 I SRLONG S SROPERS=$P(^SRF(SRTN,13,OP,0),"^")
 S SROPER=SROPER_$S(SROPERS=" ...":SROPERS,1:", "_SROPERS)
 Q
LOOP ; break procedure if greater than 50 characters
 S SROPS(M)="" F LOOP=1:1 S MM=$P(SROPER," "),MMM=$P(SROPER," ",2,200) Q:MMM=""  Q:$L(SROPS(M))+$L(MM)'<50  S SROPS(M)=SROPS(M)_MM_" ",SROPER=MMM
 Q
HDR ; print heading
 I $D(ZTQUEUED) D ^SROSTOP I SRHALT S SRSOUT=1 Q
 W:$Y @IOF W !,?(132-$L(SRINST)\2),SRINST,?120,"PAGE: "_PAGE,!,?58,"SURGICAL SERVICE",?100,"REVIEWED BY: ",!,?51,"SURGICAL NURSE STAFFING REPORT",?100,"DATE REVIEWED: "
 W !,?(132-$L(SRFRTO)\2),SRFRTO,?100,SRPRINT
 W !!,"DATE",?10,"PATIENT",?35,"OPERATION(S)",?87,"SCRUB NURSE",?105,"CIRC. NURSE",?122,"TIME IN",!,"CASE #",?12,"ID#",?122,"TIME OUT",!,?118,"ELAPSED (MINS)",! F I=1:1:IOM W "="
 S PAGE=PAGE+1
 Q
PAGE I $E(IOST)'="P" W !!,"Press RETURN to continue, or '^' to quit:  " R X:DTIME I '$T!(X["^") S SRSOUT=1 Q
 D HDR
 Q
BEG ; entry when queued
 U IO S SRSDT=SRSD-.0001,SREDT=SRED+.9999,SRSOUT=0,PAGE=1
 S Y=SRSD X ^DD("DD") S SRFRTO="FROM: "_Y_"  TO: ",Y=SRED X ^DD("DD") S SRFRTO=SRFRTO_Y,Y=DT X ^DD("DD") S SRPRINT="DATE PRINTED: "_Y D HDR
 F  S SRSDT=$O(^SRF("AC",SRSDT)) Q:'SRSDT!(SRSDT>SREDT)!(SRSOUT)  S SRTN=0 F  S SRTN=$O(^SRF("AC",SRSDT,SRTN)) Q:'SRTN!(SRSOUT)  I $D(^SRF(SRTN,0)),$P($G(^SRF(SRTN,.2)),"^",12)'="",$$DIV^SROUTL0(SRTN) D SET
 W:$E(IOST)="P" @IOF I $D(ZTQUEUED) Q:$G(ZTSTOP)  S ZTREQ="@"
 Q