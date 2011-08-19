WVFACE ;HCIOFO/JR,FT IHS/ANMC/MWR - PRINT A FACE SHEET (FROM REG.); ;8/10/98  15:40
 ;;1.0;WOMEN'S HEALTH;;Sep 30, 1998
 ;;* MICHAEL REMILLARD, DDS * ALASKA NATIVE MEDICAL CENTER *
 ;;  DISPLAY/PRINT A FACE SHEET.
 ;
 D SETVARS^WVUTL5 S WVPOP1=0
 F  D RUN Q:WVPOP1
 D EXIT
 Q
 ;
RUN ;EP
 D TITLE^WVUTL5("DISPLAY/PRINT A PATIENT FACE SHEET")
 D PATIENT I Y<0 S WVPOP1=1 Q
 ;
RUN1 ;EP
 ;---> PATIENT ALREADY SELECTED.
 D DEVICE Q:WVPOP
 D FACE
 Q
 ;
EXIT ;EP
 D KILLALL^WVUTL8
 Q
 ;
 ;
PATIENT ;EP
 ;---> SELECT PATIENT (RETURN WVDFN).
 W !!,"   Select the patient whose Face Sheet you wish to display."
 D PATLKUP^WVUTL8(.Y)
 Q:Y<0  S WVDFN=+Y
 Q
 ;
 ;
DEVICE ;EP
 ;---> GET DEVICE AND POSSIBLY QUEUE TO TASKMAN.
 S ZTRTN="DEQUEUE^WVFACE",ZTSAVE("WVDFN")=""
 D ZIS^WVUTL2(.WVPOP,1)
 Q
 ;
 ;
FACE ;EP
 ;---> DISPLAY CODE FOR FACE SHEET.
 U IO
 S WVCRT=$S($E(IOST)="C":1,1:0)
 I WVCRT N IOF S IOF="!"
 D
 .I '$D(WVDFN) W !?5,"A Patient has not been selected.",! Q
 .S DFN=WVDFN
 .;
 .;---> VA/STATE SITES MAY SUBSTITUTE AN ALTERNATE CALL BELOW.
 .;D ^VA_ROUTINE SUCH AS EN^DGRPD, AND QUIT.
 .;EXAMPLE: D EN^DGRPD Q
 .D EN^DGRPD Q
 .Q
 I WVCRT&('$D(IO("S"))) D:'$G(DGRPOUT) DIRZ^WVUTL3 W @IOF
 D ^%ZISC
 Q
 ;
FOLLUP(WVDFN) ;EP
 ;---> CALLED BY PROCEDURE FOLLOW-UP MENU (WVPROC1).
 D SETVARS^WVUTL5
 D RUN1
 Q
 ;
DEQUEUE ;EP
 ;---> EP FOR TASKMAN QUEUE OF PRINTOUT.
 D SETVARS^WVUTL5,FACE^WVFACE,EXIT
 Q