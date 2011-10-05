NURAED3 ;HIRMFO/RM,MD,FT-HELP ROUTINE FOR NURSING DATA ;8/9/96  12:33
 ;;4.0;NURSING SERVICE;**32**;Apr 25, 1997
EN1 ; ENTRY TO GIVE XECUTABLE HELP FOR NAT. CERT FIELD OF 210 FILE
 Q:'$D(^NURSF(210,D0,12,0))!(DA=D0)
 D EN^DDIOL("CURRENT ENTRY IS : ")
 I $D(^NURSF(210,D0,12,DA,0)),$P(^(0),U)'="",$D(^NURSF(212.2,$P(^NURSF(210,D0,12,DA,0),U),0)) S Z=DA D A,EN^DDIOL("","","!!!")
 Q
A I $D(^NURSF(210,D0,12,Z,0)),$P(^(0),U)'="",$D(^NURSF(212.2,$P(^NURSF(210,D0,12,Z,0),U),0)) D EN^DDIOL(Z_"     "_$P(^(0),"^")_"     "_$P(^(0),"^",2)_"     "_$P(^(0),"^",3),"","!?3")
 Q
EN2 ; THIS ENTRY POINT IS UTILIZED BY ALL PRINT ROUTINES WITH SUB-TOTALS
 S (NTOT,NTCT)=0 I NRPT=3 D
 .S X=0 F  S X=$O(^TMP("NURA",$J,X)) Q:X'>0  S NTOT=NTOT+1 S Y=0 F  S Y=$O(^TMP("NURA",$J,X,Y)) Q:Y'>0  S NTCT=NTCT+1
 E  D
 .S (V,W,X,Y,Z)=""
 .F  S V=$O(^TMP("NURA",$J,V)) Q:V=""  F  S W=$O(^TMP("NURA",$J,V,W)) Q:W=""  F  S X=$O(^TMP("NURA",$J,V,W,X)) Q:X'>0  S NTOT=NTOT+1  F  S Y=$O(^TMP("NURA",$J,V,W,X,Y)) Q:Y'>0  F  S Z=$O(^TMP("NURA",$J,V,W,X,Y,Z)) Q:Z'>0  S NTCT=NTCT+1
 .Q
 Q
