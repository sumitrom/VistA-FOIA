PRSNTEG ;ISC/XTSUMBLD KERNEL - Package checksum checker ;2950922.134403
 ;;4.0;PAID;;Sep 21, 1995
 ;;7.3V5;2950922.134403
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 G CONT^PRSNTEG0
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
PRS8 ;;6758761
PRS8AC ;;10789248
PRS8CR ;;4113870
PRS8CV ;;1406679
PRS8DR ;;4460526
PRS8EX ;;12089950
PRS8EX0 ;;2492670
PRS8HD ;;4393103
PRS8HR ;;9990339
PRS8MISC ;;6209902
PRS8MSC0 ;;8738536
PRS8MT ;;9042216
PRS8OC ;;8121133
PRS8OT ;;1051438
PRS8PP ;;13713672
PRS8SB ;;482803
PRS8ST ;;7522882
PRS8SU ;;8182283
PRS8TL ;;6628863
PRS8TL1 ;;6852149
PRS8UP ;;7675745
PRS8UT ;;1468608
PRS8VW ;;4779393
PRS8VW1 ;;3705374
PRS8VW2 ;;3553313
PRS8WE ;;8439046
PRS8WE2 ;;5601041
PRSACED ;;5798337
PRSACED1 ;;2917348
PRSACED2 ;;4372931
PRSACED3 ;;4234486
PRSACED4 ;;3403608
PRSACED5 ;;3607550
PRSACED6 ;;2901261
PRSADP ;;2345979
PRSADP1 ;;5204495
PRSADP2 ;;6014980
PRSADPA ;;3624106
PRSAEDL ;;7630808
PRSAEDR ;;5393792
PRSAEDS ;;2055313
PRSAENE ;;2103036
PRSAENT ;;2112476
PRSAENX ;;2134106
PRSAES ;;1313964
PRSALVB ;;5555828
PRSALVE ;;4317661
PRSALVL ;;7809679
PRSALVR ;;6805104
PRSALVS ;;8301239
PRSALVT ;;1139882
PRSALVU ;;3185536
PRSALVX ;;2445423
PRSAOTE ;;2838414
PRSAOTL ;;5965024
PRSAOTR ;;4569152
PRSAOTS ;;2397841
PRSAOTX ;;8430525
PRSAPAS ;;1561258
PRSAPEH ;;3084131
PRSAPEM ;;1898877
PRSAPEX ;;4093665
PRSAPPH ;;8178546
PRSAPPO ;;5341440
PRSAPPP ;;7802049
PRSAPPQ ;;6163642
PRSAPPU ;;1034959
PRSAPPX ;;5760245
PRSAPRE ;;3848270
PRSAPRT ;;2080643
PRSAPT1 ;;785232
PRSARPT2 ;;4489402
PRSASAL ;;5977718
PRSASC ;;9773634
PRSASC1 ;;3903078
PRSASC2 ;;1597184
PRSASC3 ;;3976397
PRSASR ;;8476442
PRSASR1 ;;1564047
PRSASU ;;4232684
PRSATAPE ;;4476355
PRSATD1 ;;6413354
PRSATD2 ;;3514001
PRSATE ;;11133231
PRSATE0 ;;3871814
PRSATE1 ;;1042996
PRSATE2 ;;7030914
PRSATE3 ;;6879527
PRSATE4 ;;4019861
PRSATE5 ;;1697087
PRSATEV ;;559852
PRSATH ;;3534403
PRSATIM ;;2261484
PRSATL ;;4151505
PRSATP ;;9893987
PRSATP0 ;;4870470
PRSATP1 ;;4861807
PRSATP2 ;;1764109
PRSATPD ;;4458099
PRSATPE ;;6078405
PRSATPF ;;1328971
PRSATPG ;;3992646
PRSATPH ;;5179073
PRSATPL ;;7238092
PRSATPP ;;6337840
PRSATPX ;;4188232
PRSATVC ;;3847802
PRSAUD ;;2228567
PRSAUDP ;;6132208
PRSAUTL ;;1858285
PRSAXMIT ;;7910133
PRSAXSR ;;1292570
PRSD1150 ;;5462001
PRSD450 ;;1794780
PRSDADD ;;1711292
PRSDAH ;;1259007
PRSDAH1 ;;6177791
PRSDAH2 ;;6903178
PRSDAH3 ;;10079106
PRSDAH4 ;;11656084
PRSDCOMP ;;8014132
PRSDDL ;;2221704
PRSDENG ;;439261
PRSDERR ;;7331639
PRSDEU01 ;;7474017
PRSDEU02 ;;7761860
PRSDEU03 ;;10159747
PRSDEU04 ;;4194847
PRSDEU05 ;;9647707
PRSDEU06 ;;11958266
PRSDEU07 ;;10409876
PRSDEU08 ;;9968538
PRSDEU09 ;;8995407
PRSDEU10 ;;3441415
PRSDEU11 ;;3349578
PRSDEU12 ;;5190061
PRSDFIL ;;1756500
PRSDFOLL ;;13024192
PRSDLD01 ;;5003462
PRSDLD02 ;;5722580
PRSDLD03 ;;7945572
PRSDLD04 ;;5111272
PRSDLD05 ;;5648343
PRSDLD06 ;;7771776
PRSDLD07 ;;8073087
PRSDLD08 ;;6268486
PRSDLD09 ;;7861993
PRSDLD10 ;;6224051
PRSDLD11 ;;3828709
PRSDLD12 ;;2335634
PRSDLD13 ;;7758159
PRSDLD14 ;;6990396
PRSDLD15 ;;8313570
PRSDLD16 ;;7491864
PRSDLD17 ;;7017466
PRSDMISC ;;1576842
PRSDPR01 ;;7816417
PRSDPR02 ;;8202108
PRSDPR03 ;;9182855