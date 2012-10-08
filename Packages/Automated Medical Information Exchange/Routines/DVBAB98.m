DVBAB98 ;ALB/SPH - CAPRI CONVERSION OF DVBARAD1 FOR SUPPORT ; 3/22/12 8:33am
 ;;2.7;AMIE;**35,149,179**;Apr 10, 1995;Build 15
 ;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 S ZX="PENSION   ",ZY="A & A     "
 S MSG="" F ZZ=1:1:7 S MSG=MSG_ZX
 S MSG1="" F ZZ=1:1:7 S MSG1=MSG1_ZY
 U IO K DVBAQUIT
 F DVBAT="PEN","A&A" W:((IOST?1"C-".E)!(IOST'?1"P-OTHER".E)) @IOF W !!!!!!!!!! D PRINT Q:$D(DVBAQUIT)
 S ZMSG=$NA(^TMP("DVBAR",$J))
 G KILL
 ;
PRINTB S DATA1=$S($D(^TMP("DVBA",DVBAT,$J,SORTDT,XCN,XCFLOC,K,DA,"LADM")):^("LADM"),1:"") S (LADMDT,ADMDT)=$P(DATA1,U),LTDIS=$P(DATA1,U,2),DFN=DA,QUIT1=1 K DATA1 D ADM^DVBAVDPT K QUIT1,DVBAQ
 S LBEDSEC=BEDSEC,LDIAG=DIAG,LDCHGDT=DCHGDT,ADMDT=$P(DATA,U),RCVAA=$P(DATA,U,2),RCVPEN=$P(DATA,U,3),CNUM=$P(DATA,U,4),TDIS=$P(DATA,U,5) D ADM^DVBAVDPT
 S RCVPEN=$S(RCVPEN=0:"NO",RCVPEN=1:"YES",1:"Not specified"),RCVAA=$S(RCVAA=0:"NO",RCVAA=1:"YES",1:"Not specified")
 W @IOF,!!!,?(80-$L(HEAD)\2),HEAD,!,?(80-$L(HEAD1)\2),HEAD1,!,?(80-$L(HEADDT)\2),HEADDT,!!!
 S:ADMDT]"" ADMDT=$$FMTE^XLFDT(ADMDT,"5DZ")
 S:DCHGDT]"" DCHGDT=$$FMTE^XLFDT(DCHGDT,"5DZ")
 S:LADMDT]"" LADMDT=$$FMTE^XLFDT(LADMDT,"5DZ")
 S:LDCHGDT]"" LDCHGDT=$$FMTE^XLFDT(LDCHGDT,"5DZ")
 ;create delimited/non-delimited report
 D:($G(DVBADLMTR)'="") PRINTD
 D:($G(DVBADLMTR)="") PRINTND
 Q
 ;
PRINTND ;create non-delimited re-admission report
 S ^TMP("DVBAR",$J,DVBABCNT)="",DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Patient: "_PNAM_"  SSN: "_SSN_"  Claim Folder Loc: "_CFLOC,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Claim #: "_CNUM_"  Pension: "_RCVPEN_"  A&A: "_RCVAA,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="================================================================================",DVBABCNT=DVBABCNT+1
 D ELIG
 S ^TMP("DVBAR",$J,DVBABCNT)="Current Admission Data:",DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="-----------------------",DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Admission Date:      "_ADMDT,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Admitting Diagnosis: "_DIAG,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Discharge Date:      "_DCHGDT,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Discharge Type:      "_TDIS,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Bed Service:         "_BEDSEC,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="",DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Prior Admission Data:",DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="---------------------",DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Admission Date:      "_LADMDT,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Admitting Diagnosis: "_LDIAG,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Discharge Date:      "_LDCHGDT,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Discharge Type:      "_LTDIS,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="Bed Service:         "_LBEDSEC,DVBABCNT=DVBABCNT+1
 S ^TMP("DVBAR",$J,DVBABCNT)="",DVBABCNT=DVBABCNT+1
 ;I IOST?1"C-".E W *7,!,"Press RETURN to continue or ""^"" to stop    " R ANS:DTIME S:ANS=U!('$T) XCN="ZZZZ" I '$T S DVBAQUIT=1
 Q
 ;
PRINTD ;create delimited re-admission report
 D:('$D(^XTMP("DVBA_READMISSION_RPT"_$J,0))) COLHDR
 S ^TMP("DVBAR",$J,DVBABCNT)=PNAM_DVBADLMTR_SSN_DVBADLMTR_CFLOC_DVBADLMTR_CNUM_DVBADLMTR_RCVPEN_DVBADLMTR_RCVAA_DVBADLMTR
 D ELIG
 S ^TMP("DVBAR",$J,DVBABCNT)=^TMP("DVBAR",$J,DVBABCNT)_ADMDT_DVBADLMTR_DIAG_DVBADLMTR_DCHGDT_DVBADLMTR_TDIS_DVBADLMTR_BEDSEC_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=^TMP("DVBAR",$J,DVBABCNT)_LADMDT_DVBADLMTR_LDIAG_DVBADLMTR_LDCHGDT_DVBADLMTR_LTDIS_DVBADLMTR_LBEDSEC
 S DVBABCNT=DVBABCNT+1
 Q
 ;
PRINT S NODTA=1 S (SORTDT,XCN,XCFLOC,ANS)=""
 I $D(^TMP("DVBA",DVBAT,$J)) F XLINE=1:1:5 W ?5,$S(DVBAT="PEN":MSG,DVBAT="A&A":MSG1,1:""),!!
 F G=0:0 S SORTDT=$O(^TMP("DVBA",DVBAT,$J,SORTDT)) Q:SORTDT=""  F DVBAM=0:0 S XCN=$O(^TMP("DVBA",DVBAT,$J,SORTDT,XCN)) Q:XCN=""  D PRINT1
 Q
PRINT1 F J=0:0 S XCFLOC=$O(^TMP("DVBA",DVBAT,$J,SORTDT,XCN,XCFLOC)) Q:XCFLOC=""  F K=0:0 S K=$O(^TMP("DVBA",DVBAT,$J,SORTDT,XCN,XCFLOC,K)) Q:K=""  D PRINTC
 Q
PRINTC F DA=0:0 S DA=$O(^TMP("DVBA",DVBAT,$J,SORTDT,XCN,XCFLOC,K,DA)) Q:DA=""  S DATA=^(DA) D PRINTB
 Q
 ;
KILL K ^TMP("DVBA","A&A",$J),^TMP("DVBA","PEN",$J)
 K:(DVBAFNLDTE=$P(EDATE,".")) ^XTMP("DVBA_READMISSION_RPT"_$J,0)
 D ^%ZISC S X=7 D:$D(ZTQUEUED) KILL^%ZTLOAD G FINAL^DVBAUTIL
 ;
ELIG S ELIG=DVBAELIG,INCMP=0
 W "Eligibility: "
 I ELIG]"" S ELIG=ELIG_" ("_$S(DVBAELST="P":"Pend Ver",DVBAELST="R":"Pend Re-verif",DVBAELST="V":"Verified",1:"Not Verified")_")"
 I $D(^DPT(DA,.29)),$P(^(.29),U,1)]"" S INCMP=1 ;date ruled incomp, VA
 I $D(^DPT(DA,.29)),$P(^(.29),U,12)=1 S INCMP=1 ;ruled incomp field
 W ELIG_$S(ELIG]"":", ",1:"") W:$X>60 !?14 W $S(INCMP=1:"Incompetent",1:""),!
 Q
 ;
