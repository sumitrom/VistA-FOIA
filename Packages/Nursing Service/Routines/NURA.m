NURA ;HIRMFO/RM/JH/MD-ROUTINE TO CHECK FOR VERSION NUMBER, AND RUN NURS. ADMIN. MENU ;8/16/95
 ;;4.0;NURSING SERVICE;;Apr 25, 1997
 ;THIS ROUTINE IS BEING ADDED TO CHECK VERSION NUMBER OF NURSING ADMINISTRATION MODULE
 ;BUT LATER WILL RUN A MENU TO DEMONSTRATE NURSING ADMINISTRATION
 Q:'$D(^DIC(213.9,1,"OFF"))  Q:$P(^DIC(213.9,1,"OFF"),"^",1)=1
 S NURAVER=$$VERSION^XPDUTL("NURA") W:NURAVER'="" !!,"Version ",NURAVER," of the Nursing Administration Module" K NURAVER
 Q