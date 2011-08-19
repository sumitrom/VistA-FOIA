ONCOSC1 ;WASH ISC/SRR-CROSS TAB REPORT TASKS ;12/14/99
 ;;2.11;ONCOLOGY;**25**;Mar 07, 1995
 ;
TOT ;Task for Total Registry Cross Tabs
 ;in: ONCOS*
 K ER S ONCOEX=0 D SETV,TEM G EX:$D(ER) S ONCOS("T")=$S(TEM="ALL":TEM,1:XDG_U_TEM) I ONCOS("C")'="ALL" D PRINT^ONCOSCT G EX
 S ONCOS("TK")="" F CT=1:1:$S(ONCOS("GP")=1:15,1:12) Q:ONCOEX  S ONCOS("C")=$P($P(ONCOS("CT"),";",CT),":",2) D PRINT^ONCOSCT
 G EX
 ;
SETV ;RESET VARIABLES
 S (ONCOS("N"),ONCOS("Y"))="",ONCOS("FI")="165.5^ONCOLOGY PRIMARY^ONCO(165.5,"
 Q
 ;
TEM ;Setup templates
 S YR=ONCOS("YR"),GP=ONCOS("GP"),BYR=+ONCOS("YR"),EYR=$P(ONCOS("YR"),U,2) G ALL:YR="ALL",ANN:BYR=EYR,RGE
 Q
 ;
ALL S TEM="ONCOS TOTAL-",TEM=$S(GP=0:TEM_"NON",GP=1:TEM_"ANAL",1:"ALL")
 Q:TEM="ALL"  S XDG=$O(^DIBT("F165.5",TEM,0)) Q:XDG=""  K ^DIBT(XDG,1)
 I GP<2 S XD0=0 F  S XD0=$O(^ONCO(165.5,"AG",GP,XD0)) Q:XD0=""  I $$DIV^ONCFUNC(XD0)=DUZ(2) S ^DIBT(XDG,1,XD0)=""
 I GP=2 F GP=0,2 S XD0=0 D
 .F  S XD0=$O(^ONCO(165.5,"AG",GP,XD0)) Q:XD0=""  I $$DIV^ONCFUNC(XD0)=DUZ(2) S ^DIBT(XDG,1,XD0)=""
 Q
 ;
ANN S TEM="ONCOS ANNUAL-",TEM=TEM_$S(GP=1:"ANALYTIC",GP=0:"NON ANAL",1:"ALLCASES")
 S XDG=$O(^DIBT("F165.5",TEM,0)) Q:XDG=""  K ^DIBT(XDG,1)
 S XD0=0 F  S XD0=$O(^ONCO(165.5,"AY",+YR,XD0)) Q:XD0=""  I $$DIV^ONCFUNC(XD0)=DUZ(2) D
 .I GP=2 S ^DIBT(XDG,1,XD0)="" Q
 .I $P(^ONCO(165.5,XD0,0),U,20)=GP S ^DIBT(XDG,1,XD0)=""
 Q
 ;
RGE S TEM="ONCOS RANGE-",TEM=$S(GP=1:TEM_"ANALYTIC",GP=0:TEM_"NON ANAL",1:TEM_"ALLCASES")
 S XDG=$O(^DIBT("F165.5",TEM,0)) Q:XDG=""  K ^DIBT(XDG,1)
 S XD0=0 F YY=BYR:1:EYR D
 .F  S XD0=$O(^ONCO(165.5,"AY",YY,XD0)) Q:XD0=""  I $$DIV^ONCFUNC(XD0)=DUZ(2) D
 ..I GP=2 S ^DIBT(XDG,1,XD0)="" Q
 ..I $P(^ONCO(165.5,XD0,0),U,20)=GP S ^DIBT(XDG,1,XD0)=""
 Q
ERR ;NO TEMPLATE
 S XD0=0 F  S XD0=$O(^ONCO(165.5,"AG",0,XD0)) Q:XD0=""
EX ;EXIT
 D KIL^ONCOSCT K CT,J,K,%DT,%ZISOS,BYR,EYR,GLO,OT,ROWDEF,TF,W,YR,B,C,CO,DIC,ER,F,GP,ONCOEX
 K I,HEAD,%T,%I,XCOL
 Q