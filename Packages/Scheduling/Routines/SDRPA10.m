SDRPA10 ;BP-OIFO/ESW - UTILITY ; 10/31/04 5:42pm
 ;;5.3;Scheduling;**376**;Aug 13, 1993
EN(ST) ;
 N SR,II,STR,SA,STE,GG,SS,SQS,ER,SB,SM,SQ
 F II=1:1 S STR=$P($T(@ST+II),";;",2) Q:+STR'=ST  D
 .S SA=$P(STR,";",2) Q:SA'="B"
 .S SB=$P(STR,";",3),SM=$P(STR,";",4) D
 ..F GG=1:1 S STE=$P($T(@ST+II+GG),";;",2) Q:+STE'=ST!($P(STE,";",2)="B")  D
 ...S ER=$P(STE,";",3) S SQS=$P(STE,";",4) F SS=1:1 S SQ=$P(SQS,",",SS) Q:SQ=""  ; D PR^SD376P(SB,SM,ER,SQ)
 ..;update batch acknowledgement
 ..S ER="" S SQ=$O(^SDWL(409.6,"AMSG",SM,"")) Q:SQ=""  ; D PR^SD376P(SB,SM,ER,SQ)
 Q
 ;SB - batch # ; SM - message # ; ER - error code ; SQ - message sequence
402 ;;
 ;;402;B;40210857923;40219758875
 ;;402;ER;200;1844,2139,2144,3441,4922,
 ;;402;B;40210857979;40219758931
 ;;402;ER;350;953,
 ;;402;B;40210857991;40219758943
 ;;402;ER;350;1768,
 ;;402;B;40210858009;40219758963
 ;;402;ER;350;2041,
436 ;;
 ;;436;B;43612717288;43617215164
 ;;436;ER;350;4168,
 ;;436;B;43612718897;43617216823
 ;;436;ER;400;2842,
437 ;;
 ;;437;B;4378705080;43712485531
 ;;437;ER;350;2756,
438 ;;
 ;;438;B;4389221661;43815419260
 ;;438;ER;200;4949,
 ;;438;B;4389221674;43815419273
 ;;438;ER;200;91,1229,
 ;;438;B;4389221676;43815419274
 ;;438;ER;200;948,1560,1615,
 ;;438;B;4389221682;43815419281
 ;;438;ER;200;988,2897,4536,4942,
 ;;438;B;4389221702;43815419301
 ;;438;ER;200;462,
 ;;438;B;4389221703;43815419302
 ;;438;ER;200;686,687,1289,2171,4213,4981,
 ;;438;B;4389221705;43815419305
 ;;438;ER;200;3157,
 ;;438;B;4389221706;43815419306
 ;;438;ER;200;4992,
 ;;438;B;4389221707;43815419307
 ;;438;ER;200;438,2474,2476,3218,4580,
 ;;438;B;4389221708;43815419308
 ;;438;ER;200;428,3378,4629,
 ;;438;B;4389221730;43815419329
 ;;438;ER;200;1641,4616,4711,
 ;;438;B;4389221735;43815419335
 ;;438;ER;200;2156,2708,
 ;;438;B;4389221736;43815419336
 ;;438;ER;200;1338,
 ;;438;B;4389221742;43815419339
 ;;438;ER;200;426,1814,3007,
 ;;438;B;4389221748;43815419349
 ;;438;ER;200;1005,1082,4511,4732,
 ;;438;B;4389221766;43815419355
 ;;438;ER;200;77,501,2789,3734,4790,
 ;;438;B;4389221770;43815419371
 ;;438;ER;200;4475,
 ;;438;B;4389221771;43815419372
 ;;438;ER;200;1616,4749,
 ;;438;B;4389221775;43815419381
 ;;438;ER;200;4867,
442 ;;
 ;;442;B;4428421492;44210088571
 ;;442;ER;200;858,2156,
 ;;442;B;4428421522;44210088601
 ;;442;ER;200;817,3201,
 ;;442;B;4428421547;44210088620
 ;;442;ER;200;4373,
 ;;442;B;4428421618;44210088697
 ;;442;ER;200;2127,
 ;;442;B;4428421643;44210088721
 ;;442;ER;200;210,
 ;;442;B;4428421682;44210088777
 ;;442;ER;200;654,
 ;;442;B;4428421706;44210088801
 ;;442;ER;200;115,1818,1962,2524,2793,2998,3015,3054,3298,3651,3894,3918,4318,4388,4556,4844,4889
 ;;442;B;4428421720;44210088815
 ;;442;ER;200;279,2567,2610,2698,3062,3410,3670,3826,3844,4378,
 ;;442;B;4428421834;44210088934
 ;;442;ER;200;47,296,1393,1459,1468,2258,3328,3343,4104,4162,4862,
 ;;442;B;4428421858;44210088958
 ;;442;ER;200;449,491,845,1371,1475,2121,2942,3311,3829,4142,4720,
 ;;442;B;4428421860;44210088960
 ;;442;ER;200;230,350,359,437,533,760,910,1199,1365,1399,1524,1590,1591,1644,2179,2202,2221,2438,2526
 ;;442;ER;200;2599,2777,2783,3161,3268,3407,3668,3689,3702,3719,3763,3788,3837,4013,4067,4325,4437,4829,4855,
 ;;442;B;4428421870;44210088966
 ;;442;ER;200;53,265,603,1556,1593,2222,3295,4190,4305,
 ;;442;B;4428421896;44210088996
 ;;442;ER;200;14,289,292,370,409,450,518,812,831,861,1043,1174,1391,1424,1472,1547,1634,2031,2096,2537,2887,2892,3079,3116,3143,3224,3256,3421,3533,3796,3850,4176,4284,4369,4401,4446,4562,4589,4717,4809,
 ;;442;B;4428421938;44210089034
 ;;442;ER;200;320,398,433,543,610,1423,1952,2007,2335,3200,3756,3772,4633,4699,
 ;;442;B;4428421974;44210089067
 ;;442;ER;200;233,360,985,1036,1242,1436,1630,1652,1731,1763,2066,2109,2181,2390,2419,2626,2850,2853,2877,2878,2882,3532,3564,3588,3643,3981,4109,4209,4475,4593,4679,4742,4748,4866,4867,4880,
 ;;442;B;4428422002;44210089103
 ;;442;ER;200;118,140,277,460,622,1415,1417,1444,1637,1986,1987,2266,2332,2356,2376,2377,2815,
