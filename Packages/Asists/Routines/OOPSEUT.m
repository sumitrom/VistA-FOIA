OOPSEUT ;WIOFO/CVW-EDIT UNION INFO ;03/12/01
 ;;2.0;ASISTS;;Jun 03, 2002
EN1(CALLER) ;Entry for Edit Union Information
 I CALLER'="W" G EXIT
 N DIC,Y
ENTLOOP ;
 N DLAYGO
 S DLAYGO=2263.7,DIC="^OOPS(2263.7,",DIC(0)="AELMQZ" D ^DIC G:Y=-1 EXIT
 S IEN=+Y
 G:'IEN EXIT
EDIT ;EDIT STUB 
 S DA=IEN,DR="",DIE=2263.7
 S DR(1,2263.7,1)=".01  UNION NAME................."
 S DR(1,2263.7,5)="1  UNION ACRONYM.............."
 S DR(1,2263.7,10)="2  UNION REPRESENTATIVE......."
 D ^DIE
 G ENTLOOP
EXIT ;EXIT AND CLEAN
 K DA,DR,DIE,IEN
 Q