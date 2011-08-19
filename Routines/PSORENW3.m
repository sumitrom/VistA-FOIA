PSORENW3 ;IHS/DSD/JCM - EDIT TEMPLATE FOR RENEW RX ORDER ENTRY ; 03/28/93 20:59
 ;;7.0;OUTPATIENT PHARMACY;**11,20,46,100,117**;DEC 1997
 ;External reference to ^PSDRUG supported by DBIA 221
 ;External reference to ^SC supported by DBIA 10040
 ;
START ;
 D INIT
 ;
1 S PSORENW("FLD")=1 D ISSDT^PSODIR2(.PSORENW) ; Get Issue Date
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
2 S PSORENW("FLD")=2 D FILLDT^PSODIR2(.PSORENW) ; Get Fill date
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
3 S PSORENW("FLD")=3 D PROV^PSODIR(.PSORENW) ; Get Provider
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
4 S PSORENW("FLD")=4,PSORENW("DAYS SUPPLY")=$P(PSORENW("RX0"),"^",8)
 K PSORENW("# OF REFILLS") D REFILL^PSODIR1(.PSORENW) ; Get # of refills
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
5 S PSORENW("FLD")=5 D RMK^PSODIR2(.PSORENW) ; Get Remarks
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
6 S PSORENW("FLD")=6 D MW^PSODIR2(.PSORENW) ; Get Mail/Window Info
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
 ;
7 I $G(DUZ("AG"))="I" S PSORENW("FLD")=7 D EXP^PSODIR2(.PSORENW) ; Get Expiration Date - Indian Health Service ONLY
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
8 I $G(DUZ("AG"))="I" S PSORENW("FLD")=8 D CLERK^PSODIR2(.PSORENW) ; Get Clerk Code
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
9 S PSORENW("FLD")=9 D CLINIC^PSODIR2(.PSORENW)
 G:PSORENW("DFLG") END G:PSORENW("FIELD") @PSORENW("FIELD")
 ;
END ;
 K PSORENW3 S PSORENW("EDIT")=1
 Q
 ;
INIT ;
 S PSORENW("QTY")=$P(PSORENW("RX0"),"^",7)
 I '$G(PSORENW("DAYS SUPPLY")) S PSORENW("DAYS SUPPLY")=$P(PSORENW("RX0"),"^",8)
 S (PSORENW("DFLG"),PSORENW("FIELD"),PSORENW3)=0
 G:$G(PSORENW("EDIT")) INITX
 S PSORENW("ISSUE DATE")=$S(DT>PSORENW("FILL DATE"):PSORENW("FILL DATE"),1:DT)
 S PSORENW("CLINIC")=$P(PSORENW("RX0"),"^",5)
 I $G(PSOFDR),$P($G(OR0),"^",13) S PSORENW("CLINIC")=$P($G(OR0),"^",13)
 S:PSORENW("CLINIC") PSORX("CLINIC")=$P(^SC(PSORENW("CLINIC"),0),"^")
 S Y=PSORENW("FILL DATE") X ^DD("DD") S PSORX("FILL DATE")=Y K Y
 S PSORENW("PROVIDER")=$S($G(PSORENW("PROVIDER")):PSORENW("PROVIDER"),1:$P(PSORENW("RX0"),"^",4))
 S PSORENW("PROVIDER NAME")=$P($G(^VA(200,PSORENW("PROVIDER"),0)),"^")
 S PSORENW("PTST NODE")=$G(^PS(53,$P(PSORENW("RX0"),"^",3),0))
 S PSORENW("# OF REFILLS")=$S($G(PSORENW("# OF REFILLS")):PSORENW("# OF REFILLS"),1:$P(PSORENW("RX0"),"^",9))
 S PSORENW("REMARKS")="RENEWED FROM RX # "_$P(PSORENW("RX0"),"^")
 S PSORX("MAIL/WINDOW")=$S($G(PSORX("MAIL/WINDOW"))]"":PSORX("MAIL/WINDOW"),$P(PSORENW("RX0"),"^",11)="W":"WINDOW",1:"MAIL")
 S:$G(PSORX("CLERK CODE"))']"" PSORX("CLERK CODE")=$P($G(^VA(200,DUZ,0)),"^")
 S PSORENW("INS")=$S($G(PSORENW("INS"))]"":PSORENW("INS"),1:$G(^PSRX(PSORENW("OIRXN"),"INS")))
 F D=0:0 S D=$O(^PSRX(PSORENW("OIRXN"),"INS1",D)) Q:'D  S PSORENW("SIG",D)=^PSRX(PSORENW("OIRXN"),"INS1",D,0)
 I '$O(PSORENW("DOSE",0)) F I=0:0 S I=$O(^PSRX(PSORENW("OIRXN"),6,I)) Q:'I  S DOSE=^PSRX(PSORENW("OIRXN"),6,I,0) D
 .S PSORENW("ENT")=$G(PSORENW("ENT"))+1,PSORENW("DOSE",PSORENW("ENT"))=$P(DOSE,"^")
 .S PSORENW("UNITS",PSORENW("ENT"))=$P(DOSE,"^",3),PSORENW("DOSE ORDERED",PSORENW("ENT"))=$P(DOSE,"^",2),PSORENW("ROUTE",PSORENW("ENT"))=$P(DOSE,"^",7)
 .S PSORENW("SCHEDULE",PSORENW("ENT"))=$P(DOSE,"^",8),PSORENW("DURATION",PSORENW("ENT"))=$P(DOSE,"^",5),PSORENW("CONJUNCTION",PSORENW("ENT"))=$P(DOSE,"^",6)
 .S PSORENW("NOUN",PSORENW("ENT"))=$P(DOSE,"^",4),PSORENW("VERB",PSORENW("ENT"))=$P(DOSE,"^",9)
 .I $G(^PSRX(PSORENW("OIRXN"),6,I,1))]"" S PSORENW("ODOSE",PSORENW("ENT"))=^PSRX(PSORENW("OIRXN"),6,I,1)
 .K DOSE
 I $P($G(^PSRX(PSORENW("OIRXN"),"SIG")),"^",2),'$O(SIG(0)) S SIGOK=1 D  Q
 .F I=0:0 S I=$O(^PSRX(PSORENW("OIRXN"),"SIG1",I)) Q:'I  S SIG(I)=^PSRX(PSORENW("OIRXN"),"SIG1",I,0)
 .I '$O(SIG(0)),$G(ORD),$G(PSOORRNW) F I=0:0 S I=$O(^PS(52.41,ORD,"SIG",I)) Q:'I  S SIG(I)=^PS(52.41,ORD,"SIG",I,0)
 .I '$O(SIG(0)) S SIG(1)="This Prescription is MISSING Required Medication Instructions for the Patient.  Please Review Dosaging Instructions."
 I $P($G(^PSRX(PSORENW("OIRXN"),"SIG")),"^")]"",'$P(^("SIG"),"^",2),'$O(SIG(0)) S SIGOK=1 D
 .S X=$P($G(^PSRX(PSORENW("OIRXN"),"SIG")),"^") D SIG^PSOHELP I $G(INS1)]"" S SIG(1)=$E(INS1,2,999)
 .I '$O(SIG(0)) S (PSORENW("SIG"),SIG(1))="This Prescription is MISSING Required Usable Medication Instructions for the Patient.  Please Review Dosaging Instructions."
