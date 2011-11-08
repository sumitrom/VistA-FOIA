PSDPWK2 ;BIR/JPW-Print Pharm Disp. Worksheet (Summary) ; 2 Aug 94
 ;;3.0; CONTROLLED SUBSTANCES ;**20**;13 Feb 97
 ;
 ; Reference to DD("DD" supported by DBIA # 10017
 ;
PRINT ;prints data for worksheet
 I SUM="S" D ^PSDPWK3 G DONE
 K LN S (COMM,PG,PSDOUT)=0,$P(LN,"-",132)="" D NOW^%DTC S Y=+$E(%,1,12) X ^DD("DD") S RPDT=Y D HEADER Q:PSDOUT
 I '$D(^TMP("PSDWK",$J)) W !!,?45,"****  NO PENDING REQUESTS FOR THIS DISPENSING LOCATION  ****" G DONE
 S VAR1="" F  S VAR1=$O(^TMP("PSDWK",$J,VAR1)) Q:VAR1=""!(PSDOUT)  D:$Y+5>IOSL HEADER Q:PSDOUT  S VAR2="" F  S VAR2=$O(^TMP("PSDWK",$J,VAR1,VAR2)) Q:VAR2=""!(PSDOUT)  D  Q:PSDOUT
 .F WK=0:0 S WK=$O(^TMP("PSDWK",$J,VAR1,VAR2,WK)) Q:'WK!(PSDOUT)  S NODE=^TMP("PSDWK",$J,VAR1,VAR2,WK) D  Q:PSDOUT
 ..S PSDR=$S(CNT=1:VAR2,ANS="N":VAR2,1:VAR1) S NAOU=$S(CNT=1:VAR1,ANS="N":VAR1,1:VAR2)
 ..D:$Y+8>IOSL HEADER Q:PSDOUT
 ..W !,WK,?10,PSDR,?52,$P(NODE,"^"),?60,NAOU,?100,$P(NODE,"^",2)
 ..W:$P($G(^PSD(58.85,+WK,2)),U,2) !,"* PRIORITY *"
 ..I $P(NODE,"^",3) S COMM=1 K ^UTILITY($J,"W") F TEXT=0:0 S TEXT=$O(^PSD(58.85,WK,1,TEXT)) Q:'TEXT  S X=$G(^PSD(58.85,WK,1,TEXT,0)),DIWL=15,DIWR=125,DIWF="W" D ^DIWP
 ..I COMM D ^DIWW S COMM=0
 ..W !!,?10,"Disp # ____________  Manufacturer: __________________   Lot # __________   Exp. Date: __________",!
 I $E(IOST,1,2)="C-",'PSDOUT,SUM="B" W !!,"Press <RET> to display the summary totals" R X:DTIME
 I SUM="B",'PSDOUT D PRINT^PSDPWK3
DONE I $E(IOST)'="C" W @IOF
 I $E(IOST,1,2)="C-",'PSDOUT W ! K DIR,DIRUT S DIR(0)="EA",DIR("A")="END OF REPORT!  Press <RET> to return to the menu" D ^DIR K DIR
END K %,%H,%I,%ZIS,ALL,ANS,C,CNT,COMM,DA,DIC,DIE,DIR,DIWF,DIWL,DIWR,DR,DTOUT,DUOUT,IO("Q"),JJ,JJ1,JJDA,LN,LOOP,LOOP2,NAOU,NODE
 K OK,ORD,ORDN,PG,POP,PRT,PSD,PSDCPY,PSDEV,PSDN,PSDNA,PSDOUT,PSDR,PSDRN,PSDS,PSDSN,PSDT,QTY,RPDT,SEL,SUM,TEXT,VAR1,VAR2,WK,X,Y,^TMP("PSDWK",$J),^TMP("PSDWKT",$J)
 K ZTDESC,ZTDTH,ZTIO,ZTRTN,ZTSAVE,ZTSK
 D ^%ZISC S:$D(ZTQUEUED) ZTREQ="@"
 Q
HEADER ;lists header information
 I $E(IOST,1,2)="C-",PG W ! K DA,DIR S DIR(0)="E" D ^DIR K DIR I 'Y S PSDOUT=1 Q
 W:$Y @IOF S PG=PG+1 W !,?40,"PHARMACY DISPENSING WORKSHEET",!!,"Dispensing Location: ",PSDSN,?65,RPDT,?105,"PG "_PG,!!
 W "WS #",?10,"DRUG",?50,"QUANTITY",?60,"DISPENSE TO",!,?12,"COMMENTS",?50,"ORDERED",?60,"LOCATION",?102,"ORDERED BY",!,LN,!
 Q