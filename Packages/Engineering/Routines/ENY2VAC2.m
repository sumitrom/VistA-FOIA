ENY2VAC2 ;(WIRMFO)/DH-National Roll-up of Y2K Data ;8.30.98
 ;;7.0;ENGINEERING;**55**;August 17,1993
ROLLFC ;  add functional classification to national roll-up
 S STATION="" F  S STATION=$O(COUNT(STATION)) Q:STATION=""  D
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"ACT")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F1^"_COUNT_U
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"Y2K")
 . S ENC(KOUNT,0)=ENC(KOUNT,0)_COUNT_U_COUNT(STATION,"MED","Y2K")_U_COUNT(STATION,"PC","Y2K")_U_COUNT(STATION,"FS","Y2K")_U_COUNT(STATION,"TEL","Y2K")_U_COUNT(STATION,0,"Y2K")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"FC")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F2^"_COUNT_U_COUNT(STATION,"MED","FC")_U_COUNT(STATION,"PC","FC")_U_COUNT(STATION,"FS","FC")_U_COUNT(STATION,"TEL","FC")_U_COUNT(STATION,0,"FC")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"CC")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F3^"_COUNT_U_COUNT(STATION,"MED","CC")_U_COUNT(STATION,"PC","CC")_U_COUNT(STATION,"FS","CC")_U_COUNT(STATION,"TEL","CC")_U_COUNT(STATION,0,"CC")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"NC")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F4^"_COUNT_U_COUNT(STATION,"MED","NC")_U_COUNT(STATION,"PC","NC")_U_COUNT(STATION,"FS","NC")_U_COUNT(STATION,"TEL","NC")_U_COUNT(STATION,0,"NC")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"NA")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F5^"_COUNT_U_COUNT(STATION,"MED","NA")_U_COUNT(STATION,"PC","NA")_U_COUNT(STATION,"FS","NA")_U_COUNT(STATION,"TEL","NA")_U_COUNT(STATION,0,"NA")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,0)
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F6^"_COUNT_U_COUNT(STATION,"MED",0)_U_COUNT(STATION,"PC",0)_U_COUNT(STATION,"FS",0)_U_COUNT(STATION,"TEL",0)_U_COUNT(STATION,0,0)_"^|"
 . S KOUNT=KOUNT+1 I 'COUNT(STATION,0,"Y2K") S ENC(KOUNT,0)="F7^^^^^|"
 . E  D
 .. S ENC(KOUNT,0)="F7^"_COUNT(STATION,0,"Y2K")_U_COUNT(STATION,"TYPE","NX")_U_COUNT(STATION,"TYPE","BSE")_U_COUNT(STATION,"TYPE","EXP")_U_COUNT(STATION,"TYPE",0)_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"FC","UPG")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F8^"_COUNT_U_COUNT(STATION,"MED","FC","UPG")_U_COUNT(STATION,"PC","FC","UPG")_U_COUNT(STATION,"FS","FC","UPG")_U_COUNT(STATION,"TEL","FC","UPG")_U_COUNT(STATION,0,"FC","UPG")_"^|"
 . S TOTAL=0 F J=0,"MED","PC","FS","TEL" S TOTAL=TOTAL+TOTAL(STATION,J,"FC","ECST")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F9^"_TOTAL_U_TOTAL(STATION,"MED","FC","ECST")_U_TOTAL(STATION,"PC","FC","ECST")_U_TOTAL(STATION,"FS","FC","ECST")_U_TOTAL(STATION,"TEL","FC","ECST")_U_TOTAL(STATION,0,"FC","ECST")_"^|"
 . S TOTAL=0 F J=0,"MED","PC","FS","TEL" S TOTAL=TOTAL+TOTAL(STATION,J,"FC","ACST")
 . S TOTAL=$P(TOTAL+.5,".")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F10^"_TOTAL_U_$P(TOTAL(STATION,"MED","FC","ACST")+.5,".")_U_$P(TOTAL(STATION,"PC","FC","ACST")+.5,".")_U
 . S ENC(KOUNT,0)=ENC(KOUNT,0)_$P(TOTAL(STATION,"FS","FC","ACST")+.5,".")_U_$P(TOTAL(STATION,"TEL","FC","ACST")+.5,".")_U_$P(TOTAL(STATION,0,"FC","ACST")+.5,".")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"CC")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F11^"_COUNT_U_COUNT(STATION,"MED","CC")_U_COUNT(STATION,"PC","CC")_U_COUNT(STATION,"FS","CC")_U_COUNT(STATION,"TEL","CC")_U_COUNT(STATION,0,"CC")_"^|"
 . S TOTAL=0 F J=0,"MED","PC","FS","TEL" S TOTAL=TOTAL+TOTAL(STATION,J,"CC","ECST")
 . S TOTAL=$P(TOTAL+.5,".")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F12^"_TOTAL_U_$P(TOTAL(STATION,"MED","CC","ECST")+.5,".")_U_$P(TOTAL(STATION,"PC","CC","ECST")+.5,".")_U_$P(TOTAL(STATION,"FS","CC","ECST")+.5,".")_U
 . S ENC(KOUNT,0)=ENC(KOUNT,0)_$P(TOTAL(STATION,"TEL","CC","ECST")+.5,".")_U_$P(TOTAL(STATION,0,"CC","ECST")+.5,".")_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"NC","ATD")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F13^"_COUNT_U_COUNT(STATION,"MED","NC","ATD")_U_COUNT(STATION,"PC","NC","ATD")_U_COUNT(STATION,"FS","NC","ATD")_U_COUNT(STATION,"TEL","NC","ATD")_U_COUNT(STATION,0,"NC","ATD")_"^|"
 . S TOTAL=0 F J=0,"MED","PC","FS","TEL" S TOTAL=TOTAL+TOTAL(STATION,J,"NC","ETD")
 . S TOTAL=$P(TOTAL+.5,".")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F14^"_TOTAL_U_$P(TOTAL(STATION,"MED","NC","ETD")+.5,".")_U_$P(TOTAL(STATION,"PC","NC","ETD")+.5,".")_U_$P(TOTAL(STATION,"FS","NC","ETD")+.5,".")_U
 . S ENC(KOUNT,0)=ENC(KOUNT,0)_$P(TOTAL(STATION,"TEL","NC","ETD")+.5,".")_U_$P(TOTAL(STATION,0,"NC","ETD")+.5,".")_"^|"
 . S TOTAL=0 F J=0,"MED","PC","FS","TEL" S TOTAL=TOTAL+TOTAL(STATION,J,"NC","ATD")
 . S TOTAL=$P(TOTAL+.5,".")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F15^"_TOTAL_U_$P(TOTAL(STATION,"MED","NC","ATD")+.5,".")_U_$P(TOTAL(STATION,"PC","NC","ATD")+.5,".")_U_$P(TOTAL(STATION,"FS","NC","ATD")+.5,".")_U
 . S ENC(KOUNT,0)=ENC(KOUNT,0)_$P(TOTAL(STATION,"TEL","NC","ATD")+.5,".")_U_$P(TOTAL(STATION,0,"NC","ATD")+.5,".")_"^|"
 . F J=0,"MED","PC","FS","TEL" S X(J)=COUNT(STATION,J,"NC","REP")-COUNT(STATION,J,"NC","ATD"),X1(J)=TOTAL(STATION,J,"NC","ETOT")-TOTAL(STATION,J,"NC","ETD")
 . F J=0,"MED","PC","FS","TEL" S X1(J)=$P(X1(J)+.5,".")
 . S COUNT=0 F J=0,"MED","PC","TEL","FS" S COUNT=COUNT+X(J)
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F16^"_COUNT_U_X("MED")_U_X("PC")_U_X("FS")_U_X("TEL")_U_X(0)_"^|"
 . S TOTAL=0 F J=0,"MED","PC","FS","TEL" S TOTAL=TOTAL+X1(J)
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F17^"_TOTAL_U_X1("MED")_U_X1("PC")_U_X1("FS")_U_X1("TEL")_U_X1(0)_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"NC","RETACT")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F18^"_COUNT_U_COUNT(STATION,"MED","NC","RETACT")_U_COUNT(STATION,"PC","NC","RETACT")_U_COUNT(STATION,"FS","NC","RETACT")_U_COUNT(STATION,"TEL","NC","RETACT")_U_COUNT(STATION,0,"NC","RETACT")_"^|"
 . F J=0,"MED","PC","FS","TEL" S X(J)=COUNT(STATION,J,"NC","RET")-COUNT(STATION,J,"NC","RETACT")
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+X(J)
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F19^"_COUNT_U_X("MED")_U_X("PC")_U_X("FS")_U_X("TEL")_U_X(0)_"^|"
 . S COUNT=0 F J=0,"MED","PC","FS","TEL" S COUNT=COUNT+COUNT(STATION,J,"NC","USE")
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="F20^"_COUNT_U_COUNT(STATION,"MED","NC","USE")_U_COUNT(STATION,"PC","NC","USE")_U_COUNT(STATION,"FS","NC","USE")_U_COUNT(STATION,"TEL","NC","USE")_U_COUNT(STATION,0,"NC","USE")_"^|"
 Q
 ;