INITX Q
JUMP ;
 S PSORENW("FIELD")=$S(+Y=1:1,+Y=22:2,+Y=4:3,+Y=5:9,+Y=9:4,+Y=12:5,+Y=11:6,+Y=29:7,+Y=16:8,1:PSORENW("FLD"))
 Q
DSPLY ;called from PSORENW0
 W !!,PSORENW("NRX #"),?12," ",$P(^PSDRUG(PSORENW("DRUG IEN"),0),"^"),?46," QTY: ",$P(PSORENW("RX0"),"^",7)
 W !,"# OF REFILLS: "_$S($G(PSORENW("# OF REFILLS")):PSORENW("# OF REFILLS"),1:$P(PSORENW("RX0"),"^",9))
 W "  ISSUED: "_$S(DT>PSORENW("FILL DATE"):$E(PSORENW("FILL DATE"),4,5)_"-"_$E(PSORENW("FILL DATE"),6,7)_"-"_$E(PSORENW("FILL DATE"),2,3),1:$E(DT,4,5)_"-"_$E(DT,6,7)_"-"_$E(DT,2,3))
 ;S X=PSORENW("INS") D SIG^PSOHELP S PSORENW("SIG")=$E(INS1,2,9999999)
 F DR=1:1:PSORENW("ENT") I $G(PSORENW("DURATION",DR))]"" D
 .S DUR1=PSORENW("DURATION",DR)
 .S PSORENW("DURATION",DR)=$S($E(DUR1,1)'?.N:$E(DUR1,2,99)_$E(DUR1,1),1:DUR1)
 F D=0:0 S D=$O(^PSRX(PSORENW("OIRXN"),"INS1",D)) Q:'D  S PSORENW("SIG",D)=^PSRX(PSORENW("OIRXN"),"INS1",D,0)
 K DR,DUR1 ;D EN^PSOFSIG(.PSORENW)
 I $G(SIGOK) D:'$O(SIG(0))  W !,"SIG: " F D=0:0 Q:'$O(SIG(D))  S D=$O(SIG(D)) W SIG(D),!
 .F I=0:0 S I=$O(^PSRX(PSORENW("OIRXN"),"SIG1",I)) Q:'I  S SIG(I)=^PSRX(PSORENW("OIRXN"),"SIG1",I,0)
 .I '$O(SIG(0)) S SIG(1)="This Prescription is MISSING Required Usable Medication Instructions",SIG(2)="for the Patient.  Please Review Dosaging Instructions.",PSORENW("DFLG")=1
 E  W "  SIG: "_PSORENW("SIG")_"  "
 W "FILLED: "_$E(PSORENW("FILL DATE"),4,5)_"-"_$E(PSORENW("FILL DATE"),6,7)_"-"_$E(PSORENW("FILL DATE"),2,3)
 W !,"ROUTING: "_$S($G(PSORENW("MAIL/WINDOW"))["W":"WINDOW",1:"MAIL")
 W "     PHYS: "_PSORX("PROVIDER NAME"),!
 I $G(PSORENW("DFLG")),'$G(SPEED) K DIR S DIR(0)="E",DIR("A")="Rx NOT Renewed. Press Return to Continue" D ^DIR K DIR,DIRUT,DTOUT,DUOUT
DSPLYX Q