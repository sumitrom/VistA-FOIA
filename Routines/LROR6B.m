LROR6B ;SLC/DCM/RWA - EDIT UNRELEASED LAB ORDERS FOR OE/RR CONT;9/11/89  16:55 ;
 ;;5.2;LAB SERVICE;**24,100,128**;Sep 27, 1994
SET K ^XUTL("OR",$J,"LROT",LROOST,LROXZ,LROSAMP,LROSPEC,LROCNT)
 I '$D(^XUTL("OR",$J,"LROT",LROST,LRZX(1))) S ZTQUEUED=1 D ORDER^LROW2 K ZTQUEUED S ^XUTL("OR",$J,"LROT",LROST,LRZX(1))=LRORD
 S LRORD=^XUTL("OR",$J,"LROT",LROST,LRZX(1))
 S ^XUTL("OR",$J,"LROT",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT,1)=LRURG,^XUTL("OR",$J,"LROT",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT,0)=ORIFN,^XUTL("OR",$J,"LROT",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT)=LRTST
 S ORIT=LRTST_";LAB(60,",ORETURN("ORPK")=LRTST_"^"_LROST_"^"_LRSAMP_"^"_LRSPEC_"^"_LRZX(1)_"^"_LRURG_"^"_LRORD_"^"_LROCNT,ORETURN("ORSTRT")=LROST
 S X=$S($D(LRSAMP):$S($D(^LAB(62,+LRSAMP,0)):$P(^(0),"^"),1:""),1:""),Y=$S($D(LRSPEC):$S($D(^LAB(61,+LRSPEC,0)):$P(^(0),"^"),1:""),1:"")
 S ORTX(1)=LRTSTNM_$S(Y'[X!(X=Y):" "_X,1:"")_$S(X'[Y:" "_Y,1:"")
 S ORTX(1)=ORTX(1)_"    "_$S($D(LRZX(1)):LRZX(1),1:"")_$S(LRURG=9!('LRURG):"",1:"   "_$P(^LAB(62.05,LRURG,0),"^"))
 S ORETURN("ORTX",1)=ORTX(1)
 I $D(^XUTL("OR",$J,"COM",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT)) S CNT=2,I=0 F  S I=$O(^XUTL("OR",$J,"COM",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT,I)) Q:I<1  D
 .I ^XUTL("OR",$J,"COM",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT,I)'["~For" S ORETURN("ORTX",CNT)=^XUTL("OR",$J,"COM",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT,I),CNT=CNT+1
 K ORTX
 Q