
--1a)
--insert into patient
insert into patient values (134563,'Jewelle','Shinner','0674 Washington Center',to_date('05/02/1999','dd-mm-yyyy'),'1545200888');
insert into patient values (171183,'Johnath','Vuittet','92705 Elka Way',to_date('13/07/1955','dd-mm-yyyy'),'1543120941');
insert into patient values (174776,'Shamus','Ashcroft','429 Northfield Park',to_date('29/04/1958','dd-mm-yyyy'),'1412501531');
insert into patient values (169576,'Catarina','Reast','72 Magdeline Parkway',to_date('09/12/1969','dd-mm-yyyy'),'1420755698');
insert into patient values (192635,'Sharla','Kirkby','6 6th Road Caulfield',to_date('18/11/1975','dd-mm-yyyy'),'1821956236');
insert into patient values (158989,'Loralee','Coope','516 Crest Line Point',to_date('07/01/1996','dd-mm-yyyy'),'1516375366');
insert into patient values (105264,'Germain','Currum','5 Debs Trail',to_date('15/06/2012','dd-mm-yyyy'),'1688457055');
insert into patient values (197151,'Anthia','Sturney','861 Birchwood Hill',to_date('02/06/1960','dd-mm-yyyy'),'1626841772');
insert into patient values (167850,'Urson','Deeprose','400 Debra Avenue',to_date('19/08/1956','dd-mm-yyyy'),'1958801571');
insert into patient values (128063,'Ed','McNevin','0 Forest Junction',to_date('22/05/1979','dd-mm-yyyy'),'1331779778');
insert into patient values (167488,'Brynn','Caesar','2 Northland Way',to_date('31/05/1988','dd-mm-yyyy'),'1562845837');
--insert into admission
insert into admission values (124287,to_date('05/02/2019 4:23 pm','dd-mm-yyyy hh:mi pm'),to_date('23/02/2019 4:13 pm','dd-mm-yyyy hh:mi pm'),134563,1005);
insert into admission values (155963,to_date('25/04/2019 4:34 pm','dd-mm-yyyy hh:mi pm'),to_date('02/05/2019 4:13 am','dd-mm-yyyy hh:mi pm'),171183,1005);
insert into admission values (151965,to_date('18/02/2019 2:34 pm','dd-mm-yyyy hh:mi pm'),to_date('02/05/2019 5:13 pm','dd-mm-yyyy hh:mi pm'),174776,1012);
insert into admission values (149038,to_date('12/05/2019 6:32 am','dd-mm-yyyy hh:mi pm'),to_date('15/05/2019 7:23 pm','dd-mm-yyyy hh:mi pm'),174776,1018);
insert into admission values (168625,to_date('10/01/2019 7:32 am','dd-mm-yyyy hh:mi pm'),to_date('15/02/2019 7:54 pm','dd-mm-yyyy hh:mi pm'),169576,1018);
insert into admission values (106096,to_date('14/03/2019 7:32 pm','dd-mm-yyyy hh:mi pm'),to_date('15/03/2019 4:24 pm','dd-mm-yyyy hh:mi pm'),192635,1027);
insert into admission values (123917,to_date('14/03/2019 7:12 pm','dd-mm-yyyy hh:mi pm'),to_date('15/04/2019 12:23 pm','dd-mm-yyyy hh:mi pm'),158989,1028);
insert into admission values (187881,to_date('25/02/2019 5:02 am','dd-mm-yyyy hh:mi pm'),to_date('15/04/2019 11:43 am','dd-mm-yyyy hh:mi pm'),105264,1033);
insert into admission values (113227,to_date('13/01/2019 9:02 am','dd-mm-yyyy hh:mi pm'),to_date('23/01/2019 10:43 am','dd-mm-yyyy hh:mi pm'),197151,1048);
insert into admission values (161856,to_date('13/02/2019 3:02 am','dd-mm-yyyy hh:mi pm'),to_date('23/04/2019 10:13 pm','dd-mm-yyyy hh:mi pm'),197151,1048);
insert into admission values (182347,to_date('13/05/2019 3:02 am','dd-mm-yyyy hh:mi pm'),null,197151,1056);

