PSSPOID3 ;BIR/RTR/WRT-Edit Orderable Item from matching option ;02/04/00
 ;;1.0;PHARMACY DATA MANAGEMENT;**38,47**;9/30/97
 N DA,PSBEFORE,PSAFTER,PSINORDE,PSSDTENT,PSCREATE,PSAFTER,PSSDACTI,PSSSACTI,PSSAACTI,PSSDACT,PSSSACT,PSSAACT
 S PSSDTENT=0 W ! K DIE N MFLG S PSBEFORE=$P(^PS(50.7,PSSOOIEN,0),"^",4),PSAFTER=0,PSINORDE="" D
 .W !,"This Orderable Item is "_$S($P($G(^PS(50.7,PSSOOIEN,0)),"^",12):"Non-Formulary.",1:"Formulary."),!
 .S DIE="^PS(50.7,",DA=PSSOOIEN,DR=6 S PSCREATE=1 D ^DIE K DIE,PSCREATE I $D(DTOUT)!($D(Y)) Q
 .K DIR S DIR(0)="DO",DIR("A")="INACTIVE DATE" D  D ^DIR K DIR I $G(Y)["^"!($D(DTOUT))!($G(DUOUT)) Q
 ..I $G(PSBEFORE) S Y=PSBEFORE D DD^%DT S DIR("B")=$G(Y)
 .I $G(PSBEFORE),'$G(Y) W ?40,"Inactive Date deleted!"
 .S PSSDTENT=$G(Y) I $G(Y) D DD^%DT W ?40,$G(Y)
 .S PSSOTH=$S($P($G(^PS(59.7,1,40.2)),"^"):1,1:0)
 .S DIE="^PS(50.7,",DA=PSSOOIEN,DR=".05;.06;.07;.08;7;S:'$G(PSSOTH) Y=""@1"";7.1;@1"
 .S PSCREATE=1 D ^DIE K DIE,PSCREATE,PSSOTH
 .S $P(^PS(50.7,PSSOOIEN,0),"^",4)=PSSDTENT,PSAFTER=PSSDTENT
 S:PSBEFORE&('$P(^PS(50.7,PSSOOIEN,0),"^",4)) PSINORDE="D" S:$P(^PS(50.7,PSSOOIEN,0),"^",4) PSINORDE="I"
 I PSINORDE'="" D CHECK^PSSPOID2(PSSOOIEN) D
 .I PSINORDE="D" D  Q
 ..I $O(PSSDACTI(0))!($O(PSSSACTI(0)))!($O(PSSAACTI(0))) D
 ...W !!,"There are inactive "_$S($O(PSSDACTI(0)):"drugs, ",1:"")_$S($O(PSSAACTI(0)):"additives, ",1:"")_$S($O(PSSSACTI(0)):"solutions,",1:""),!,"matched to this Pharmacy Orderable Item."
 .I $O(PSSDACT(0))!($O(PSSSACT(0)))!($O(PSSAACT(0))) D
 ..W !!,"There are active "_$S($O(PSSDACT(0)):"drugs, ",1:"")_$S($O(PSSAACT(0)):"additives, ",1:"")_$S($O(PSSSACT(0)):"solutions,",1:""),!,"matched to this Pharmacy Orderable Item."
 I $G(PSINORDE)="D" I $O(PSSDACTI(0))!($O(PSSSACTI(0)))!($O(PSSAACTI(0))) D REST^PSSPOIDT(PSSOOIEN)
 I $G(PSINORDE)="I" I $O(PSSDACT(0))!($O(PSSSACT(0)))!($O(PSSAACT(0))) D REST^PSSPOIDT(PSSOOIEN)
 S DIK="^PS(50.7,",DA=PSSOOIEN,DIK(1)=.04 D EN^DIK K DIK
 K PSBEFORE,PSAFTER,PSINORDE,PSSDTENT,PSSDACT,PSSDACTI,PSSSACT,PSSSACTI,PSSAACT,PSSAACTI
 Q