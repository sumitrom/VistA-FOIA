PSAFIX ;BHM/DB - FIX INACTIVE DRUGS IN 58.8;10/3/97
 ;;3.0; DRUG ACCOUNTABILITY/INVENTORY INTERFACE;**3**; 10/24/97
 D NOW^%DTC W @IOF K PSALOC,PSACNT
 W !!,"Correcting erroneous Drug entries in file 58.8.",!
BGN ;begin the loop
 S PSALOC=$S('$D(PSALOC):$O(^PSD(58.8,0)),1:$O(^PSD(58.8,PSALOC))) G DONE:PSALOC'>0
 ;
 K DRUG
DRUG S DRUG=$S('$D(DRUG):$O(^PSD(58.8,PSALOC,1,0)),1:$O(^PSD(58.8,PSALOC,1,DRUG))) G BGN:DRUG'>0 G DRUG:'$D(^PSD(58.8,PSALOC,1,DRUG,0)) S DATA=^PSD(58.8,PSALOC,1,DRUG,0) I $P(DATA,"^",1)'="" G DRUG
 S $P(^PSD(58.8,PSALOC,1,DRUG,0),"^",1)=DRUG,^PSD(58.8,PSALOC,1,"B",DRUG,DRUG)="",PSACNT=$G(PSACNT)+1
 G DRUG
DONE W !!,"Patch PSA*3*3 has finished, and corrected ",$G(PSACNT)," bad entries.",!
Q Q