459 ;;
 ;;459;B;4596864446;4599796156
 ;;459;ER;350;2333,
460 ;;
 ;;460;B;46010937546;46028948497
 ;;460;ER;350;2611,
 ;;460;B;46010937548;46028948499
 ;;460;ER;700;4060,
501 ;;
 ;;501;B;50122428626;50132956451
 ;;501;ER;350;1606,
 ;;501;B;50122430493;50132959797
 ;;501;ER;350;3703,
 ;;501;B;50122431559;50132961242
 ;;501;ER;350;200,
 ;;501;B;50122432583;50132962548
 ;;501;ER;350;731,
 ;;501;B;50122436969;50132968262
 ;;501;ER;350;2980,
 ;;501;B;50122437407;50132968754
 ;;501;ER;350;4828,
502 ;;
 ;;502;B;50214602922;50221153579
 ;;502;ER;350;1090,1710,2390,
 ;;502;B;50214607691;50221158166
 ;;502;ER;350;4182,
504 ;;
 ;;504;B;50420220750;50427829687
 ;;504;ER;350;3900,
 ;;504;B;50420616901;50428098750
 ;;504;ER;350;4036,
506 ;;
 ;;506;B;50639348097;50615666027
 ;;506;ER;350;3397,
508 ;;
 ;;508;B;50884117473;50882608095
 ;;508;ER;350;242,
509 ;;
 ;;509;B;50919307755;50922262566
 ;;509;ER;350;4721,
512 ;;
 ;;512;B;51222906369;51278176746
 ;;512;ER;200;936,
 ;;512;B;51222906997;51278177702
 ;;512;ER;200;648,
 ;;512;B;51222907307;51278177906
 ;;512;ER;200;4042,
 ;;512;B;51222922663;51278202692
 ;;512;ER;200;2115,
 ;;512;B;51222926995;51278209444
 ;;512;ER;200;3315,
 ;;512;B;51222931310;51278216568
 ;;512;ER;200;263,2488,
 ;;512;ER;350;4652,
 ;;512;B;51222932194;51278218171
 ;;512;ER;200;4452,
 ;;512;ER;350;439,
 ;;512;B;51222935398;51278224630
 ;;512;ER;350;2107,3932,
 ;;512;B;51222965309;51278276117
 ;;512;ER;350;3707,
 ;;512;ER;400;320,
 ;;512;B;51222966140;51278277440
 ;;512;ER;400;520,521,
515 ;;
 ;;515;B;51520625697;51525930296
 ;;515;ER;350;3195,
518 ;;
 ;;518;B;51814498699;51818440994
 ;;518;ER;700;4644,
 ;;518;B;51814498703;51818440998
 ;;518;ER;350;2322,
519 ;;
 ;;519;B;51910042024;51914931317
 ;;519;ER;700;201,
 ;;519;B;51910042034;51914931327
 ;;519;ER;350;1471,
520 ;;
 ;;520;B;52025224144;52045807380
 ;;520;ER;700;911,
 ;;520;B;52025267102;52045863837
 ;;520;ER;700;911,
 ;;520;B;52025267720;52045864913
 ;;520;ER;350;680,
521 ;;
 ;;521;B;52120966450;52129317600
 ;;521;ER;400;432,
 ;;521;B;52120976473;52129326054
 ;;521;ER;400;263,264,
 ;;521;B;52121000431;52129348123
 ;;521;ER;350;3284,
 ;;521;B;52121033791;52129371057
 ;;521;ER;400;406,
 ;;521;B;52121036445;52129372420
 ;;521;ER;400;454,
 ;;521;B;52121038181;52129373296
 ;;521;ER;400;400,
 ;;521;B;52121052324;52129380558
 ;;521;ER;400;166,
526 ;;
 ;;526;B;52691389;52655067
 ;;526;ER;400;563,
 ;;526;B;526103887;52665506
 ;;526;ER;350;925,
 ;;526;B;526143960;52695953
 ;;526;ER;400;388,
 ;;526;B;526407496;52613214901
 ;;526;ER;350;3700,
528 ;;
 ;;528;B;52815285504;52846320778
 ;;528;ER;350;4055,
 ;;528;B;52815299211;52846398475
 ;;528;ER;350;3305,
 ;;528;B;52815310259;52846460347
 ;;528;ER;350;2871,
 ;;528;B;52815327503;52846543629
 ;;528;ER;350;1402,
 ;;528;B;52815328650;52846552937
 ;;528;ER;400;1998,
 ;;528;B;52815329287;52846556720
 ;;528;ER;350;2490,
 ;;528;B;52815380770;52846791898
 ;;528;ER;400;2161,