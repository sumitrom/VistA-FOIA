GMTSXQ01 ; SLC/JER - XQOR for Export w/Health Summary ;1/10/92  14:53
 ;;2.5;Health Summary;;Dec 16, 1992
XQOR ; SLC/KCM - Unwind Options ;3/27/90  16:18 ;
 ;;6.52;Copyright 1990, DVA;
 S DIC=19,DIC(0)="AEMQ" D ^DIC K DIC Q:Y<0  S X=+Y_";DIC(19,"
EN ;Process options/protocols from top
 ;From: Anywhere  Entry: X,{DIC,XQORFLG}  Exit: none
 Q:$D(X)[0  K XQORPOP,XQORQUIT
 I '$D(XQORS) S XQORS=0 K ^UTILITY("XQORS",$J)
 S XQORS=XQORS+1 ;push
 I X?1.N1";ORD(101,"!(X?1.N1";DIC(19,") S ^UTILITY("XQORS",$J,XQORS,"REF")="^"_$P(X,";",2)_+X_",",^UTILITY("XQORS",$J,XQORS,"VPT")=X
 E  S:$D(DIC)[0 DIC=19 S DIC(0)="N" D ^DIC S:Y>0 ^UTILITY("XQORS",$J,XQORS,"REF")=DIC_+Y_",",^UTILITY("XQORS",$J,XQORS,"VPT")=+Y_";"_$P(DIC,"^",2) K DIC G:Y<0 EX
 S ORNEST(XQORS)=^UTILITY("XQORS",$J,XQORS,"VPT")
 G:'$D(@(^UTILITY("XQORS",$J,XQORS,"REF")_"0)")) EX S ^UTILITY("XQORS",$J,XQORS,"FLG")=$P(^(0),"^",4)_"^^" G:$P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^")'?1A EX
 I $L($P(@(^UTILITY("XQORS",$J,XQORS,"REF")_"0)"),"^",3)) W !!,$P(^(0),"^",3),! D READ^XQOR4 G EX
 D C19^XQOR4 G:Y<0 EX
 S ^UTILITY("XQORS",$J,0,"FILE")=";"_$P(^UTILITY("XQORS",$J,XQORS,"VPT"),";",2),^UTILITY("XQORS",$J,XQORS,"INP")=""
 I XQORS>1,$D(^UTILITY("XQORS",$J,XQORS-1,"ITM")),$D(^UTILITY("XQORS",$J,XQORS-1,"ITM",^UTILITY("XQORS",$J,XQORS-1,"ITM"),"IN")) S ^UTILITY("XQORS",$J,XQORS,"INP")=^UTILITY("XQORS",$J,XQORS-1,"ITM",^UTILITY("XQORS",$J,XQORS-1,"ITM"),"IN")
 S XQORNOD=^UTILITY("XQORS",$J,XQORS,"VPT"),XQORNOD(0)=^UTILITY("XQORS",$J,XQORS,"INP")
 I XQORS>1,$D(^UTILITY("XQORS",$J,XQORS-1,"FLG")) S X=^UTILITY("XQORS",$J,XQORS-1,"FLG"),$P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^",3)=$S($L($P(X,"^",5)):$P(X,"^",5),1:$P(X,"^",3))
 I ^UTILITY("XQORS",$J,0,"FILE")=";ORD(101,",$D(@(^UTILITY("XQORS",$J,XQORS,"REF")_"4)")) S:$P(^(4),"^",3)="Y" $P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^",2)=1
 I ^UTILITY("XQORS",$J,0,"FILE")=";DIC(19,",$P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^")="M" S $P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^",2)=1
 I $D(XQORFLG) S:$D(XQORFLG("PS")) $P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^",2)=+XQORFLG("PS") S:$D(XQORFLG("SH")) $P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^",3)=+XQORFLG("SH") K XQORFLG
 I $D(ORITMO) S $P(^UTILITY("XQORS",$J,XQORS,"FLG"),"^",6)=1 K ORITMO G REDO^XQOR1
 G LOOP^XQOR1
EX K ORNEST(XQORS),XQORFLG,XQORNOD S XQORS=XQORS-1 ;pop
 I XQORS=0 K ORNEST,XQORS,^UTILITY("XQORS",$J)
 Q
EN1 ;Process items on option/protocol only (i.e., skip initial actions)
 ;From: Anywhere  Entry: X,DIC  Exit: none
 S ORITMO=1 G EN
 Q
XQ ;From: Menuman  Entry: XQOR  Exit: XQOR
 S X=+XQOR_";DIC(19," I $D(^DD(19,0,"VR")),^("VR")<5.9 G EN
 G EN1