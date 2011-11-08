SDWLCU2 ;IOFO BAY PINES/DMR - EWL FILE 409.3 CLEANUP ;2/4/03
 ;;5.3;scheduling;**280**;AUG 13 1993
1 ;
 S (TEAM,TEAMN,INST,NAME,SDWLERR)=""
START ;
 F  S INST=$O(^TMP($J,"SDWLCU1",1,INST)) Q:INST<1  D  Q:SDWLERR=1
 .S TEAM="" F  S TEAM=$O(^TMP($J,"SDWLCU1",1,INST,TEAM)) Q:TEAM<1  D  Q:SDWLERR=1
 ..S TEAMN="" F  S TEAMN=$O(^TMP($J,"SDWLCU1",1,INST,TEAM,TEAMN)) Q:TEAMN=""  D  Q:SDWLERR=1
 ...S NAME=$$GET1^DIQ(4,INST_",",.01)
 ...W !!,"Please enter a national institution!"
 ...W !,"TEAM: "_TEAMN_"    "_"INSTITUTION: "_NAME
 ...S SDWLERR="" D EDIT Q:SDWLERR=1
 ...D UDWL
 Q
EDIT ;
 S DIC(0)="AEQMNZ",DIC=4,DIC("S")="I $P(^(0),U,11)=""N"",$$TF^XUAF4(+Y)",DIC("A")="Select Institution: " D ^DIC
 I X["^" S SDWLERR=1 Q
 I Y<1 W " Select a New National Institution or '^' to quit." G EDIT
CALL ;
 K SDTEAM S SDREC=+Y,SDWLIENS=TEAM_","
 S SDTEAM(404.51,SDWLIENS,.07)=SDREC
 D UPDATE^DIE("","SDTEAM","SDWLMSG")
 Q
UDWL ;
 S IEN=""
 F  S IEN=$O(^TMP($J,"SDWLCU1",1,INST,TEAM,TEAMN,IEN)) Q:IEN<1  D
 .S SDTEAM(409.3,IEN_",",2)=SDREC D UPDATE^DIE("","SDTEAM","SDWLMSG")
 .K ^TMP($J,"EWL",$J,IEN),^TMP($J,"SDWLCU1",1,INST,TEAM,TEAMN,IEN)
 S WLTC1=""
 Q
2 ;
 S (POS,POSNAM,INST,NAME,SDPOS,IEN,INST,SDWLERR)=""
 F  S INST=$O(^TMP($J,"SDWLCU1",2,INST)) Q:INST<1  D  Q:SDWLERR=1
 .S POS="" F  S POS=$O(^TMP($J,"SDWLCU1",2,INST,POS)) Q:POS<1  D  Q:SDWLERR=1
 ..S POSNAM="" F  S POSNAM=$O(^TMP($J,"SDWLCU1",2,INST,POS,POSNAM)) Q:POSNAM=""  D  Q:SDWLERR=1
 ...S NAME=$$GET1^DIQ(4,INST_",",.01)
 ...W !!,"Please enter a national institution!"
 ...W !,"POSITION: "_POSNAM_"     "_"INSTITUTION: "_NAME
 ...D EDIT2
 Q
EDIT2 ;
 S DIC(0)="AEQMNZ",DIC=4,DIC("S")="I $P(^(0),U,11)=""N"",$$TF^XUAF4(+Y)",DIC("A")="Select Institution: " D ^DIC
 I X["^" S SDWLERR=1 Q
 I Y<1 W " Select a New National Institution or '^' to quit." G EDIT2
CALL2 ;
 S TEAM=$$GET1^DIQ(404.57,POS_",",.02,"I")
 I TEAM>0 D CALL
 E  W !,"Team missing in file 404.51 for",POSNAM
 K SDPOS S SDREC=+Y,SDWLIENS=POS_","
 S IEN=""
 F  S IEN=$O(^TMP($J,"SDWLCU1",2,INST,POS,POSNAM,IEN)) Q:IEN<1  D
 .S SDPOS(409.3,IEN_",",2)=SDREC D UPDATE^DIE("","SDPOS","SDWLMSG")
 .K ^TMP($J,"EWL",$J,IEN),^TMP($J,"SDWLCU1",2,INST,POS,POSNAM,IEN)
 S WLTC2=""
 Q