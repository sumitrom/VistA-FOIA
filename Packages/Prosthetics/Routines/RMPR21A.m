RMPR21A ;PHX/HNB/JLT-CONT. CREATE 1358 TRANSACTION, POST TO 2319 ;8/29/1994
 ;;3.0;PROSTHETICS;**12,41,50,90,129**;Feb 09, 1996;Build 2
 ;HNC - #90, item to billing item 10/29/04
 ;Per VHA Directive 10-93-142, this routine should not be modified.
P24 ;2421 DATE REQUIRED
 S DR="20//T+30" D ^DIE I $D(DTOUT)!($D(Y)'=0) G KILL^RMPR21
COT ;2421'S AND NO FORM WITH CONTRACT AUTHORITY1
 I '$D(^RMPR(664,RMPRA,3)) S ^(3)=""
 S DR="4"
COT1 D ^DIE I $D(DTOUT)!($D(Y)'=0) G KILL^RMPR21
 S RMPRV=$P($G(^RMPR(664,RMPRA,0)),U,4) G:$G(RMPRV)'>0 TRAN G:'$D(^PRC(440,RMPRV,4)) TRAN K DIR S DIR(0)="PO^PRC(440,"_RMPRV_",4,:QEM" D ^DIR I (Y'>0)&(X'="")&(X'["^") S DIR("B")="" G COT1
 I X["^" G KILL^RMPR21
 I Y>0,$P(^PRC(440,RMPRV,4,+Y,0),U,2)<DT W $C(7),!,"Sorry, contract has expired.  Enter another contract or `return` to continue." S DR="4//""""" G COT1
 K DIR,DA S:Y>0 (RMPRCONT,RMPRCTK)=$P(Y,U,2)
L2 ;ENTER/EDIT 2421, NO FORM
 W !,"----------------------------------",!
TRAN K DIR S DIR(0)="SMAO^I:INITIAL ISSUE;R:REPLACE;S:SPARE;X:REPAIR"
 S DIR("A")="TYPE OF TRANSACTION: " D ^DIR
 I $D(DUOUT)!$D(DTOUT) G CHK
 I (Y="")&($D(^RMPR(664,RMPRA,1))) G CHK
 I (Y="")&('$D(^RMPR(664,RMPRA,1))) W !,"Please enter type of Transaction!!" G TRAN
 S RMTYPE=Y
PCAT K DIR S DIR(0)="SMAO^1:SC/OP;2:SC/IP;3:NSC/IP;4:NSC/OP"
 S DIR("A")="PATIENT CATEGORY: " D ^DIR
 I $D(DUOUT)!$D(DTOUT) G CHK
 I (Y="")&($D(^RMPR(664,RMPRA,1))) G CHK
 I (Y="")&('$D(^RMPRA(664,RMPRA,1))) W !,"Please enter Patient Category!!" G PCAT
 S RMCAT=Y
 K DIR G:RMCAT<4 ITEM
SPES S DIR(0)="SMAO^1:SPECIAL LEGISLATION;2:A&A;3:PHC;4:ELIGIBILITY REFORM"
 S DIR("A")="SPECIAL CATEGORY: "
 I RMCAT=4 D ^DIR I $D(DUOUT)!$D(DTOUT) G CHK
 I RMCAT=4 S RMSPE=Y
ITEM ;
 K DIR S DIR(0)="FO",DIR("A")="Select BILLING ITEM"
 S DIR("?")="^S RFL=1 D ZDSP^RMPR21A"
 D ^DIR G:$D(DTOUT) KILL^RMPR21 G:$D(DUOUT) CHK
 G:$D(DIRUT)&($D(^RMPR(664,RMPRA,1))) CHK
 S DIC=661,DIC(0)="EQMZ" D ^DIC G:+Y'>0 ITEM
 D EDT^RMPRUTIL G:$D(DTOUT) KILL^RMPR21 G L2
 ;
CHK K RFL,DIR S FL=1
 I '$D(^RMPR(664,RMPRA,1)) W !!,?5,$C(7),"REQUIRED FIELDS DO NOT EXIST ON THIS FORM",! G KILL^RMPR21
 I $D(^RMPR(664,RMPRA,1)) S FL=0 F RI=0:0 S RI=$O(^RMPR(664,RMPRA,1,RI)) Q:RI'>0  I $D(^(RI,0)) S FL=1 I $P(^(0),U,3)=""!($P(^(0),U,4)="")!($P(^(0),U,5)="")!($P(^(0),U,9)="")!($P(^(0),U,10)="") S FL=0 Q
 I 'FL W !!,?5,$C(7),"REQUIRED FIELDS DO NOT EXIST ON THIS FORM",! G KILL^RMPR21
 S $P(^RMPR(664,RMPRA,0),U,9)=DUZ
 I $D(DUOUT)&('$D(^RMPR(664,RMPRA,1))) W !,$C(7),$C(7),"Please Try Later!" G KILL^RMPR21
 I RMPRF'=8 S DA=RMPRA,DIE=664,DR="11;17" D ^DIE
ASK I RMPRF=2 D  D ^DIR K DIR G:$D(DTOUT) KILL^RMPR21 I $D(DIRUT)!(X="") W $C(7),"Delivery is required.  Enter '?' for additional help." G ASK
 .K DIR
 .S DIR(0)="SAO^1:VETERAN;2:VAMC WAREHOUSE;3:PROSTHETICS;4:OTHER;"
 .S DIR("A")="DELIVER TO: "
 .;S DIR("B")=$P(^RMPR(664,RMPRA,3),U,1)
 .;D ^DIR K DIR G:$D(DTOUT) KILL^RMPR21 I $D(DIRUT) W $C(7)," ??" G ASK
 I RMPRF=2 S RMPRDELN=Y(0),$P(^RMPR(664,RMPRA,3),U)=RMPRDELN I Y=4 D  G:$D(DTOUT) KILL^RMPR21
 .S DIE="^RMPR(664,",DA=RMPRA,DR="21.1T" D ^DIE
 .Q
ASK5 S %=2 W !!,"Are you ready to POST to IFCAP and 10-2319 NOW" D YN^DICN G:%=1 FILE^RMPR21B G:$D(DTOUT) KILL^RMPR21
 I %=0 W !,"This will Create a Daily Transaction in the 1358 Module of IFCAP,",!,"and Create an Entry on the Prosthetic 10-2319 Record" G ASK5
 I %=-1 S %=2 R !,"Do you want to Delete this Transaction" D YN^DICN G:$D(DTOUT)!(%=1) KILL^RMPR21
 D ^RMPRLI I RMPRX]"" G ASK5
L W !!!,"Enter Item to Edit: " R X:DTIME G:'$T KILL^RMPR21
 G:"^"[X ASK5 I X["?" D ZDSP G L
 S DA(1)=RMPRA,DIC="^RMPR(664,"_RMPRA_",1,",DIC(0)="EQMZ" D ^DIC I +Y'>0 K DA,Y G L
 ;HCPCS code
 S:$D(RMPRCTK) RMPRCONT=RMPRCTK
 S DA=+Y,DA(1)=RMPRA
 S DR="8;9;S RMTYPE=$P($G(^(0)),U,9);I $P(^RMPR(664,DA(1),1,DA,0),U,10)=4 S Y=""@1"";.01;16;1;14;3;2;4;7;S Y="""";@1;10;.01;16;1;14;3;2;4;7"
 S DIE="^RMPR(664,"_RMPRA_",1," D ^DIE
 ;do a final check for cpt modifier
 D CHKCPT
 K DA
 S FL=1 I $D(^RMPR(664,RMPRA,1)) S FL=0 F RI=0:0 S RI=$O(^RMPR(664,RMPRA,1,RI)) Q:RI'>0  I $D(^(RI,0)) S FL=1 I $P(^(0),U,3)=""!($P(^(0),U,4)="")!($P(^(0),U,5)="")!($P(^(0),U,9)="")!($P(^(0),U,10)="") S FL=0 Q
 I 'FL W !!,?5,$C(7),"REQUIRED ITEMS DO NOT EXIST ON THIS FORM",! G KILL^RMPR21
 K DA S DIE="^RMPR(664,",DA=RMPRA,DR="11;17" S:RMPRF=2 DR=DR_";20" D ^DIE
 I RMPRF=2 D  G:$D(DTOUT) KILL^RMPR21 G:$D(DUOUT) ASK5
 .S DIR(0)="SA^1:VETERAN;2:VAMC WAREHOUSE;3:PROSTHETICS;4:OTHER;"
 .S DIR("A")="DELIVER TO: "
 .;REMOVE DIR(?)
 .S DIR("B")=$P(^RMPR(664,DA,3),U,1)
 .D ^DIR K DIR
 .Q:$D(DTOUT)!($D(DUOUT))
 .S RMPRDELN=Y(0)
 .I Y=4 S:'$D(^RMPR(664,RMPRA,3)) ^(3)="" S Y1=Y,DIE="^RMPR(664,",DA=RMPRA,DR="21.1T" D ^DIE
 G:$D(DTOUT) KILL^RMPR21 K Y1 G L
 ;
ZDSP ;MULTIPLE ITEM DISPLAY FOR PURCHASING AND CLOSE-OUT
 K RAC S RMPRI=0 F  S RMPRI=$O(^RMPR(664,RMPRA,1,RMPRI)) Q:RMPRI'>0  S RMPRI1=$P(^(RMPRI,0),U,1),RMPRIT=$P(^RMPR(661,RMPRI1,0),U,1),RAC(RMPRIT)=$P(^PRC(441,RMPRIT,0),U,2)
 W ! I $D(RAC) W !,?5,"Answer With Item # or Item Name",! F RI=0:0 S RI=$O(RAC(RI)) Q:RI'>0  W !,?5,RI,?10,RAC(RI)
LDIC I $D(RFL) S X="?",DIC=661,DIC(0)="EQM",DIC("W")="W "" "",$P(^PRC(441,$P(^(0),U,1),0),U,2)" D ^DIC K RFL
 Q
PR1 ;ENTRY POINT FOR  10-2421S   ASKING THE USER IF THEY WANT TO PRINT THE PATIENT NOTIFICATION LETTER
 Q:RMPRF'=2
 S RMPRPN=0,%=2
 R !,"Would you like to print a Patient Notification letter"
 D YN^DICN I %=1 S RMPRPN=1 Q
 G:%=0 HELP1
 Q:(%=2)!(%=-1)
 Q
HELP1 ;
 W !,"Enter `Y` for YES to print the Patient Notification letter",!,"`N` for No if you do not wish to print the letter." G PR1
 Q
PR ;ENTRY POINT FOR BOTH 10-2421S AND 10-55S ASKING THE USER IF THEY WANT TO PRINT THE PRIVACY ACT STATEMENT
 S %=1 R !,"Would you like to print the Privacy Act Statement" D YN^DICN I %=1 S RMPRPRIV=1 D PR1 Q
 G:%=0 HELP D:%=2 PR1 Q
 Q:%=-1
HELP W !,"Enter `Y` for YES to print the Privacy Act Statement",!,"`N` for NO if you do not want to print the statement." G PR
 Q
 ;
CHKCPT ;check for cpt modifier
 S RMCPTOLD=$P($G(^RMPR(664,DA(1),1,DA,4)),U,2)
 S RMTYNEW=$P(^RMPR(664,DA(1),1,DA,0),U,9)
 S RMHCPC=$P(^RMPR(664,DA(1),1,DA,0),U,16) Q:'$G(RMHCPC)
 I ((RMTYNEW="R")!(RMTYNEW="X")),(RMCPTOLD'["RP"),($G(^RMPR(661.1,RMHCPC,4))["RP") D ADDRP
 I ((RMTYNEW="I")!(RMTYNEW="S")),(RMCPTOLD["RP"),($G(^RMPR(661.1,RMHCPC,4))["RP") D DELRP
 K RMCPTOLD,RMTYNEW,RMHCPC,RMF,RMCI,RMC,RMLPIECE,RMCLEN
 Q
DELRP ;logic for deleting 'RP' modifier with transaction change.
 F RMCI=1:1:8 S RMC=$P(RMCPTOLD,",",RMCI) I RMC="RP" S $P(RMCPTOLD,",",RMCI)="" D
 .S RMF=$F(RMCPTOLD,",,"),RMFPIECE=$E(RMCPTOLD,1,RMF-2)
 .S RMLPIECE=$E(RMCPTOLD,RMF,32),RMCPTOLD=RMFPIECE_RMLPIECE
 .S RMCLEN=$L(RMCPTOLD)
 .I $E(RMCPTOLD,1)="," S RMCPTOLD=$E(RMCPTOLD,2,RMCLEN)
 .I $E(RMCPTOLD,RMCLEN)="," S RMCPTOLD=$E(RMCPTOLD,1,RMCLEN-1)
 .S $P(^RMPR(664,DA(1),1,DA,4),U,2)=RMCPTOLD
 Q
 ;
ADDRP ;logic for adding 'RP' modifier with transaction change.
 S RMCPTOLD=RMCPTOLD_",RP"
 S $P(^RMPR(664,DA(1),1,DA,4),U,2)=RMCPTOLD
 Q
 ;END