ROLLUTL ;  add utility systems summary to national roll-up
 S STATION="" F  S STATION=$O(COUNT(STATION)) Q:STATION=""  D
 . S COUNT(STATION,"SYS","TOT")=0,COUNT(STATION,"SYS","FC")=0,COUNT(STATION,"SYS","NC")=0 F J=0,"ALARM","COMM","ELECT","ENVRN","FIRE","OTHER","SCRTY","TRANS","WATER" D
 .. S COUNT(STATION,"SYS","TOT")=COUNT(STATION,"SYS","TOT")+COUNT(STATION,"SYS",J,"TOT"),COUNT(STATION,"SYS","FC")=COUNT(STATION,"SYS","FC")+COUNT(STATION,"SYS",J,"FC")
 .. S COUNT(STATION,"SYS","NC")=COUNT(STATION,"SYS","NC")+COUNT(STATION,"SYS",J,"NC")
 . S COUNT(STATION,"COMP","TOT")=0,COUNT(STATION,"COMP","FC")=0,COUNT(STATION,"COMP","NC")=0,COUNT(STATION,"COMP","CC")=0,TOTAL(STATION,"ECST")=0
 . F J=0,"ALARM","COMM","ELECT","ENVRN","FIRE","OTHER","SCRTY","TRANS","WATER" D
 .. S COUNT(STATION,"COMP","TOT")=COUNT(STATION,"COMP","TOT")+COUNT(STATION,"COMP",J,"TOT"),COUNT(STATION,"COMP","FC")=COUNT(STATION,"COMP","FC")+COUNT(STATION,"COMP",J,"FC")
 .. S COUNT(STATION,"COMP","NC")=COUNT(STATION,"COMP","NC")+COUNT(STATION,"COMP",J,"NC"),COUNT(STATION,"COMP","CC")=COUNT(STATION,"COMP","CC")+COUNT(STATION,"COMP",J,"CC"),TOTAL(STATION,"ECST")=TOTAL(STATION,"ECST")+TOTAL(STATION,"ECST",J)
 . F J="TOT","FC","NC" S KOUNT=KOUNT+1,ENC(KOUNT,0)="US^"_J_U_COUNT(STATION,"SYS",J) D
 .. F K=0,"ALARM","COMM","ELECT","ENVRN","FIRE","OTHER","SCRTY","TRANS","WATER" S ENC(KOUNT,0)=ENC(KOUNT,0)_U_COUNT(STATION,"SYS",K,J)
 .. S ENC(KOUNT,0)=ENC(KOUNT,0)_"^|"
 . F J="TOT","FC","NC","CC" S KOUNT=KOUNT+1,ENC(KOUNT,0)="UC^"_J_U_COUNT(STATION,"COMP",J) D
 .. F K=0,"ALARM","COMM","ELECT","ENVRN","FIRE","OTHER","SCRTY","TRANS","WATER" S ENC(KOUNT,0)=ENC(KOUNT,0)_U_COUNT(STATION,"COMP",K,J)
 .. S ENC(KOUNT,0)=ENC(KOUNT,0)_"^|"
 . S KOUNT=KOUNT+1,ENC(KOUNT,0)="UC1^COST^"_TOTAL(STATION,"ECST") F J=0,"ALARM","COMM","ELECT","ENVRN","FIRE","OTHER","SCRTY","TRANS","WATER" S ENC(KOUNT,0)=ENC(KOUNT,0)_U_TOTAL(STATION,"ECST",J)
 . S ENC(KOUNT,0)=ENC(KOUNT,0)_"^|"
 Q
 ;ENY2VAC2