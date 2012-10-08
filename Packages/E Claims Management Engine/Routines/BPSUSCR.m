BPSUSCR ;BHAM ISC/FLS - ECME STRANDED SUBMISSIONS SCREEN MAIN ;03/07/08  10:44
 ;;1.0;E CLAIMS MGMT ENGINE;**1,7,10**;JUN 2004;Build 27
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 ;STRANDED SUBMISSIONS SCREEN
EN ; -- main entry point for BPS ECME USER SCREEN
 N BPTMPGL,DUOUT,DTOUT,BPQ
 S BPQ=$$MESSAGE^BPSUSCR1() I BPQ=1 Q
 D GETDTS^BPSUSCR1(.BPARR) Q:$D(DUOUT)!$D(DTOUT)
 D EN^VALM("BPS LSTMN ECME UNSTRAND")
 Q
 ;
HDR ; -- header code
 S BPBDT=$$FMTE^XLFDT($P(BPBDT,"."),"5Z")
 S BPEDT=$$FMTE^XLFDT($P(BPEDT,"."),"5Z")
 S VALMHDR(1)="Submissions Stranded from "_BPBDT_" through "_BPEDT
 S VALMHDR(2)="Sorted by Transaction Date"
 Q
 ;
INIT ; -- init variables and list array
 N BPLN,BPLM,BP59,BPSORT,BPDUZ7,BPRET,CONT
 W !,"Please wait..."
 K ^TMP("BPSUSCR-1",$J),^TMP("BPSUSCR-2",$J),^TMP("BPSUSCR",$J)
 S BPTMPGL="^TMP(""BPSUSCR"",$J)"
 S CONT=1,VALMCNT=0
 D COLLECT^BPSUSCR4(.BPARR)
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 K X
 Q
 ;
EXIT ; -- exit code
 K BPARR,BPEDT,BPBDT
 D CLEAN^VALM10
 Q