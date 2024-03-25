drop table QuestionnaireQuestions;
drop table TestAnswer;
drop table Test;
drop table Answer;
drop table Question;
drop table Questionnaire;

create table Question(
id_i int(4),
intrebare varchar(800),
poza int(3),
sectiune varchar(80),
categorie varchar(20)
);

CREATE TABLE Answer
(id_i int(4),
id_r char(1),
raspuns varchar(800),
corect char(1)
);

CREATE TABLE Questionnaire
( id_c int(3),
denumire varchar(30),
punctaj_max int(3)
);

CREATE TABLE QuestionnaireQuestions
( id_c int(3),
id_i int(4),
numar_ordine int(3)
);


CREATE TABLE Test
( id_t int(2),
data date,
punctaj int(3),
id_c int(3)
);

CREATE TABLE TestAnswer
(id_t int(2),
id_i int(4),
id_r char(1),
corect char(1)
);


ALTER TABLE Question
ADD CONSTRAINT intrebare_id_i_pk PRIMARY KEY(id_i);

ALTER TABLE Answer 
ADD CONSTRAINT raspuns_id_i_id_r_pk PRIMARY KEY(id_i, id_r);


ALTER TABLE Questionnaire
ADD CONSTRAINT chestionar_id_c_pk PRIMARY KEY(id_c);

ALTER TABLE  QuestionnaireQuestions ADD CONSTRAINT intrebari_chestionar_id_c_fk  FOREIGN KEY (id_c)
REFERENCES  Questionnaire(id_c);

ALTER TABLE  QuestionnaireQuestions ADD CONSTRAINT intrebari_chestionar_id_i_fk  FOREIGN KEY (id_i)
REFERENCES  Question(id_i);

ALTER TABLE Test
ADD CONSTRAINT test_id_t_pk PRIMARY KEY(id_t);


ALTER TABLE Test
ADD CONSTRAINT test_id_c_fk FOREIGN KEY (id_c) REFERENCES Questionnaire (id_c);


ALTER TABLE  TestAnswer ADD CONSTRAINT raspuns_test_id_t_fk  FOREIGN KEY (id_t)
REFERENCES  Test(id_t);



ALTER TABLE TestAnswer
ADD CONSTRAINT rasp_test_fk FOREIGN KEY (id_i, id_r) REFERENCES Answer(id_i, id_r);

ALTER TABLE Question
MODIFY categorie varchar(50);

ALTER TABLE Questionnaire
MODIFY punctaj_max int(3) CONSTRAINT chestionar_punctaj_max_ck check (punctaj_max>=10 AND punctaj_max<=26);