insert into admission values (133646,to_date('12/02/2019 2:54 am','dd-mm-yyyy hh:mi pm'),to_date('23/04/2019 10:43 pm','dd-mm-yyyy hh:mi pm'),167850,1056);
insert into admission values (145598,to_date('17/05/2019 2:54 pm','dd-mm-yyyy hh:mi pm'),null,128063,1060);
insert into admission values (199378,to_date('08/02/2019 10:22 am','dd-mm-yyyy hh:mi pm'),to_date('02/04/2019 1:43 am','dd-mm-yyyy hh:mi pm'),128063,1060);
insert into admission values (153647,to_date('22/03/2019 11:22 am','dd-mm-yyyy hh:mi pm'),to_date('02/05/2019 7:03 pm','dd-mm-yyyy hh:mi pm'),167488,1061);
insert into admission values (123081,to_date('13/03/2019 11:28 pm','dd-mm-yyyy hh:mi pm'),to_date('19/05/2019 9:27 am','dd-mm-yyyy hh:mi pm'),167488,1064);
insert into admission values (159563,to_date('05/05/2019 12:00 pm','dd-mm-yyyy hh:mi pm'),null,105264,1069);
insert into admission values (198246,to_date('11/03/2019 12:00 pm','dd-mm-yyyy hh:mi pm'),null,167488,1084);
--insert into adm_prc
insert into adm_prc values (182650,to_date('18/02/2019 4:13 pm','dd-mm-yyyy hh:mi pm'),250.99,7.95,124287,12055,1005,1005);
insert into adm_prc values (184257,to_date('28/04/2019 4:13 pm','dd-mm-yyyy hh:mi pm'),20.1,4.5,155963,15509,1012,1018);
insert into adm_prc values (126478,to_date('29/04/2019 4:53 pm','dd-mm-yyyy hh:mi pm'),20.75,21.7,155963,15510,1012,1027);
insert into adm_prc values (170244,to_date('29/04/2019 4:53 pm','dd-mm-yyyy hh:mi pm'),203,0,149038,15511,1048,1048);
insert into adm_prc values (194092,to_date('29/01/2019 4:24 am','dd-mm-yyyy hh:mi pm'),502,0,168625,17122,1018,1018);
insert into adm_prc values (139859,to_date('15/03/2019 4:24 am','dd-mm-yyyy hh:mi pm'),66,51.6,106096,19887,1028,1033);
insert into adm_prc values (191038,to_date('09/04/2019 4:24 am','dd-mm-yyyy hh:mi pm'),100,0,123917,23432,1028,null);
insert into adm_prc values (153844,to_date('10/04/2019 7:33 am','dd-mm-yyyy hh:mi pm'),255,0,123917,12055,1048,null);
insert into adm_prc values (178253,to_date('10/04/2019 7:33 pm','dd-mm-yyyy hh:mi pm'),99,0,187881,23432,1048,1033);
insert into adm_prc values (114292,to_date('16/01/2019 7:33 pm','dd-mm-yyyy hh:mi pm'),633,327,113227,27459,1048,1056);
insert into adm_prc values (121300,to_date('16/02/2019 7:33 pm','dd-mm-yyyy hh:mi pm'),634,150,161856,27459,7900,7890);
insert into adm_prc values (112931,to_date('16/03/2019 2:45 pm','dd-mm-yyyy hh:mi pm'),109.23,123,133646,29844,1099,null);
insert into adm_prc values (181971,to_date('17/05/2019 5:00 pm','dd-mm-yyyy hh:mi pm'),79,95,145598,32266,1061,1060);
insert into adm_prc values (154492,to_date('17/03/2019 2:00 pm','dd-mm-yyyy hh:mi pm'),70.35,35,199378,33335,1060,1060);
insert into adm_prc values (174893,to_date('27/03/2019 2:51 pm','dd-mm-yyyy hh:mi pm'),70,0,153647,33335,1060,1060);
insert into adm_prc values (160337,to_date('27/04/2019 1:51 am','dd-mm-yyyy hh:mi pm'),36,11.3,153647,40099,1056,1099);
insert into adm_prc values (113983,to_date('14/03/2019 1:51 am','dd-mm-yyyy hh:mi pm'),33.4,45,123081,40100,1095,1298);
insert into adm_prc values (135044,to_date('10/05/2019 11:22 am','dd-mm-yyyy hh:mi pm'),356,0,159563,43111,1069,1298);
insert into adm_prc values (169274,to_date('11/05/2019 11:22 am','dd-mm-yyyy hh:mi pm'),356,0,159563,43111,1069,1298);
insert into adm_prc values (150308,to_date('15/03/2019 12:22 am','dd-mm-yyyy hh:mi pm'),400,339,198246,43112,1048,1056);


--insert into item_treatment
insert into item_treatment values (182650,'NE001',01,3.45);
insert into item_treatment values (182650,'CA002',02,4.5);
insert into item_treatment values (184257,'CA002',02,4.5);
insert into item_treatment values (126478,'OV001',05,21.7);
insert into item_treatment values (139859,'TE001',30,51.6);
insert into item_treatment values (114292,'AN002',01,182);
insert into item_treatment values (114292,'SS006',10,145);
insert into item_treatment values (121300,'SS006',10,150);
insert into item_treatment values (112931,'KN056',1,123);
insert into item_treatment values (112931,'PS318',20,95);
insert into item_treatment values (160337,'AT258',11.3,10);
insert into item_treatment values (113983,'TN010',45,100);
insert into item_treatment values (150308,'EA030',01,100);
insert into item_treatment values (150308,'TN010',92,200);
insert into item_treatment values (150308,'CE010',39,10);


commit;