EN3 ; ENTRY FROM NURS-I-STAFF1 TEMPLATE
 ; THE NURSS, SAVEADD, SAVEADD2, SAVEADD3, SAVEZIP, SAVECITY, SAVESTAT
 ; VARIABLES ARE KILLED OFF IN THE NURS-I-STAFF1 TEMPLATE
 D GETNODE S NURSS=$S('$D(^VA(200,ID,.11)):0,1:1),SAVEADD=$S('NURSS:"",1:$P(^(.11),"^",1)),SAVEADD2=$S('NURSS:"",1:$P(^(.11),"^",2)),SAVEADD3=$S('NURSS:"",1:$P(^(.11),"^",3)),SAVEZIP=$S('NURSS:"",1:$P(^(.11),"^",6))
 S SAVECITY=$S('NURSS:"",1:$P(^VA(200,ID,.11),"^",4)),SAVESTAT=$S('NURSS:"",$P(^VA(200,ID,.11),"^",5)="":"",'$D(^DIC(5,$P(^VA(200,ID,.11),"^",5),0)):"",1:$P(^(0),"^",1))
 F NURSI=1:1:6 S NURSVAR=$S(NURSI=1:"SAVEADD",NURSI=2:"SAVEADD2",NURSI=3:"SAVEADD3",NURSI=4:"SAVECITY",NURSI=5:"SAVESTAT",1:"SAVEZIP") I @NURSVAR="" S $P(^NURSF(210,DA,15),"^",NURSI)=""
 K NURSVAR,NURSI,ID
 Q
EN4 ; VARIABLES N1,NFCNT,NMCNT,NTCT,NTOT ARE KILLED BY CALLING ROUTINE
 S (NX,NTOT)=0 F  S NX=$O(^TMP("NURA",$J,NX)) Q:NX=""  S NTOT=NTOT+1
 S (NMCNT,NMCNT(1),NFCNT,NFCNT(1),NTCT,NX)=0
 F  S NX=$O(^TMP("NURA",$J,NX)) Q:NX=""  S NY="" F  S NY=$O(^TMP("NURA",$J,NX,NY)) Q:NY=""  S:NY="M" NMCNT=NMCNT+1,NMCNT(1)=NMCNT(1)+1 S:NY="F" NFCNT=NFCNT+1,NFCNT(1)=NFCNT(1)+1 S NZ=0 F  S NZ=$O(^TMP("NURA",$J,NX,NY,NZ)) Q:NZ'>0  S NTCT=NTCT+1
 K NX,NY,NZ Q
GETNODE ; OBTAIN POINTER TO VA(200
 S ID=$P(^NURSF(210,+NURSDBA,0),"^")
 Q
EN5 ; POSITION EDIT AS IDENTIFIER FOR STAFF ENTRY
 S NUROUT=0,NURSASS(1)="",NURSPOS(1)="^^^"_NUR200_"^^^^^^^1"
STDT ; SELECT START DATE
 R !?3,"PRIMARY POSITION START DATE: ",X:DTIME I '$T!(X?1"^".E) S NUROUT=1 G Q5
 I X="" W !?3,$C(7),"Required!!" G STDT
 I X?1"?".E W $C(7),!?3,"Answer with the starting date for the primary position."
 S %DT="E" D ^%DT I +Y'>0 W:X'?1"?".E $C(7),"  ??" G STDT
 S $P(NURSPOS(1),"^",3)=+Y
LOCN ; SELECT LOCATION
 R !?3,"PRIMARY DUTY LOCATION: ",X:DTIME I '$T!(X?1"^".E) S NUROUT=1 G Q5
 I X="" W !?3,$C(7),"Required!!" G LOCN
 S DIC=211.4,DIC(0)="QMEZ" D ^DIC K DIC I +Y'>0 G LOCN
 S $P(NURSPOS(1),"^")=$P(Y,"^",2)
SPON ; SELECT SERVICE POSITION
 R !?3,"PRIMARY SERVICE POSITION: ",X:DTIME I '$T!(X?1"^".E) S NUROUT=1 G Q5
 I X="" W !?3,$C(7),"Required!!" G STDT
 S DIC=211.3,DIC(0)="QMEZ" D ^DIC K DIC I +Y'>0 G SPON
 S $P(NURSPOS(1),"^",2)=$P(Y(0),"^",5),$P(NURSPOS(1),"^",5)=+Y
Q5 ;
 I '$G(NUROUT) D EN2^NURAED6
 I $G(NUROUT) W !?3,$C(7),"No position data stored!!"
 K %DT,DIC,NUROUT,NURSASS,NURSPOS
 Q
EN6 ;XECUTABLE HELP FOR EXPERIENCE FIELD OF 210 FILE
 S NURSLO=$S($D(^NURSF(210,D0,20,+Y,0)):^(0),1:"") D DICW
 K NURSLO D EN^DDIOL($E(@(DIC_Y_",0)"),0),"","?0")
 Q
DICW ; EXECTUTED BY DIC("W") STRING IN PROFESSIONAL EXPERIENCE LOOKUP FROM
 ; PROFESSIONAL EXPERIENCE [NURAED-STF-EXP] OPTION.
 I $P(NURSLO,U)'="" D
 . S NURSLO(1)=$P(NURSLO,U),NURSLO(1,"F")="?5"
 . S NURSLO(2)=$P(NURSLO,U,4),NURSLO(2,"F")="?32"
 . Q
 I +$E($P(NURSLO,U,5),1,3)>0 D
 . S NURSLO(3)=$E($P(NURSLO,U,5),2,3),NURSLO(3,"F")="?63"
 . Q
 I +$E($P(NURSLO,U,6),1,3)>0 D
 . S NURSLO(4)=" to "_$E($P(NURSLO,U,6),2,3),NURSLO(4,"F")="?65"
 . Q
 S NURSLO(5)="",NURSLO(5,"F")="!"
 D:$G(NURSLO(1))'="" EN^DDIOL(.NURSLO)
 Q