ALTER TABLE Question 
ADD CONSTRAINT Intrebare_chk CHECK(poza IS NOT NULL OR poza IS NULL AND sectiune != 'Indicatoare si marcaje');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (1,'Schimbarea directiei de mers la stanga sau dreapta nu e permisa la intalnirea',1,'Indicatoare si marcaje','B');
insert into Answer 
values (1,'a','Indicatorului 1','D');
insert into Answer 
values (1,'b','Indicatorului 2','N');
insert into Answer 
values (1,'c','Ambelor indicatoare','N');
insert into Answer 
values (1,'d','Niciunui indicator','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (2,'Panoul de sub indicator permite',2,'Indicatoare si marcaje','B');
insert into Answer 
values (2,'a','Stationarea in intervalul mentionat','N');
insert into Answer 
values (2,'b','Stationarea in afara intervalului mentionat','N');
insert into Answer 
values (2,'c','Oprirea in intervalul mentionat','D');
insert into Answer 
values (2,'d','Oprirea in afara intervalului mentionat','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (3,'Care dintre indicatoare te avertizeaza ca urmeaza un drum cu prioritate?',3,'Indicatoare si marcaje','B');
insert into Answer 
values (3,'a','Indicatorul 1','N');
insert into Answer 
values (3,'b','Indicatorul 2','N');
insert into Answer 
values (3,'c','Indicatorul 3','D');
insert into Answer 
values (3,'d','Indicatorul 4','N');


insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (4,'Este corect sa depasesti motocicleta din fata ta?',4,'Depasirea','B');
insert into Answer 
values (4,'a','Da','D');
insert into Answer 
values (4,'b','Nu, deoarece vei depasi axul drumului','N');
insert into Answer 
values (4,'c','Nu, deoarece nu vei respecta indicatorul','N');
insert into Answer 
values (4,'d','Nu, deoarece te afli intr-o curba','N');


insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (5,'Executa corect autoturismul manevra de depasire?',5,'Depasirea','B');
insert into Answer 
values (5,'a','Da','N');
insert into Answer 
values (5,'b','Nu, deoarece autobuzul are prioritate de plecare din statie','D');
insert into Answer 
values (5,'c','Nu, deoarece manevra nu e permisa in dreptul statiilor pentru transport in comun','N');
insert into Answer 
values (5,'d','Nu, deoarece te afli intr-o curba','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (6,'Cum veti proceda corect pentru a intra pe autostrada?',NULL,'Circulatia pe autostrazi','B');
insert into Answer 
values (6,'a','Veti mari viteza','D');
insert into Answer 
values (6,'b','Veti ceda trecerea','D');
insert into Answer 
values (6,'c','Nu veti mari viteza','N');
insert into Answer 
values (6,'d','Niciuna de mai sus','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (7,'Este permisa patrunderea pe racordul dintre cele 2 parti carosabile ale unei autostrazi?',1,'Circulatia pe autostrazi','B');
insert into Answer 
values (7,'a','Nu','D');
insert into Answer 
values (7,'b','Da, pentru oprire in caz de urgenta','N');
insert into Answer 
values (7,'c','Da, pentru schimbarea directiei de mers','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (8,'Este permisa patrunderea pe racordul dintre cele 2 parti carosabile ale unei autostrazi?',1,'Circulatia pe autostrazi','B');
insert into Answer 
values (8,'a','Nu','D');
insert into Answer 
values (8,'b','Da, pentru oprire in caz de urgenta','N');
insert into Answer 
values (8,'c','Da, pentru schimbarea directiei de mers','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (9,'Ce manevre sunt interzise pe autostrada?',1,'Circulatia pe autostrazi','B');
insert into Answer 
values (9,'a','Folosirea benzii de accelerare pentru a schimba directia de mers','D');
insert into Answer 
values (9,'b','Circulatia sau stationarea pe banda de urgenta, cu exceptia cazurilor justificate','D');
insert into Answer 
values (9,'c','Deplasarea cu o viteza inferioara limitei maxime permise','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (10,'Ce manevre sunt interzise pe autostrada?',1,'Circulatia pe autostrazi','B');
insert into Answer 
values (10,'a','Folosirea benzii de accelerare pentru a schimba directia de mers','D');
insert into Answer 
values (10,'b','Circulatia sau stationarea pe banda de urgenta, cu exceptia cazurilor justificate','D');
insert into Answer 
values (10,'c','Deplasarea cu o viteza inferioara limitei maxime permise','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (11,'Cum veţi proceda dacă intenţionaţi să schimbaţi direcţia de mers spre dreapta?',NULL,'Manevre','B');
insert into Answer 
values (11,'a','semnalizaţi schimbarea direcţiei de mers; pietonii vă vor acorda prioritate','N');
insert into Answer 
values (11,'b','semnalizaţi schimbarea direcţiei de mers; acordaţi prioritate vehiculelor care circulă din partea stângă','N');
insert into Answer 
values (11,'c','semnalizaţi schimbarea direcţiei de mers şi acordaţi prioritate de trecere pietonilor','D');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (12,'Ce tendinţă prezintă un autoturism cu tracţiune pe spate, dacă acceleraţi prea puternic în curbă?',NULL,'Manevre','B');
insert into Answer 
values (12,'a','autoturismul urmează, fără deviere, cursa volanului','N');
insert into Answer 
values (12,'b','autoturismul tinde să derapeze cu spatele spre exteriorul curbei','D');
insert into Answer 
values (12,'c','roţile din faţă se învârtesc în gol','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (13,'Ce tendinţă prezintă un autoturism cu tracţiune pe spate, dacă acceleraţi prea puternic în curbă?',NULL,'Manevre','B');
insert into Answer 
values (13,'a','autoturismul urmează, fără deviere, cursa volanului','N');
insert into Answer 
values (13,'b','autoturismul tinde să derapeze cu spatele spre exteriorul curbei','D');
insert into Answer 
values (13,'c','roţile din faţă se învârtesc în gol','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (14,'Ce obligaţii are conducătorul de autovehicule când circulă pe un drum public?',NULL,'Manevre','B');
insert into Answer 
values (14,'a','să circule numai dacă verificarea medicală lunară este efectuată','N');
insert into Answer 
values (14,'b','să circule numai pe sectoarele de drum pe care îi este permis accesul şi să respecte normele referitoare la masele totale maxime autorizate admise de autoritatea competentă','D');
insert into Answer 
values (14,'c',' să se informeze din timp, la administratorii de drum, în legătură cu eventualele limite maxime şi minime de viteză','N');

insert into Question (id_i,intrebare,poza,sectiune,categorie)
values (15,'Ce obligaţii are conducătorul de autovehicule când circulă pe un drum public?',NULL,'Manevre','B');
insert into Answer 
values (15,'a','să circule numai dacă verificarea medicală lunară este efectuată','N');
insert into Answer 
values (15,'b','să circule numai pe sectoarele de drum pe care îi este permis accesul şi să respecte normele referitoare la masele totale maxime autorizate admise de autoritatea competentă','D');
insert into Answer 
values (15,'c',' să se informeze din timp, la administratorii de drum, în legătură cu eventualele limite maxime şi minime de viteză','N');

insert into Questionnaire 
values(1,'Questionnaire 1',26);
insert into Questionnaire 
values(2,'Questionnaire 2',26);
insert into Questionnaire 
values(3,'Questionnaire 3',26);
insert into Questionnaire 
values(4,'Questionnaire 4',26);
insert into Questionnaire 
values(5,'Questionnaire 5',26);


insert into QuestionnaireQuestions
values(1,1,1);
insert into QuestionnaireQuestions
values(1,3,2);
insert into QuestionnaireQuestions
values(1,5,3);
insert into QuestionnaireQuestions
values(1,6,4);
insert into QuestionnaireQuestions
values(1,2,5);
insert into QuestionnaireQuestions
values(1,7,6);
insert into QuestionnaireQuestions
values(1,8,7);
insert into QuestionnaireQuestions
values(1,9,8);
insert into QuestionnaireQuestions
values(1,10,9);
insert into QuestionnaireQuestions
values(1,4,10);
insert into QuestionnaireQuestions
values(1,11,11);
insert into QuestionnaireQuestions
values(1,12,12);


insert into QuestionnaireQuestions
values(2,2,1);
insert into QuestionnaireQuestions
values(2,1,2);
insert into QuestionnaireQuestions
values(2,4,3);
insert into QuestionnaireQuestions
values(2,3,4);
insert into QuestionnaireQuestions
values(2,5,5);
insert into QuestionnaireQuestions
values(2,7,6);
insert into QuestionnaireQuestions
values(2,8,7);
insert into QuestionnaireQuestions
values(2,9,8);
insert into QuestionnaireQuestions
values(2,11,9);
insert into QuestionnaireQuestions
values(2,13,10);
insert into QuestionnaireQuestions
values(2,12,11);
insert into QuestionnaireQuestions
values(2,10,12);


insert into QuestionnaireQuestions
values(3,3,1);
insert into QuestionnaireQuestions
values(3,1,2);
insert into QuestionnaireQuestions
values(3,4,3);
insert into QuestionnaireQuestions
values(3,2,4);
insert into QuestionnaireQuestions
values(3,5,5);
insert into QuestionnaireQuestions
values(3,7,6);
insert into QuestionnaireQuestions
values(3,8,7);
insert into QuestionnaireQuestions
values(3,12,8);
insert into QuestionnaireQuestions
values(3,11,9);
insert into QuestionnaireQuestions
values(3,13,14);
insert into QuestionnaireQuestions
values(3,9,11);
insert into QuestionnaireQuestions
values(3,10,12);



insert into QuestionnaireQuestions
values(4,1,1);
insert into QuestionnaireQuestions
values(4,2,2);
insert into QuestionnaireQuestions
values(4,3,3);

insert into QuestionnaireQuestions
values(5,5,1);
insert into QuestionnaireQuestions
values(5,3,2);
insert into QuestionnaireQuestions
values(5,1,3);

insert into Test
values(1,'2020-03-20',10,1);
insert into Test
values(2,'2020-03-25',11,2);
insert into Test
values(3,'2020-03-29',10,3);

insert into TestAnswer
values(1,1,'a','D');
insert into TestAnswer
values(1,1,'b','N');
insert into TestAnswer
values(1,1,'c','N');
insert into TestAnswer
values(1,1,'d','N');

insert into TestAnswer
values(1,2,'a','N');
insert into TestAnswer
values(1,2,'b','N');
insert into TestAnswer
values(1,2,'c','D');
insert into TestAnswer
values(1,2,'d','N');

insert into TestAnswer
values(1,3,'a','N');
insert into TestAnswer
values(1,3,'b','N');
insert into TestAnswer
values(1,3,'c','D');
insert into TestAnswer
values(1,3,'d','N');

insert into TestAnswer
values(1,4,'a','N');
insert into TestAnswer
values(1,4,'b','D');
insert into TestAnswer
values(1,4,'c','N');
insert into TestAnswer
values(1,4,'d','N');

insert into TestAnswer
values(1,5,'a','D');
insert into TestAnswer
values(1,5,'b','D');
insert into TestAnswer
values(1,5,'c','N');
insert into TestAnswer
values(1,5,'d','N');

insert into TestAnswer
values(1,6,'a','D');
insert into TestAnswer
values(1,6,'b','D');
insert into TestAnswer
values(1,6,'c','N');
insert into TestAnswer
values(1,6,'d','N');

insert into TestAnswer
values(1,7,'a','D');
insert into TestAnswer
values(1,7,'b','N');
insert into TestAnswer
values(1,7,'c','N');


insert into TestAnswer
values(1,8,'a','D');
insert into TestAnswer
values(1,8,'b','N');
insert into TestAnswer
values(1,8,'c','N');


insert into TestAnswer
values(1,9,'a','D');
insert into TestAnswer
values(1,9,'b','N');
insert into TestAnswer
values(1,9,'c','N');


insert into TestAnswer
values(1,10,'a','D');
insert into TestAnswer
values(1,10,'b','D');
insert into TestAnswer
values(1,10,'c','N');


insert into TestAnswer
values(1,11,'a','N');
insert into TestAnswer
values(1,11,'b','N');
insert into TestAnswer
values(1,11,'c','D');


insert into TestAnswer
values(1,12,'a','N');
insert into TestAnswer
values(1,12,'b','D');
insert into TestAnswer
values(1,12,'c','N');

insert into TestAnswer
values(2,1,'a','D');
insert into TestAnswer
values(2,1,'b','D');
insert into TestAnswer
values(2,1,'c','N');
insert into TestAnswer
values(2,1,'d','N');

insert into TestAnswer
values(2,2,'a','D');
insert into TestAnswer
values(2,2,'b','N');
insert into TestAnswer
values(2,2,'c','D');
insert into TestAnswer
values(2,2,'d','N');

insert into TestAnswer
values(2,3,'a','D');
insert into TestAnswer
values(2,3,'b','N');
insert into TestAnswer
values(2,3,'c','D');
insert into TestAnswer
values(2,3,'d','N');

insert into TestAnswer
values(2,4,'a','D');
insert into TestAnswer
values(2,4,'b','N');
insert into TestAnswer
values(2,4,'c','N');
insert into TestAnswer
values(2,4,'d','N');

insert into TestAnswer
values(2,5,'a','N');
insert into TestAnswer
values(2,5,'b','D');
insert into TestAnswer
values(2,5,'c','N');
insert into TestAnswer
values(2,5,'d','N');

insert into TestAnswer
values(2,7,'a','D');
insert into TestAnswer
values(2,7,'b','N');
insert into TestAnswer
values(2,7,'c','N');


insert into TestAnswer
values(2,8,'a','D');
insert into TestAnswer
values(2,8,'b','N');
insert into TestAnswer
values(2,8,'c','N');


insert into TestAnswer
values(2,9,'a','D');
insert into TestAnswer
values(2,9,'b','N');
insert into TestAnswer
values(2,9,'c','N');


insert into TestAnswer
values(2,10,'a','D');
insert into TestAnswer
values(2,10,'b','D');
insert into TestAnswer
values(2,10,'c','N');


insert into TestAnswer
values(2,11,'a','N');
insert into TestAnswer
values(2,11,'b','N');
insert into TestAnswer
values(2,11,'c','D');


insert into TestAnswer
values(2,12,'a','N');
insert into TestAnswer
values(2,12,'b','D');
insert into TestAnswer
values(2,12,'c','N');


insert into TestAnswer
values(2,13,'a','N');
insert into TestAnswer
values(2,13,'b','D');
insert into TestAnswer
values(2,13,'c','N');

insert into TestAnswer
values(3,1,'a','N');
insert into TestAnswer
values(3,1,'b','N');
insert into TestAnswer
values(3,1,'c','D');
insert into TestAnswer
values(3,1,'d','N');

insert into TestAnswer
values(3,2,'a','N');
insert into TestAnswer
values(3,2,'b','N');
insert into TestAnswer
values(3,2,'c','D');
insert into TestAnswer
values(3,2,'d','D');

insert into TestAnswer
values(3,3,'a',NULL);
insert into TestAnswer
values(3,3,'b',NULL);
insert into TestAnswer
values(3,3,'c','D');
insert into TestAnswer
values(3,3,'d','N');

insert into TestAnswer
values(3,4,'a','D');
insert into TestAnswer
values(3,4,'b','N');
insert into TestAnswer
values(3,4,'c','N');
insert into TestAnswer
values(3,4,'d','N');

insert into TestAnswer
values(3,5,'a','N');
insert into TestAnswer
values(3,5,'b','D');
insert into TestAnswer
values(3,5,'c','N');
insert into TestAnswer
values(3,5,'d','N');


insert into TestAnswer
values(3,7,'a','D');
insert into TestAnswer
values(3,7,'b','N');
insert into TestAnswer
values(3,7,'c','N');


insert into TestAnswer
values(3,8,'a','D');
insert into TestAnswer
values(3,8,'b','N');
insert into TestAnswer
values(3,8,'c','N');


insert into TestAnswer
values(3,9,'a','D');
insert into TestAnswer
values(3,9,'b','N');
insert into TestAnswer
values(3,9,'c','N');


insert into TestAnswer
values(3,10,'a','D');
insert into TestAnswer
values(3,10,'b','D');
insert into TestAnswer
values(3,10,'c','N');


insert into TestAnswer
values(3,11,'a','N');
insert into TestAnswer
values(3,11,'b','N');
insert into TestAnswer
values(3,11,'c','D');


insert into TestAnswer
values(3,12,'a','N');
insert into TestAnswer
values(3,12,'b','D');
insert into TestAnswer
values(3,12,'c','N');


insert into TestAnswer
values(3,13,'a','N');
insert into TestAnswer
values(3,13,'b','D');
insert into TestAnswer
values(3,13,'c','N');




























