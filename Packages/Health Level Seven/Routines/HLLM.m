HLLM ; List Template Exporter ; 14-JUL-1995
 ;;1.6;HEALTH LEVEL SEVEN;;Oct 13, 1995
 W !,"'HL INTERFACE WORKBENCH - 1' List Template..."
 S DA=$O(^SD(409.61,"B","HL INTERFACE WORKBENCH - 1",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="HL INTERFACE WORKBENCH - 1" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="HL INTERFACE WORKBENCH - 1^1^^80^5^17^1^1^Tool^HL DT/IW MENU - SCREEN 1^HL-7 Interface Workbench^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""HL"",""IW-SCRN1"",$J)"
 .S ^SD(409.61,VALM,"FNL")="D CLEANUP^HLDTIW01"
 .S ^SD(409.61,VALM,"HDR")="D HEADER^HLDTIW01"
 .S ^SD(409.61,VALM,"HLP")=""
 .S ^SD(409.61,VALM,"INIT")="D DISPLAY^HLDTIW01"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'HL INTERFACE WORKBENCH - 2' List Template..."
 S DA=$O(^SD(409.61,"B","HL INTERFACE WORKBENCH - 2",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="HL INTERFACE WORKBENCH - 2" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="HL INTERFACE WORKBENCH - 2^1^^80^5^17^1^1^Tool^HL DT/IW MENU - SCREEN 2^HL-7 Interface Workbench^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""HL"",""IW-SCRN2"",$J)"
 .S ^SD(409.61,VALM,"FNL")="D CLEANUP^HLDTIW02"
 .S ^SD(409.61,VALM,"HDR")="D HEADER^HLDTIW02"
 .S ^SD(409.61,VALM,"INIT")="D DISPLAY^HLDTIW02"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'HL INTERFACE WORKBENCH - 3' List Template..."
 S DA=$O(^SD(409.61,"B","HL INTERFACE WORKBENCH - 3",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="HL INTERFACE WORKBENCH - 3" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="HL INTERFACE WORKBENCH - 3^1^^80^5^17^1^1^Tool^HL DT/IW MENU - SCREEN 3^HL-7 Interface Workbench^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""HL"",""IW-SCRN3"",$J)"
 .S ^SD(409.61,VALM,"FNL")="D CLEANUP^HLDTIW03"
 .S ^SD(409.61,VALM,"HDR")="D HEADER^HLDTIW03"
 .S ^SD(409.61,VALM,"INIT")="D DISPLAY^HLDTIW03"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'HL INTERFACE WORKBENCH - 4' List Template..."
 S DA=$O(^SD(409.61,"B","HL INTERFACE WORKBENCH - 4",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="HL INTERFACE WORKBENCH - 4" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="HL INTERFACE WORKBENCH - 4^1^^80^5^17^1^1^Tool^HL DT/IW MENU - SCREEN 4^HL-7 Interface Workbench^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""HL"",""IW-SCRN4"",$J)"
 .S ^SD(409.61,VALM,"FNL")="D CLEANUP^HLDTIW04"
 .S ^SD(409.61,VALM,"HDR")="D HEADER^HLDTIW04"
 .S ^SD(409.61,VALM,"INIT")="D DISPLAY^HLDTIW04"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'HL INTERFACE WORKBENCH - 5' List Template..."
 S DA=$O(^SD(409.61,"B","HL INTERFACE WORKBENCH - 5",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="HL INTERFACE WORKBENCH - 5" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="HL INTERFACE WORKBENCH - 5^1^^80^5^17^1^1^Tool^HL DT/IW MENU - SCREEN 5^HL-7 Interface Workbench^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""HL"",""IW-SCRN5"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^^0"
 .S ^SD(409.61,VALM,"FNL")="D CLEANUP^HLDTIW05"
 .S ^SD(409.61,VALM,"HDR")="D HEADER^HLDTIW05"
 .S ^SD(409.61,VALM,"INIT")="D DISPLAY^HLDTIW05"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'HL MESSAGE REQUEUER - 1' List Template..."
 S DA=$O(^SD(409.61,"B","HL MESSAGE REQUEUER - 1",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="HL MESSAGE REQUEUER - 1" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="HL MESSAGE REQUEUER - 1^2^^80^5^18^1^1^^^HL7 Message Requeuer^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""HL"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^5^5"
 .S ^SD(409.61,VALM,"COL",1,0)="NUMBER^3^5^Index"
 .S ^SD(409.61,VALM,"COL",2,0)="QUEUE^10^15^Queue Name"
 .S ^SD(409.61,VALM,"COL",3,0)="SIZE^30^10^Queue Size"
 .S ^SD(409.61,VALM,"COL",4,0)="SENT^50^10^Sent Msgs^^0"
 .S ^SD(409.61,VALM,"COL",5,0)="PENDING^65^10^Pending"
 .S ^SD(409.61,VALM,"COL","AIDENT",0,4)=""
 .S ^SD(409.61,VALM,"EXP")="D EXPND^HLCSREQ"
 .S ^SD(409.61,VALM,"FNL")="D EXIT^HLCSREQ"
 .S ^SD(409.61,VALM,"HDR")="D HDR^HLCSREQ"
 .S ^SD(409.61,VALM,"HLP")="D HELP^HLCSREQ"
 .S ^SD(409.61,VALM,"INIT")="D INIT^HLCSREQ"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 G ^HLLM1