COLHDR ;Column header for delimited report
 S ^TMP("DVBAR",$J,DVBABCNT)="Patient"_DVBADLMTR_"SSN"_DVBADLMTR_"Claim Folder Loc"_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=(^TMP("DVBAR",$J,DVBABCNT))_"Claim #"_DVBADLMTR_"Pension"_DVBADLMTR_"A&A"_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=(^TMP("DVBAR",$J,DVBABCNT))_"Current Admission Date"_DVBADLMTR_"Current Admitting Diagnosis"_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=(^TMP("DVBAR",$J,DVBABCNT))_"Current Discharge Date"_DVBADLMTR_"Current Discharge Type"_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=(^TMP("DVBAR",$J,DVBABCNT))_"Current Bed Service"_DVBADLMTR_"Prior Admission Date"_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=(^TMP("DVBAR",$J,DVBABCNT))_"Prior Admitting Diagnosis"_DVBADLMTR_"Prior Discharge Date"_DVBADLMTR
 S ^TMP("DVBAR",$J,DVBABCNT)=(^TMP("DVBAR",$J,DVBABCNT))_"Prior Discharge Type"_DVBADLMTR_"Prior Bed Service"
 S DVBABCNT=DVBABCNT+1
 S ^XTMP("DVBA_READMISSION_RPT"_$J,0)=DT_U_DT
 Q