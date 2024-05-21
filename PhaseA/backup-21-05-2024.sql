prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by Yahel Koler on Tuesday, May 21, 2024
set feedback off
set define off

prompt Creating SQUADRON...
create table SQUADRON
(
  squadron_number NUMBER(38) not null,
  suadron_name    VARCHAR2(20) not null,
  formation_date  DATE not null
)
;
alter table SQUADRON
  add constraint PK_SQUADRON primary key (SQUADRON_NUMBER);

prompt Creating AIRBASE...
create table AIRBASE
(
  name            VARCHAR2(50) not null,
  capacity        NUMBER(38) not null,
  location        VARCHAR2(30) not null,
  squadron_number NUMBER(38) not null,
  runway_number   NUMBER(38) not null
)
;
alter table AIRBASE
  add constraint PK_AIRBASE primary key (NAME);
alter table AIRBASE
  add constraint FK_AIRBASE foreign key (SQUADRON_NUMBER)
  references SQUADRON (SQUADRON_NUMBER);

prompt Creating AIRCRAFT...
create table AIRCRAFT
(
  serialid        NUMBER(38) not null,
  production_date DATE not null,
  ammunitiontype  VARCHAR2(15) not null,
  model           VARCHAR2(15) not null
)
;
alter table AIRCRAFT
  add constraint PK_AIRCRAFT primary key (SERIALID);

prompt Creating AIRPLANE...
create table AIRPLANE
(
  serialid              NUMBER(38) not null,
  fuel                  NUMBER(38) not null,
  gforce_limit          NUMBER(38) not null,
  ejection_seat_capable CHAR(1) not null
)
;
alter table AIRPLANE
  add constraint PK_AIRPLANE primary key (SERIALID);
alter table AIRPLANE
  add constraint FK_AIRPLANE foreign key (SERIALID)
  references AIRCRAFT (SERIALID);

prompt Creating SOLDIER...
create table SOLDIER
(
  first_name VARCHAR2(20) not null,
  last_name  VARCHAR2(20) not null,
  rank       VARCHAR2(10) not null,
  birthdate  DATE not null,
  id         NUMBER(38) not null
)
;
alter table SOLDIER
  add constraint PK_SOLDIER primary key (ID);

prompt Creating PILOT...
create table PILOT
(
  id              NUMBER(38) not null,
  type            VARCHAR2(10) not null,
  flight_hours    NUMBER(38) not null,
  call_sign       VARCHAR2(20) not null,
  squadron_number NUMBER(38) not null
)
;
alter table PILOT
  add constraint PK_PILOT primary key (ID);
alter table PILOT
  add constraint FK_PILOT foreign key (SQUADRON_NUMBER)
  references SQUADRON (SQUADRON_NUMBER) on delete cascade;
alter table PILOT
  add constraint FK_PILOT2 foreign key (ID)
  references SOLDIER (ID);

prompt Creating FLIGHT...
create table FLIGHT
(
  flightid    NUMBER(38) not null,
  id          NUMBER(38) not null,
  name        VARCHAR2(50) not null,
  serialid    NUMBER(38) not null,
  flight_date DATE not null,
  duration    NUMBER(38) not null
)
;
alter table FLIGHT
  add constraint PK_FLIGHT primary key (FLIGHTID, ID, NAME, SERIALID);
alter table FLIGHT
  add constraint FK_FLIGHT foreign key (ID)
  references PILOT (ID) on delete cascade;
alter table FLIGHT
  add constraint FK_FLIGHT2 foreign key (NAME)
  references AIRBASE (NAME) on delete cascade;
alter table FLIGHT
  add constraint FK_FLIGHT3 foreign key (SERIALID)
  references AIRCRAFT (SERIALID) on delete cascade;

prompt Creating TECHNICAL_ENGINEER...
create table TECHNICAL_ENGINEER
(
  id            NUMBER(38) not null,
  degree        VARCHAR2(20) not null,
  speciality    VARCHAR2(20) not null,
  licencenumber NUMBER(38) not null
)
;
alter table TECHNICAL_ENGINEER
  add constraint PK_TECHNICAL_ENGINEER primary key (ID);
alter table TECHNICAL_ENGINEER
  add unique (LICENCENUMBER);
alter table TECHNICAL_ENGINEER
  add constraint FK_TECHNICAL_ENGINEER foreign key (ID)
  references SOLDIER (ID);

prompt Creating UAV...
create table UAV
(
  serialid      NUMBER(38) not null,
  battry        NUMBER(38) not null,
  communication VARCHAR2(20) not null,
  control_range NUMBER(38) not null
)
;
alter table UAV
  add constraint PK_UAV primary key (SERIALID);
alter table UAV
  add constraint FK_UAV foreign key (SERIALID)
  references AIRCRAFT (SERIALID);

prompt Loading SQUADRON...
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (318402, 'Vanguards', to_date('26-08-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (269211, 'Skyknights', to_date('15-07-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (706395, 'Silverhawks', to_date('26-04-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (331946, 'Skyriders', to_date('04-08-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (638464, 'Skyguardians', to_date('11-09-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (762855, 'Crusaders', to_date('15-05-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (740508, 'Thunderwolves', to_date('12-12-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (236721, 'Thunderbolts', to_date('17-10-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (670446, 'Stormbringers', to_date('11-05-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (776789, 'Blades', to_date('03-05-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (292394, 'Warlords', to_date('10-12-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (345826, 'Hellhounds', to_date('01-12-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (788882, 'Skyblazers', to_date('19-03-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (456482, 'Cyclones', to_date('02-02-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (879378, 'Valkyrie', to_date('30-04-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (894935, 'Crusaders', to_date('19-12-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (327322, 'Silverbacks', to_date('03-12-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (319042, 'Thunderbirds', to_date('12-10-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (928512, 'Steelrain', to_date('06-07-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (722813, 'Ravenshade', to_date('11-01-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (894459, 'Dragons', to_date('10-08-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (759114, 'Overwatch', to_date('19-01-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (556565, 'Valkyrie', to_date('09-05-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (938387, 'Strikers', to_date('29-11-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (751830, 'Stormeagles', to_date('24-04-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (979080, 'Steelwings', to_date('16-04-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (989556, 'Spartans', to_date('18-03-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (931670, 'Archangels', to_date('31-08-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (572459, 'Falcons', to_date('23-08-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (338900, 'Nightstalkers', to_date('31-03-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (435908, 'Scorpions', to_date('16-08-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (186334, 'Thunderbirds', to_date('23-10-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (907027, 'Blackbirds', to_date('27-12-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (845883, 'Stormeagles', to_date('03-08-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (152270, 'Warhawks', to_date('09-12-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (676765, 'Avalanche', to_date('22-08-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (709124, 'Stormriders', to_date('25-04-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (729720, 'Starfighters', to_date('10-07-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (466087, 'Bearcats', to_date('10-07-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (357402, 'Steelrain', to_date('29-05-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (196139, 'Thunderbirds', to_date('25-12-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (773082, 'Nightwatch', to_date('11-01-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (943963, 'Silverhawks', to_date('24-10-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (877168, 'Spartans', to_date('12-10-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (747366, 'Spartans', to_date('05-08-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (293094, 'Cyclones', to_date('06-11-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (219888, 'Cyclones', to_date('06-12-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (676817, 'Avalanche', to_date('13-05-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (165875, 'Archangels', to_date('20-04-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (394003, 'Silverbacks', to_date('17-10-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (222397, 'Ghostriders', to_date('25-01-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (652003, 'Vipers', to_date('12-09-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (755715, 'Skyknights', to_date('20-07-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (836350, 'Predators', to_date('15-06-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (864706, 'Enforcers', to_date('02-05-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (289879, 'Wolfpack', to_date('26-06-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (191008, 'Nightstalkers', to_date('04-10-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (492956, 'Invictus', to_date('17-12-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (286915, 'Stormriders', to_date('08-05-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (212051, 'Nomads', to_date('23-06-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (178510, 'Thunderwolves', to_date('05-11-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (787039, 'Skyhunters', to_date('27-10-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (664305, 'Skyprowlers', to_date('05-04-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (281688, 'Archangels', to_date('25-10-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (640183, 'Tornadoes', to_date('22-02-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (932771, 'Titans', to_date('20-06-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (920828, 'Blackjacks', to_date('11-05-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (657602, 'Nomads', to_date('13-03-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (467350, 'Hornets', to_date('08-08-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (123594, 'Thunderbolts', to_date('08-08-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (211823, 'Warhawks', to_date('20-02-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (803122, 'Outlaws', to_date('27-08-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (922999, 'Scorpions', to_date('16-10-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (438590, 'Wildcats', to_date('04-12-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (265044, 'Skyriders', to_date('15-11-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (682555, 'Thunderbolts', to_date('19-05-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (793786, 'Mavericks', to_date('29-08-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (862247, 'Stormriders', to_date('10-05-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (294036, 'Skyhawks', to_date('10-07-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (503065, 'Skyguardians', to_date('15-05-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (518319, 'Ghostriders', to_date('06-07-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (937903, 'Steelwings', to_date('26-04-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (922955, 'Invictus', to_date('28-02-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (984770, 'Skyshadow', to_date('02-04-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (343264, 'Ghosts', to_date('09-03-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (400197, 'Nightfury', to_date('13-03-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (486859, 'Skywarriors', to_date('26-08-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (966878, 'Crusaders', to_date('25-02-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (283849, 'Starfighters', to_date('20-11-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (256841, 'Vipers', to_date('30-07-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (596565, 'Tornadoes', to_date('01-10-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (182669, 'Sabres', to_date('05-12-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (890326, 'Wingmen', to_date('02-09-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (215016, 'Scorpions', to_date('22-04-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (282107, 'Phantoms', to_date('07-06-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (861134, 'Thunderbolts', to_date('13-08-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (446952, 'Aurora', to_date('24-12-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (172711, 'Eagles', to_date('14-01-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (553877, 'Gladiators', to_date('30-07-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (238091, 'Phantoms', to_date('15-06-1997', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (655051, 'Raptors', to_date('24-04-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (220319, 'Avalanche', to_date('23-04-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (945503, 'Skyraiders', to_date('16-10-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (484586, 'Saboteurs', to_date('12-04-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (676721, 'Raptors', to_date('15-05-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (122790, 'Dragons', to_date('02-10-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (427524, 'Stormeagles', to_date('14-07-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (685388, 'Nightwatch', to_date('19-09-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (140752, 'Blackbirds', to_date('30-09-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (377676, 'Reapers', to_date('21-07-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (905935, 'Aurora', to_date('11-05-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (525398, 'Nightwatch', to_date('30-11-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (437301, 'Nightwolves', to_date('04-08-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (869357, 'Ravenshade', to_date('13-09-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (944651, 'Vanguards', to_date('06-05-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (566780, 'Windriders', to_date('01-04-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (152920, 'Eagles', to_date('08-03-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (564777, 'Stormravens', to_date('22-03-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (875964, 'Hawks', to_date('04-08-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (424623, 'Nightfury', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (522455, 'Eagles', to_date('14-12-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (120990, 'Firebirds', to_date('08-11-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (188050, 'Avalanche', to_date('10-11-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (873957, 'Falcons', to_date('22-11-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (999422, 'Skyknights', to_date('18-11-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (499845, 'Overwatch', to_date('17-05-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (703584, 'Renegades', to_date('17-03-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (845926, 'Shadowhawks', to_date('05-10-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (371388, 'Shadowhawks', to_date('18-09-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (810099, 'Stealthhawks', to_date('16-02-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (488540, 'Blackbirds', to_date('14-09-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (295930, 'Nomads', to_date('29-04-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (171944, 'Wildcats', to_date('17-01-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (622300, 'Overwatch', to_date('25-10-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (555223, 'Ironclads', to_date('19-01-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (351561, 'Steelrain', to_date('05-04-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (165815, 'Predators', to_date('21-08-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (526718, 'Mavericks', to_date('18-03-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (748603, 'Ironhawks', to_date('18-04-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (473129, 'Cobras', to_date('06-07-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (208686, 'Shadowstrike', to_date('17-01-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (329674, 'Stealthhawks', to_date('05-11-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (130010, 'Skyraiders', to_date('19-04-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (684602, 'Vanguards', to_date('28-02-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (508284, 'Predators', to_date('05-12-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (808544, 'Shadowstrike', to_date('04-04-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (297264, 'Stormtroopers', to_date('09-04-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (957762, 'Silverhawks', to_date('20-12-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (638308, 'Skyblazers', to_date('25-01-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (770776, 'Saboteurs', to_date('06-12-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (405277, 'Blackbirds', to_date('13-01-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (857412, 'Stormravens', to_date('23-06-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (581742, 'Griffins', to_date('21-07-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (287223, 'Ironhawks', to_date('21-06-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (776225, 'Valkyries', to_date('26-03-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (980410, 'Spartans', to_date('09-12-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (105128, 'Thunderwolves', to_date('31-01-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (495102, 'Avengers', to_date('07-03-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (713318, 'Skyblazers', to_date('26-03-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (746377, 'Mavericks', to_date('03-01-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (190360, 'Invictus', to_date('25-11-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (490895, 'Stormeagles', to_date('15-07-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (657250, 'Cobras', to_date('04-12-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (822879, 'Ravenshade', to_date('13-06-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (575562, 'Reapers', to_date('28-03-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (158504, 'Ghostriders', to_date('03-10-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (149395, 'Skyguardians', to_date('08-02-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (692879, 'Sentinels', to_date('15-10-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (281601, 'Nightwolves', to_date('10-11-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (902976, 'Gladiators', to_date('18-12-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (390792, 'Lightning', to_date('01-10-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (997306, 'Enforcers', to_date('15-03-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (125823, 'Eagles', to_date('01-08-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (985101, 'Warhawks', to_date('15-02-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (611002, 'Skyblazers', to_date('15-10-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (710521, 'Pumas', to_date('19-06-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (149540, 'Nightwolves', to_date('02-04-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (377204, 'Mavericks', to_date('11-04-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (185883, 'Nemesis', to_date('03-09-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (131509, 'Archangels', to_date('24-05-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (410866, 'Valkyries', to_date('16-03-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (585443, 'Blades', to_date('13-03-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (668364, 'Guardians', to_date('13-06-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (198607, 'Skyhunters', to_date('06-07-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (319436, 'Archangels', to_date('14-08-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (408921, 'Griffins', to_date('30-01-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (321260, 'Overwatch', to_date('02-07-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (560583, 'Renegades', to_date('16-05-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (914584, 'Stratosphere', to_date('26-09-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (530928, 'Cyclones', to_date('02-05-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (966204, 'Skyprowlers', to_date('05-10-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (861867, 'Skyraiders', to_date('04-05-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (313548, 'Invictus', to_date('10-06-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (362620, 'Sabres', to_date('14-01-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (387754, 'Skyknights', to_date('14-07-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (924761, 'Hellhounds', to_date('04-03-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (681248, 'Lightning', to_date('08-03-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (484462, 'Hellhounds', to_date('30-03-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (456742, 'Stormeagles', to_date('18-09-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (236433, 'Outlaws', to_date('11-04-2006', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (298212, 'Steelwings', to_date('28-08-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (855726, 'Bearcats', to_date('26-08-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (161918, 'Predators', to_date('01-08-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (973507, 'Wingmen', to_date('11-12-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (328211, 'Nomads', to_date('25-03-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (487376, 'Cobras', to_date('27-09-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (563960, 'Ghosts', to_date('14-11-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (122065, 'Nightwolves', to_date('07-06-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (312157, 'Scorpions', to_date('19-08-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (898640, 'Ghostriders', to_date('01-01-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (310912, 'Bearcats', to_date('24-05-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (575873, 'Dragons', to_date('31-03-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (739845, 'Avengers', to_date('22-10-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (602589, 'Stormeagles', to_date('12-05-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (179105, 'Valkyries', to_date('27-11-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (220633, 'Skyblazers', to_date('02-06-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (676076, 'Raptors', to_date('11-06-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (491028, 'Outlaws', to_date('22-04-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (228636, 'Valkyrie', to_date('28-05-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (137098, 'Bearcats', to_date('16-03-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (242743, 'Centurions', to_date('13-02-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (614023, 'Warhawks', to_date('03-12-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (387450, 'Thunderbolts', to_date('16-08-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (380834, 'Skyknights', to_date('15-12-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (883444, 'Centurions', to_date('29-07-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (574359, 'Shadowhawks', to_date('11-05-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (203111, 'Stratosphere', to_date('29-11-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (621461, 'Avalanche', to_date('26-07-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (162160, 'Pumas', to_date('05-01-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (682264, 'Skyknights', to_date('08-11-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (926300, 'Thunderstorm', to_date('01-04-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (649177, 'Phoenix', to_date('07-05-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (572594, 'Renegades', to_date('22-12-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (340692, 'Skyshadow', to_date('15-11-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (715116, 'Sentinels', to_date('31-07-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (481381, 'Condors', to_date('13-08-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (759709, 'Sentinels', to_date('15-09-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (256482, 'Spartans', to_date('03-07-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (974249, 'Griffins', to_date('08-03-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (927206, 'Ghosts', to_date('12-11-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (780034, 'Nightfury', to_date('26-06-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (897718, 'Silverbacks', to_date('31-08-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (668065, 'Wingmen', to_date('12-05-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (292771, 'Shadowhawks', to_date('12-12-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (152308, 'Blackjacks', to_date('02-12-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (642587, 'Skyhunters', to_date('28-03-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (671692, 'Thunderbirds', to_date('25-01-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (234976, 'Archangels', to_date('08-12-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (975014, 'Ghosts', to_date('24-08-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (890051, 'Firebirds', to_date('24-09-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (849145, 'Raptors', to_date('10-10-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (696636, 'Aurora', to_date('04-03-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (712373, 'Avengers', to_date('22-05-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (427651, 'Reapers', to_date('01-07-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (672576, 'Nightstalkers', to_date('04-04-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (980781, 'Gladiators', to_date('09-04-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (875354, 'Skyblazers', to_date('24-11-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (276759, 'Hellhounds', to_date('20-03-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (921693, 'Outlaws', to_date('14-07-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (846927, 'Thunderbolts', to_date('05-06-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (449267, 'Enforcers', to_date('13-09-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (860567, 'Ironclads', to_date('19-08-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (627416, 'Stealthhawks', to_date('29-08-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (237131, 'Pumas', to_date('10-11-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (744506, 'Windriders', to_date('13-02-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (565162, 'Ghostriders', to_date('16-03-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (748837, 'Skyhunters', to_date('11-08-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (964644, 'Bearcats', to_date('21-10-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (871990, 'Blackbirds', to_date('26-07-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (488965, 'Windriders', to_date('15-09-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (197545, 'Thunderwolves', to_date('16-12-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (422976, 'Predators', to_date('17-10-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (169881, 'Starfighters', to_date('26-07-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (600867, 'Bearcats', to_date('11-06-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (648372, 'Skyknights', to_date('06-08-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (898183, 'Saboteurs', to_date('27-08-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (733129, 'Steelwings', to_date('12-06-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (652374, 'Thunderbirds', to_date('10-02-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (800628, 'Skyhawks', to_date('07-03-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (692185, 'Bearcats', to_date('07-01-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (722416, 'Wolfpack', to_date('14-03-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (514057, 'Wildcats', to_date('30-11-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (578893, 'Avalanche', to_date('10-07-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (989941, 'Nightstalkers', to_date('23-09-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (854052, 'Reapers', to_date('06-07-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (231640, 'Nemesis', to_date('31-01-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (887415, 'Thunderbirds', to_date('08-09-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (528273, 'Blades', to_date('07-12-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (797395, 'Skyblazers', to_date('02-05-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (322029, 'Nightstalkers', to_date('11-04-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (957184, 'Aurora', to_date('21-12-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (749169, 'Eagles', to_date('04-04-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (231350, 'Shadowstrike', to_date('21-01-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (354587, 'Falcons', to_date('03-02-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (949752, 'Sentinels', to_date('02-07-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (245374, 'Steelrain', to_date('15-11-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (636517, 'Stealthhawks', to_date('21-09-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (387987, 'Nightwatch', to_date('09-03-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (606843, 'Nightfalcons', to_date('23-08-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (731069, 'Wolfpack', to_date('31-10-1998', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (524539, 'Bearcats', to_date('23-03-1983', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (157932, 'Silverbacks', to_date('09-02-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (259837, 'Wolfpack', to_date('06-01-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (195472, 'Skyhawks', to_date('18-06-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (431223, 'Valkyries', to_date('27-12-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (136077, 'Thunderstrike', to_date('04-07-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (838171, 'Predators', to_date('21-03-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (422149, 'Skyriders', to_date('24-03-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (924998, 'Shadowhawks', to_date('13-02-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (705448, 'Falcons', to_date('20-09-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (640731, 'Invictus', to_date('04-02-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (481873, 'Thunderbirds', to_date('05-11-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (507258, 'Centurions', to_date('02-06-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (422678, 'Skyprowlers', to_date('21-05-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (359300, 'Avengers', to_date('02-09-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (231822, 'Spartans', to_date('18-01-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (506170, 'Nightfury', to_date('27-04-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (862379, 'Stormbringers', to_date('03-03-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (168111, 'Stormeagles', to_date('15-07-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (278937, 'Hornets', to_date('16-10-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (890497, 'Stealthhawks', to_date('28-02-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (563942, 'Silverhawks', to_date('09-03-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (818580, 'Outlaws', to_date('22-11-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (390261, 'Stealthhawks', to_date('13-04-1988', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (855004, 'Valkyries', to_date('03-10-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (426105, 'Nomads', to_date('22-03-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (203280, 'Ghosts', to_date('30-11-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (358050, 'Stormeagles', to_date('04-09-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (254012, 'Archangels', to_date('13-10-2007', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (819579, 'Griffins', to_date('30-04-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (478209, 'Ironclads', to_date('29-09-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (352497, 'Thunderbolts', to_date('22-09-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (884653, 'Scorpions', to_date('01-12-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (613055, 'Sentinels', to_date('06-12-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (557427, 'Overwatch', to_date('10-10-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (719852, 'Stormbringers', to_date('04-05-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (546396, 'Skyraiders', to_date('10-03-2004', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (432901, 'Skyriders', to_date('24-12-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (319116, 'Skyshadow', to_date('09-06-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (508774, 'Hawks', to_date('03-04-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (928414, 'Blades', to_date('11-07-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (101870, 'Skyblazers', to_date('16-04-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (787131, 'Stormriders', to_date('02-04-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (532714, 'Ravens', to_date('23-10-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (201330, 'Overwatch', to_date('16-12-1992', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (227109, 'Avalanche', to_date('20-08-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (977096, 'Skyprowlers', to_date('29-04-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (801147, 'Stormeagles', to_date('07-01-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (814932, 'Scorpions', to_date('27-06-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (132819, 'Nightstalkers', to_date('19-09-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (421122, 'Gladiators', to_date('09-01-2002', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (377464, 'Vipers', to_date('02-12-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (228403, 'Hellhounds', to_date('31-12-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (757831, 'Blades', to_date('23-07-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (410190, 'Nightwolves', to_date('18-01-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (746336, 'Reapers', to_date('16-06-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (924636, 'Outlaws', to_date('17-04-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (663462, 'Shadowhawks', to_date('18-06-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (818286, 'Reapers', to_date('21-08-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (498365, 'Predators', to_date('09-10-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (685187, 'Hellhounds', to_date('14-08-2005', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (521913, 'Griffins', to_date('10-02-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (397321, 'Dragons', to_date('26-01-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (864828, 'Sentinels', to_date('29-03-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (827441, 'Skyphantoms', to_date('29-09-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (180565, 'Skyshadow', to_date('15-11-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (556927, 'Aurora', to_date('31-03-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (460338, 'Centurions', to_date('08-02-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (130550, 'Pumas', to_date('19-12-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (522456, 'Skyhawks', to_date('16-12-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (268172, 'Steelrain', to_date('22-07-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (116224, 'Lightning', to_date('18-01-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (901691, 'Ghostriders', to_date('03-02-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (968263, 'Ironclads', to_date('02-07-1994', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (555268, 'Thunderstrike', to_date('09-09-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (212444, 'Lightning', to_date('13-07-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (759234, 'Valkyrie', to_date('28-10-1996', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (790106, 'Nightfury', to_date('16-02-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (364324, 'Nightfury', to_date('10-09-2000', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (140849, 'Wingmen', to_date('03-04-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (634353, 'Ironclads', to_date('10-07-1991', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (932474, 'Ravenshade', to_date('25-02-1980', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (923217, 'Crusaders', to_date('13-12-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (757606, 'Steelwings', to_date('12-08-1998', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (317669, 'Shadowhawks', to_date('22-10-1981', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (560595, 'Skyraiders', to_date('20-12-1982', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (831637, 'Firebirds', to_date('18-04-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (107594, 'Thunderwolves', to_date('09-06-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (802464, 'Silverbacks', to_date('08-01-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (781563, 'Griffins', to_date('30-09-1995', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (345369, 'Ravenshade', to_date('02-01-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (828586, 'Blackbirds', to_date('19-11-1986', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (501048, 'Guardians', to_date('29-11-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (308527, 'Stratosphere', to_date('25-12-1984', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (243880, 'Raptors', to_date('12-11-2008', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (168024, 'Renegades', to_date('03-11-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (535827, 'Starfighters', to_date('21-08-1989', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (463259, 'Stormeagles', to_date('02-02-2009', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (695264, 'Eagles', to_date('15-01-2001', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (370214, 'Steelwings', to_date('01-09-1997', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (331645, 'Scorpions', to_date('13-06-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (237418, 'Lightning', to_date('04-07-2006', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (357617, 'Nightmares', to_date('23-12-1993', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (916729, 'Stormbringers', to_date('18-08-1987', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (960954, 'Silverbacks', to_date('04-02-2003', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (157814, 'Thunderbirds', to_date('06-07-1990', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (680899, 'Starfighters', to_date('12-01-1985', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (927863, 'Griffins', to_date('01-11-1999', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (618384, 'Nightwatch', to_date('12-05-1997', 'dd-mm-yyyy'));
insert into SQUADRON (squadron_number, suadron_name, formation_date)
values (625987, 'Spartans', to_date('18-04-1989', 'dd-mm-yyyy'));
commit;
prompt 410 records loaded
prompt Loading AIRBASE...
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mickey Tierney AirBase', 92, 'Cannock', 759114, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kate Def AirBase', 47, 'Kevelaer', 722813, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dianne Warden AirBase', 57, 'Debary', 161918, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mykelti Perry AirBase', 52, 'Milan', 387450, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Angie Weiss AirBase', 28, 'El Paso', 354587, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lance Nunn AirBase', 10, 'Novara', 289879, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Delbert Cube AirBase', 10, 'Cle Elum', 710521, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Garland Moffat AirBase', 98, 'Santa rita sapucaם', 359300, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rhea Lawrence AirBase', 11, 'Denver', 746377, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Bob Robbins AirBase', 15, 'Santa Cruz', 901691, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lennie Colman AirBase', 42, 'Charleston', 621461, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Remy Diesel AirBase', 82, 'Carson City', 329674, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Loreena Hector AirBase', 29, 'Salvador', 922955, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mike Quinn AirBase', 59, 'Waterloo', 276759, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lou Broadbent AirBase', 72, 'Michendorf', 107594, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Andie Raitt AirBase', 63, 'Delafield', 140849, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Peter Sewell AirBase', 94, 'Bernex', 974249, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Annette Holland AirBase', 86, 'Sao paulo', 937903, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Linda De Almeida AirBase', 84, 'Kloten', 871990, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Andy Todd AirBase', 30, 'Bracknell', 321260, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Catherine Assante AirBase', 89, 'Waco', 854052, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Uma Close AirBase', 26, 'Berkeley', 966878, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('David Child AirBase', 40, 'Elkins Park', 506170, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Melanie Ferrell AirBase', 32, 'Kaohsiung', 905935, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Fisher Nunn AirBase', 19, 'Monterrey', 149395, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Denny Holmes AirBase', 77, 'Charlotte', 680899, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hilary Klein AirBase', 21, 'Ilmenau', 924998, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Susan Pollack AirBase', 99, 'Mnster', 484462, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Elvis Page AirBase', 95, 'Dardilly', 845883, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ethan Willis AirBase', 32, 'Niigata', 508284, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Earl Walker AirBase', 19, 'Tartu', 898640, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Anna Makowicz AirBase', 49, 'Araras', 243880, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Emerson Bush AirBase', 84, 'New Delhi', 236721, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Robby Sylvian AirBase', 26, 'Belo Horizonte', 957762, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rowan Madsen AirBase', 68, 'Kungki', 245374, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sam Maguire AirBase', 83, 'Aachen', 898183, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Talvin Palin AirBase', 81, 'Maarssen', 553877, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Faye Boone AirBase', 20, 'Nashua', 681248, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tia Benet AirBase', 23, 'New York City', 231822, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hex Gleeson AirBase', 44, 'Cardiff', 684602, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tori Blackmore AirBase', 80, 'Campana', 729720, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Timothy Carlisle AirBase', 40, 'Avon', 898640, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Loren Pacino AirBase', 93, 'Dorval', 855004, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lee Boone AirBase', 45, 'Whitehouse Station', 107594, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Amy Nicholas AirBase', 92, 'Cromwell', 556927, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Chad Basinger AirBase', 32, 'Stoneham', 780034, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Pelvic Michael AirBase', 25, 'Fukuoka', 186334, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Drew Colon AirBase', 69, 'Schlieren', 427651, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gino Foster AirBase', 82, 'Lippetal', 838171, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jonny McDiarmid AirBase', 46, 'Firenze', 672576, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Carol Berry AirBase', 76, 'Karlsruhe', 652374, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Naomi Speaks AirBase', 80, 'Runcorn', 149540, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Liquid Benoit AirBase', 96, 'San Jose', 168024, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Campbell Taylor AirBase', 14, 'Reykjavik', 197545, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Samuel Washington AirBase', 54, 'Seoul', 278937, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Holland Diffie AirBase', 25, 'Mobile', 759234, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jann Gary AirBase', 33, 'Kyunnam', 278937, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Teri Roy Parnell AirBase', 80, 'King of Prussia', 648372, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sylvester Bandy AirBase', 18, 'Issaquah', 966204, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Clarence Beckham AirBase', 62, 'Recife', 705448, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lonnie Winwood AirBase', 26, 'Guamo', 831637, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Benicio Tyler AirBase', 76, 'Wuerzburg', 787131, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nick Utada AirBase', 53, 'Bratislava', 508284, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gordie Bridges AirBase', 68, 'Research Triangle', 338900, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Oliver Drive AirBase', 31, 'Daejeon', 169881, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Marc Levin AirBase', 32, 'Casselberry', 862247, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Renee Pearce AirBase', 41, 'West Windsor', 435908, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Joaquin Collins AirBase', 68, 'Lummen', 924998, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Arturo Makeba AirBase', 43, 'Nynהshamn', 140752, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Owen Brickell AirBase', 62, 'Brugherio', 989556, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Christine Keitel AirBase', 52, 'New Fairfield', 664305, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alannah Gaines AirBase', 36, 'Saint-vincent-de-dur', 313548, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hilton Mitra AirBase', 58, 'Lathrop', 289879, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Judge Sevenfold AirBase', 10, 'Immenstaad', 668364, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cornell Clark AirBase', 96, 'Tours', 431223, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Shawn Pressly AirBase', 17, 'Sale', 901691, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Temuera Ferrell AirBase', 20, 'Unionville', 980781, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Keanu Senior AirBase', 72, 'Woodbridge', 801147, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hex Farina AirBase', 55, 'San Francisco', 864706, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kid Taylor AirBase', 45, 'Tartu', 585443, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('George Fisher AirBase', 30, 'Maidenhead', 914584, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Wendy Johansen AirBase', 17, 'Mnchen', 256482, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jackson Stowe AirBase', 47, 'Kevelaer', 318402, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Woody Palmieri AirBase', 62, 'Vantaa', 265044, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Brooke Haysbert AirBase', 34, 'Bergara', 522456, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kirsten Dorn AirBase', 74, 'Ponta grossa', 682555, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rik Firth AirBase', 94, 'Brisbane', 380834, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lucinda Neuwirth AirBase', 53, 'Villata', 149395, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ice Moffat AirBase', 10, 'Luzern', 932771, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Chrissie Fehr AirBase', 63, 'Ashland', 649177, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Morris Breslin AirBase', 75, 'Visselhצvede', 773082, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dan Fraser AirBase', 35, 'Samrand', 400197, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vienna Davison AirBase', 66, 'Saint Paul', 751830, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alannah Witt AirBase', 38, 'Derwood', 945503, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Stanley Grier AirBase', 28, 'Sapporo', 278937, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ruth Sarandon AirBase', 34, 'Burgess Hill', 781563, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kurt McIntosh AirBase', 17, 'Lehi', 422976, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('David Aiken AirBase', 48, 'Budapest', 130010, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Petula Damon AirBase', 89, 'Rtp', 622300, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ted Sorvino AirBase', 63, 'Olivette', 243880, 18);
commit;
prompt 100 records committed...
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Garland Sedgwick AirBase', 44, 'Cottbus', 490895, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jake Reinhold AirBase', 61, 'Sendai', 281688, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jon Heald AirBase', 53, 'West Point', 256841, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Roger Willis AirBase', 41, 'Monterey', 924761, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Helen Isaak AirBase', 58, 'Pirmasens', 463259, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rade Ness AirBase', 97, 'Wichita', 926300, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Laura Kline AirBase', 92, 'Loveland', 680899, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Terence McClinton AirBase', 98, 'New Castle', 638308, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Melanie Benoit AirBase', 65, 'New Haven', 787131, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hector Atkinson AirBase', 14, 'Padova', 488965, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Carla Katt AirBase', 19, 'Jun-nam', 814932, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ernie Pacino AirBase', 32, 'Haverhill', 236721, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mae Kattan AirBase', 15, 'Ottawa', 578893, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Coley Patrick AirBase', 55, 'Manaus', 256482, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vendetta Springfield AirBase', 24, 'Shreveport', 400197, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nils Barry AirBase', 51, 'Westport', 938387, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Max Freeman AirBase', 99, 'Fort gordon', 405277, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hal Crouse AirBase', 13, 'Boulder', 564777, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Fats Berkeley AirBase', 21, 'Spresiano', 937903, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Curtis Shue AirBase', 14, 'Paisley', 566780, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alannah Laws AirBase', 14, 'Coldmeece', 354587, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mili Klugh AirBase', 47, 'Oldenburg', 557427, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ellen Liotta AirBase', 59, 'Chur', 887415, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Harry Edmunds AirBase', 80, 'Arlington', 490895, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Benicio Playboys AirBase', 88, 'Thalwil', 928414, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Seth Dourif AirBase', 27, 'Nicosia', 751830, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jay Secada AirBase', 63, 'Exeter', 574359, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Barbara Wiedlin AirBase', 43, 'Perth', 491028, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rowan Cervine AirBase', 76, 'Eden prairie', 749169, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kitty Fiennes AirBase', 85, 'Ramat Gan', 788882, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Marty Goodman AirBase', 29, 'South Hadley', 652374, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jeffery Stanton AirBase', 78, 'Carlsbad', 410190, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Daryle Walsh AirBase', 61, 'Sundsvall', 937903, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Shannyn Krieger AirBase', 56, 'Adamstown', 984770, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Katrin Pastore AirBase', 51, 'Smyrna', 460338, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lindsey Kotto AirBase', 41, 'Moorestown', 560595, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sheena Avital AirBase', 42, 'Lodi', 281601, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Matthew Dorn AirBase', 34, 'Melbourne', 979080, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tanya Curtis-Hall AirBase', 69, 'Brisbane', 927863, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Millie Dunaway AirBase', 15, 'Le chesnay', 140752, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lili Weaver AirBase', 29, 'Nepean', 640183, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cesar Assante AirBase', 90, 'Bergen', 136077, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Reese Lauper AirBase', 54, 'Miyazaki', 621461, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rebecca Vanian AirBase', 23, 'Kwun Tong', 960954, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Andie Farrow AirBase', 36, 'Warley', 242743, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Halle Stevenson AirBase', 15, 'Enschede', 855004, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('David Schneider AirBase', 23, 'Farmington Hills', 818286, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tia Rowlands AirBase', 19, 'Omaha', 985101, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vickie Cummings AirBase', 36, 'Woking', 556927, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Casey Dillon AirBase', 21, 'Salt Lake City', 902976, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cathy Loring AirBase', 59, 'Magstadt', 864706, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Joseph Keeslar AirBase', 61, 'Rua eteno', 618384, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('LeVar Farina AirBase', 18, 'Gaithersburg', 676765, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Paula Emmett AirBase', 98, 'Nagasaki', 228636, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Talvin Condition AirBase', 62, 'Ternitz', 788882, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kevin McGinley AirBase', 57, 'Hohenfels', 165815, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Glenn Bailey AirBase', 79, 'Courbevoie', 282107, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Saffron Jay AirBase', 18, 'Aurora', 182669, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sharon Peniston AirBase', 69, 'Suwon-city', 944651, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ossie Parsons AirBase', 75, 'O''fallon', 680899, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ike Holm AirBase', 86, 'Park Ridge', 254012, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cledus Sainte-Marie AirBase', 37, 'Cary', 526718, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Whoopi Satriani AirBase', 65, 'Mablethorpe', 131509, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Angela Candy AirBase', 83, 'Palma de Mallorca', 897718, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rascal McGovern AirBase', 26, 'Edinburgh', 928414, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ned Shandling AirBase', 63, 'Stanford', 973507, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rickie Loggia AirBase', 86, 'Barksdale afb', 387987, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kazem McNeice AirBase', 14, 'Nagano', 979080, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dennis Banderas AirBase', 17, 'Monmouth', 960954, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sinead Stampley AirBase', 82, 'Stone Mountain', 831637, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lari Torn AirBase', 99, 'Campinas', 722416, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mac Coburn AirBase', 23, 'Bרnes', 712373, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Shirley Schwimmer AirBase', 49, 'Northampton', 682264, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('John Henriksen AirBase', 91, 'Bartlesville', 787039, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Micky Ball AirBase', 59, 'Stanford', 793786, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Freddie Botti AirBase', 98, 'Mainz-kastel', 507258, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Radney De Almeida AirBase', 99, 'durham', 499845, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Al Harry AirBase', 85, 'Edison', 435908, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Grace Smith AirBase', 27, 'Perth', 733129, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Salma Colon AirBase', 50, 'Copenhagen', 222397, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alice Russo AirBase', 76, 'Netanya', 748603, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jeffrey Holbrook AirBase', 50, 'Huntsville', 484462, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Reese Cube AirBase', 82, 'Huntsville', 215016, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Edie Fierstein AirBase', 25, 'Neuquen', 979080, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Teena Hoffman AirBase', 30, 'Zrich', 685187, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Emmylou Kahn AirBase', 29, 'Elkins Park', 974249, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jack Sutherland AirBase', 17, 'Oldham', 503065, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sonny Idol AirBase', 24, 'Ottawa', 802464, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vertical Dillane AirBase', 61, 'Tilst', 744506, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Will Hiatt AirBase', 96, 'Ashdod', 322029, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Donal Donelly AirBase', 15, 'Petach-Tikva', 490895, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ritchie Bullock AirBase', 73, 'Cuiabב', 932474, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cuba Gosdin AirBase', 30, 'Toulouse', 162160, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Zooey Brody AirBase', 97, 'Petach-Tikva', 125823, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jane McGregor AirBase', 84, 'Mobile', 883444, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Burton Scorsese AirBase', 97, 'Fuerth', 178510, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rutger Diaz AirBase', 22, 'Williamstown', 682555, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Seann Garber AirBase', 34, 'Wavre', 790106, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Juliette Secada AirBase', 11, 'Barueri', 746377, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jack Applegate AirBase', 10, 'Ashland', 522456, 18);
commit;
prompt 200 records committed...
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vivica Lynn AirBase', 26, 'Farnham', 932474, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vincent Hannah AirBase', 54, 'Meerbusch', 556565, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Daniel Moody AirBase', 61, 'Boucherville', 984770, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vivica Maguire AirBase', 67, 'Tustin', 293094, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Karen Mantegna AirBase', 74, 'Nancy', 759709, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Marie Peet AirBase', 54, 'Market Harborough', 354587, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nile Rebhorn AirBase', 55, 'Foster City', 507258, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Freddy Folds AirBase', 58, 'Dietikon', 634353, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ron Azaria AirBase', 81, 'New Castle', 278937, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jarvis Navarro AirBase', 71, 'Auckland', 331946, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tilda McLean AirBase', 93, 'Tilst', 999422, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Meryl Hamilton AirBase', 44, 'Rua eteno', 928512, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cate Coe AirBase', 96, 'Brossard', 149395, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Davis Redford AirBase', 35, 'Augsburg', 703584, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jonathan Keith AirBase', 44, 'Akron', 259837, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kate Gere AirBase', 82, 'Bolton', 890326, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Elisabeth Hannah AirBase', 49, 'Olympia', 613055, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Don Madsen AirBase', 16, 'Gainesville', 875354, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rolando Cheadle AirBase', 12, 'Melrose park', 437301, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sydney Palmer AirBase', 82, 'Issaquah', 938387, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Trini Orbit AirBase', 96, 'Hyderabad', 729720, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Freda Stiller AirBase', 11, 'Torino', 553877, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ivan Brothers AirBase', 38, 'Enfield', 875354, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('William Love AirBase', 46, 'Dunn loring', 898640, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Wally Chilton AirBase', 76, 'Canberra', 968263, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Clarence Baez AirBase', 59, 'Deerfield', 521913, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Joy Brooke AirBase', 58, 'Duisburg', 636517, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jennifer Raybon AirBase', 52, 'Fairview Heights', 861867, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Allison Borgnine AirBase', 31, 'Westport', 731069, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Maxine Iglesias AirBase', 73, 'Belgrad', 172711, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rick Burrows AirBase', 64, 'Edison', 692185, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Roscoe Finney AirBase', 78, 'Huntsville', 215016, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gina Murray AirBase', 52, 'Morioka', 739845, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jason Saucedo AirBase', 28, 'Lexington', 964644, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ewan Phifer AirBase', 24, 'Atlanta', 973507, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kieran Reubens AirBase', 18, 'Birmingham', 747366, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rachid Holly AirBase', 19, 'Hartmannsdorf', 801147, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Raul Parm AirBase', 85, 'Whittier', 822879, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ray Newman AirBase', 56, 'Knutsford', 228636, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vienna Reilly AirBase', 28, 'Newcastle upon Tyne', 421122, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rebecca Biel AirBase', 23, 'Burwood East', 168024, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Loretta Cleese AirBase', 29, 'Mayfield Village', 178510, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rik Union AirBase', 24, 'Recife', 319436, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Orlando Hobson AirBase', 27, 'Kungki', 424623, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lea Palin AirBase', 60, 'Reston', 488540, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kieran Levert AirBase', 25, 'Cuiabב', 974249, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nickel Place AirBase', 54, 'St. Petersburg', 377676, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tamala Stone AirBase', 56, 'Saitama', 759709, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ron El-Saher AirBase', 17, 'Utrecht', 101870, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ashley Rock AirBase', 54, 'Changwon-si', 818580, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Luke Rydell AirBase', 24, 'Perth', 377204, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Red Piven AirBase', 33, 'Newbury', 506170, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rachel Mollard AirBase', 33, 'Bracknell', 596565, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jared Coburn AirBase', 38, 'El Paso', 254012, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lee Mueller-Stahl AirBase', 75, 'Eisenhttenstadt', 831637, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Randy DiCaprio AirBase', 28, 'Swannanoa', 875354, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Chaka Apple AirBase', 75, 'Uden', 286915, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kurt Downey AirBase', 96, 'Protvino', 695264, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Bobbi Barkin AirBase', 25, 'Nashua', 692879, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rachael Gertner AirBase', 19, 'Tbilisi', 676765, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Robbie Sewell AirBase', 40, 'Sidney', 172711, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Keith Beatty AirBase', 22, 'Douala', 703584, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Liquid Neville AirBase', 70, 'Pordenone', 422976, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Eugene Oldman AirBase', 72, 'Gהvle', 254012, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rene Jenkins AirBase', 85, 'South Weber', 243880, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Anita Michael AirBase', 40, 'Munich', 957762, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Spencer Pigott-Smith AirBase', 26, 'Budapest', 864706, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Larnelle Hingle AirBase', 47, 'Massagno', 131509, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hector Thompson AirBase', 30, 'Nantes', 922999, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dar Harry AirBase', 58, 'Kaunas', 514057, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Janice Curfman AirBase', 43, 'Marlboro', 289879, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Forest Tolkan AirBase', 61, 'Holderbank', 491028, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Machine Raitt AirBase', 63, 'Cherepovets', 920828, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gene Banderas AirBase', 52, 'Friedrichshafe', 140752, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Holland Teng AirBase', 39, 'Dreieich', 751830, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('April Cage AirBase', 52, 'Tallahassee', 555223, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Charlton Quinn AirBase', 74, 'Karachi', 354587, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Moe MacNeil AirBase', 81, 'Waldorf', 328211, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Diane Getty AirBase', 41, 'Essen', 486859, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Joaquin Irons AirBase', 89, 'Treviso', 810099, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Austin Hersh AirBase', 82, 'Altstהtten', 438590, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Bo Caldwell AirBase', 82, 'Pomona', 319436, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Orlando Herndon AirBase', 57, 'Pretoria', 123594, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Fred Dzundza AirBase', 93, 'Corona', 152270, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lynn Bonham AirBase', 69, 'New hartford', 581742, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Crystal Hoffman AirBase', 19, 'Seatle', 201330, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lara Borgnine AirBase', 40, 'Tilst', 638464, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Leonardo Cale AirBase', 90, 'Vancouver', 787131, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Maura Driver AirBase', 93, 'Ferraz  vasconcelos', 875354, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Remy Northam AirBase', 38, 'Shelton', 236721, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Howard Reubens AirBase', 53, 'San Jose', 722416, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nelly Scheider AirBase', 55, 'Oslo', 313548, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Brendan Osbourne AirBase', 64, 'Encinitas', 676817, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Claude Imperioli AirBase', 43, 'Akron', 245374, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Arnold Weaver AirBase', 10, 'Nynהshamn', 943963, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Julio Bacharach AirBase', 21, 'Ljubljana', 546396, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Toni McCain AirBase', 74, 'Longview', 575873, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Machine Boone AirBase', 86, 'Duisburg', 492956, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Amy Lyonne AirBase', 20, 'Reykjavik', 125823, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Grant Taylor AirBase', 92, 'Ricardson', 278937, 11);
commit;
prompt 300 records committed...
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Willie Berenger AirBase', 41, 'Englewood', 390792, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dustin Barrymore AirBase', 25, 'Lefkosa', 328211, 12);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Pat Lizzy AirBase', 34, 'Chirignago', 926300, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Saffron Short AirBase', 77, 'Mogliano Veneto', 722813, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Coley Gertner AirBase', 91, 'Rancho Palos Verdes', 422149, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Natascha Parm AirBase', 29, 'Maintenon', 234976, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nickel Tennison AirBase', 19, 'Oosterhout', 162160, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Chuck Imperioli AirBase', 66, 'Saint Paul', 563960, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Renee Harry AirBase', 78, 'Valencia', 932771, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Queen Cox AirBase', 53, 'Toronto', 897718, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Armin Day-Lewis AirBase', 91, 'Narrows', 749169, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Busta Rippy AirBase', 77, 'Caracas', 873957, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gin Huston AirBase', 33, 'Orleans', 152270, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cloris Herndon AirBase', 41, 'Zurich', 931670, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Angela Coburn AirBase', 99, 'Copenhagen', 854052, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lynette Sheen AirBase', 52, 'Annandale', 168024, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alice McDormand AirBase', 91, 'Cedar Park', 196139, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jane Bedelia AirBase', 71, 'Bethesda', 107594, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sara Mandrell AirBase', 84, 'Annandale', 964644, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Terrence Gyllenhaal AirBase', 51, 'Herzlia', 957184, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mike Spine AirBase', 46, 'Pordenone', 744506, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kurtwood Strong AirBase', 74, 'Aomori', 751830, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Toshiro Perrineau AirBase', 84, 'Holts Summit', 437301, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jonny Curfman AirBase', 42, 'Las Vegas', 652374, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Larenz Mortensen AirBase', 90, 'Storrington', 269211, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Taylor Diehl AirBase', 81, 'New Castle', 670446, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rosanna Tennison AirBase', 99, 'Mt. Laurel', 431223, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rachid Bailey AirBase', 73, 'Bautzen', 259837, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Chad Daniels AirBase', 82, 'Athens', 390261, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Elle Steagall AirBase', 32, 'Giessen', 703584, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vanessa Margolyes AirBase', 26, 'Essen', 638464, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Morgan Pantoliano AirBase', 82, 'Kingston', 427651, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Saffron Boorem AirBase', 60, 'Guadalajara', 922999, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jose Spears AirBase', 32, 'O''fallon', 287223, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Charlie Mandrell AirBase', 84, 'Bielefeld', 327322, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jared Wills AirBase', 82, 'San Diego', 359300, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lea Crow AirBase', 33, 'Lyon', 178510, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Kyle Eldard AirBase', 12, 'London', 522456, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sigourney Tyler AirBase', 86, 'Fort Collins', 268172, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Terry Haysbert AirBase', 53, 'Johannesburg', 460338, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lizzy Puckett AirBase', 75, 'Erlangen', 171944, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Olga Burke AirBase', 98, 'Denver', 781563, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Stephen Brody AirBase', 83, 'Pretoria', 773082, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Solomon Snider AirBase', 80, 'Bad Oeynhausen', 682264, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Collin Cheadle AirBase', 47, 'Brentwood', 578893, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nina Lewis AirBase', 51, 'Verdun', 371388, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rob Morales AirBase', 37, 'Bismarck', 838171, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Pelvic Hirsch AirBase', 22, 'Huntington', 907027, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Embeth Tyson AirBase', 72, 'Monterey', 627416, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sam Dooley AirBase', 98, 'La Plata', 685187, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Donald Buffalo AirBase', 91, 'Di Savigliano', 574359, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dabney Meyer AirBase', 73, 'Erlangen', 256841, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Radney Breslin AirBase', 91, 'Rocklin', 901691, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Daryle Molina AirBase', 76, 'Colombes', 318402, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Hope Redford AirBase', 97, 'Green bay', 606843, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gaby Rhodes AirBase', 13, 'San Jose', 801147, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Debby Craddock AirBase', 63, 'Rockville', 715116, 10);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Nanci Kretschmann AirBase', 64, 'Lbeck', 887415, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dustin Worrell AirBase', 42, 'Derwood', 387754, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Aaron Peebles AirBase', 75, 'Pretoria', 997306, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Patrick Palmer AirBase', 16, 'Derwood', 456482, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ethan Weller AirBase', 89, 'Sendai', 387450, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sean Davis AirBase', 28, 'Zuerich', 231822, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tyrone Swinton AirBase', 50, 'Waite Park', 664305, 3);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lance Hart AirBase', 75, 'Avon', 855726, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jim Michael AirBase', 15, 'Coppell', 606843, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Uma Cumming AirBase', 95, 'Richardson', 180565, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Colm Cruz AirBase', 57, 'Bradenton', 744506, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Brendan Rankin AirBase', 24, 'Gifu', 907027, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Leonardo Diddley AirBase', 90, 'Ithaca', 709124, 15);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Karon Coyote AirBase', 66, 'Oldwick', 331645, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jill Holbrook AirBase', 92, 'Birmingham', 788882, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rhona Dushku AirBase', 11, 'Valladolid', 757831, 13);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Peabo O''Hara AirBase', 71, 'Ellicott City', 808544, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Avril Hingle AirBase', 75, 'Lexington', 977096, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Maureen Robards AirBase', 78, 'Uden', 394003, 2);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ashley Plimpton AirBase', 43, 'Bangalore', 556927, 14);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alex Oakenfold AirBase', 50, 'Sainte-foy', 581742, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Derrick Duchovny AirBase', 54, 'South Hadley', 838171, 7);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Crystal Dorn AirBase', 90, 'Maidstone', 268172, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Trick Fariq AirBase', 32, 'Austin', 162160, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Mekhi Winstone AirBase', 90, 'Plymouth Meeting', 107594, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Vonda Cronin AirBase', 92, 'Wien', 931670, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tony Robinson AirBase', 59, 'Shawnee', 357617, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Tori Sewell AirBase', 99, 'Naha', 618384, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Helen De Niro AirBase', 93, 'Antwerpen', 122065, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Beverley Eldard AirBase', 81, 'Sendai', 424623, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Elizabeth Patrick AirBase', 54, 'Redondo beach', 672576, 19);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Jena Loring AirBase', 65, 'Buenos Aires', 286915, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Goldie Weaver AirBase', 52, 'Ebersdorf', 731069, 16);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Gilberto Duvall AirBase', 65, 'Cape town', 282107, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Katie Macht AirBase', 86, 'St. Petersburg', 328211, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Naomi Luongo AirBase', 16, 'Huntington Beach', 773082, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Harriet Paxton AirBase', 38, 'Bretzfeld-Waldbach', 427524, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Faye McDowell AirBase', 57, 'Buenos Aires', 879378, 18);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Dennis Thornton AirBase', 26, 'Juneau', 565162, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Alfie Sayer AirBase', 21, 'Alessandria', 719852, 5);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Sean Hawke AirBase', 69, 'Fort Collins', 928512, 1);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Cheech Baez AirBase', 40, 'Vaduz', 692185, 9);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Amanda Puckett AirBase', 37, 'Burwood East', 322029, 1);
commit;
prompt 400 records committed...
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Ralph Kleinenberg AirBase', 30, 'Tilburg', 397321, 17);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Samantha Weaver AirBase', 77, 'Kצln', 681248, 4);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Rory Albright AirBase', 30, 'Tampa', 130550, 20);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Joan Salonga AirBase', 90, 'Oxon', 751830, 6);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Embeth Holden AirBase', 80, 'Dartmouth', 960954, 8);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Lionel Kramer AirBase', 36, 'Gifu', 945503, 11);
insert into AIRBASE (name, capacity, location, squadron_number, runway_number)
values ('Peabo De Almeida AirBase', 36, 'Carlsbad', 310912, 20);
commit;
prompt 407 records loaded
prompt Loading AIRCRAFT...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (1, to_date('31-08-1963', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (2, to_date('04-03-1990', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (3, to_date('14-01-1981', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (4, to_date('17-05-1996', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (5, to_date('16-12-1964', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (6, to_date('14-05-1963', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (7, to_date('24-09-1993', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (8, to_date('28-05-1972', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (9, to_date('15-07-1966', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (10, to_date('10-03-2014', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (11, to_date('12-02-1974', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (12, to_date('03-06-1969', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (13, to_date('17-01-1960', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (14, to_date('01-05-2010', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (15, to_date('20-05-2017', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (16, to_date('20-08-2016', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (17, to_date('17-08-1994', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (18, to_date('03-06-1960', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (19, to_date('23-12-1999', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (20, to_date('03-02-1996', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (21, to_date('12-12-2004', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (22, to_date('18-05-1983', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (23, to_date('30-09-1990', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (24, to_date('27-07-1971', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (25, to_date('23-05-2017', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (26, to_date('15-11-2010', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (27, to_date('04-04-2000', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (28, to_date('15-06-1990', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (29, to_date('02-12-1994', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (30, to_date('04-05-1981', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (31, to_date('01-01-1973', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (32, to_date('02-07-2004', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (33, to_date('13-10-1962', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (34, to_date('21-12-1978', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (35, to_date('20-02-1982', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (36, to_date('01-06-1970', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (37, to_date('01-04-1992', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (38, to_date('09-02-1966', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (39, to_date('05-07-2001', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (40, to_date('06-03-1966', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (41, to_date('18-07-1994', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (42, to_date('07-07-1972', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (43, to_date('21-07-1964', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (44, to_date('07-02-1994', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (45, to_date('12-03-2012', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (46, to_date('06-12-1999', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (47, to_date('19-11-1994', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (48, to_date('05-07-1996', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (49, to_date('22-12-1969', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (50, to_date('06-05-1995', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (51, to_date('21-02-1988', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (52, to_date('20-12-1964', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (53, to_date('11-08-1962', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (54, to_date('19-06-1961', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (55, to_date('07-11-2019', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (56, to_date('30-01-1979', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (57, to_date('16-06-2011', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (58, to_date('09-10-1987', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (59, to_date('21-12-2008', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (60, to_date('02-09-1965', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (61, to_date('04-05-1977', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (62, to_date('08-08-2000', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (63, to_date('23-10-1961', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (64, to_date('24-05-2004', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (65, to_date('21-09-1971', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (66, to_date('06-10-2005', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (67, to_date('30-12-1975', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (68, to_date('02-09-1980', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (69, to_date('24-05-2003', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (70, to_date('31-12-1991', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (71, to_date('12-03-1979', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (72, to_date('08-11-1981', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (73, to_date('20-11-2012', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (74, to_date('13-11-1998', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (75, to_date('05-04-1972', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (76, to_date('17-08-1967', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (77, to_date('23-10-1961', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (78, to_date('21-05-1967', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (79, to_date('12-07-2001', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (80, to_date('05-07-1960', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (81, to_date('23-03-2019', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (82, to_date('24-11-1966', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (83, to_date('14-11-1999', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (84, to_date('25-06-1977', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (85, to_date('04-05-2002', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (86, to_date('20-08-1966', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (87, to_date('18-04-2011', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (88, to_date('22-07-2018', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (89, to_date('01-09-2003', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (90, to_date('11-05-2015', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (91, to_date('11-09-2008', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (92, to_date('10-05-1963', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (93, to_date('24-10-2011', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (94, to_date('22-07-1967', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (95, to_date('30-06-1969', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (96, to_date('22-07-1961', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (97, to_date('11-02-2008', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (98, to_date('14-08-2009', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (99, to_date('31-10-1988', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (100, to_date('23-02-1998', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
commit;
prompt 100 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (101, to_date('23-04-1996', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (102, to_date('11-06-2014', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (103, to_date('01-01-1985', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (104, to_date('19-06-1969', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (105, to_date('04-06-1977', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (106, to_date('11-11-1967', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (107, to_date('29-10-2006', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (108, to_date('29-11-2000', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (109, to_date('17-01-2017', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (110, to_date('27-05-2005', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (111, to_date('22-08-2007', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (112, to_date('04-05-1972', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (113, to_date('18-03-1967', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (114, to_date('29-09-1992', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (115, to_date('11-08-2005', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (116, to_date('21-12-1991', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (117, to_date('13-01-1980', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (118, to_date('19-05-1978', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (119, to_date('05-01-2005', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (120, to_date('08-11-1974', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (121, to_date('08-05-1965', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (122, to_date('01-11-1981', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (123, to_date('26-03-1968', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (124, to_date('10-10-1976', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (125, to_date('19-06-1999', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (126, to_date('26-12-1995', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (127, to_date('07-02-1963', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (128, to_date('11-07-2009', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (129, to_date('08-04-1987', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (130, to_date('17-10-2016', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (131, to_date('27-04-1965', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (132, to_date('15-07-1998', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (133, to_date('13-11-2014', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (134, to_date('13-01-1989', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (135, to_date('08-08-2010', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (136, to_date('21-09-2018', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (137, to_date('12-12-1964', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (138, to_date('21-04-1991', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (139, to_date('10-04-1966', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (140, to_date('31-07-1999', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (141, to_date('03-01-1982', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (142, to_date('13-11-1978', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (143, to_date('28-12-2006', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (144, to_date('20-05-1965', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (145, to_date('19-09-1969', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (146, to_date('26-09-1977', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (147, to_date('30-03-2014', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (148, to_date('22-06-1971', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (149, to_date('13-07-1977', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (150, to_date('22-05-2018', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (151, to_date('21-05-1974', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (152, to_date('17-07-1992', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (153, to_date('08-10-1988', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (154, to_date('10-08-2012', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (155, to_date('31-10-1984', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (156, to_date('20-11-1973', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (157, to_date('13-05-1977', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (158, to_date('18-11-1971', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (159, to_date('13-02-1993', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (160, to_date('16-07-1971', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (161, to_date('07-06-1975', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (162, to_date('26-09-1960', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (163, to_date('22-07-2008', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (164, to_date('18-03-1962', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (165, to_date('13-11-1968', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (166, to_date('22-07-1973', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (167, to_date('29-01-1981', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (168, to_date('10-01-1999', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (169, to_date('10-03-1993', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (170, to_date('07-03-1998', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (171, to_date('25-01-1997', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (172, to_date('04-12-1963', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (173, to_date('22-09-1976', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (174, to_date('10-11-2004', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (175, to_date('12-10-2016', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (176, to_date('19-09-1982', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (177, to_date('17-06-1973', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (178, to_date('29-11-1973', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (179, to_date('04-02-2013', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (180, to_date('18-09-2003', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (181, to_date('06-08-2002', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (182, to_date('15-07-1970', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (183, to_date('24-03-2006', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (184, to_date('11-11-1995', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (185, to_date('15-02-1987', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (186, to_date('06-04-1990', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (187, to_date('03-03-1984', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (188, to_date('03-05-2017', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (189, to_date('09-07-1998', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (190, to_date('31-05-1973', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (191, to_date('21-06-2013', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (192, to_date('03-07-1960', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (193, to_date('16-10-2009', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (194, to_date('29-01-1982', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (195, to_date('02-02-1960', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (196, to_date('29-03-1994', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (197, to_date('20-01-1994', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (198, to_date('21-12-2007', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (199, to_date('21-12-1994', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (200, to_date('21-06-1979', 'dd-mm-yyyy'), 'Empty', 'F-15');
commit;
prompt 200 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (201, to_date('25-10-1960', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (202, to_date('03-09-1974', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (203, to_date('08-02-2014', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (204, to_date('07-12-1988', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (205, to_date('06-03-2017', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (206, to_date('25-08-1972', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (207, to_date('28-08-2017', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (208, to_date('04-02-1997', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (209, to_date('03-02-2016', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (210, to_date('01-07-2000', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (211, to_date('03-12-1967', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (212, to_date('05-02-2001', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (213, to_date('10-12-1988', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (214, to_date('19-11-2000', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (215, to_date('14-10-2000', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (216, to_date('30-09-1988', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (217, to_date('22-07-1994', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (218, to_date('25-07-1974', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (219, to_date('14-05-1960', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (220, to_date('14-06-1964', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (221, to_date('15-11-2011', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (222, to_date('10-12-1970', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (223, to_date('08-07-2001', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (224, to_date('14-01-2019', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (225, to_date('20-06-1978', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (226, to_date('20-08-2008', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (227, to_date('20-11-1999', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (228, to_date('19-05-1964', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (229, to_date('05-02-1972', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (230, to_date('10-06-1994', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (231, to_date('30-03-1964', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (232, to_date('29-10-1988', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (233, to_date('10-06-2007', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (234, to_date('25-02-1964', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (235, to_date('22-09-2000', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (236, to_date('15-04-1964', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (237, to_date('10-04-2015', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (238, to_date('06-09-1963', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (239, to_date('11-09-2013', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (240, to_date('23-12-1970', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (241, to_date('16-03-1986', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (242, to_date('27-11-1983', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (243, to_date('03-12-2002', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (244, to_date('22-09-2000', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (245, to_date('19-03-1976', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (246, to_date('07-09-2017', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (247, to_date('03-10-1971', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (248, to_date('27-10-1994', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (249, to_date('18-02-1986', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (250, to_date('24-06-1962', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (251, to_date('25-12-1975', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (252, to_date('04-04-2007', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (253, to_date('19-04-1982', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (254, to_date('05-01-2007', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (255, to_date('20-01-2018', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (256, to_date('04-06-1999', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (257, to_date('10-07-1980', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (258, to_date('03-06-1995', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (259, to_date('15-05-1986', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (260, to_date('25-01-1987', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (261, to_date('13-08-2010', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (262, to_date('22-04-1997', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (263, to_date('24-04-1974', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (264, to_date('26-07-2015', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (265, to_date('09-08-1973', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (266, to_date('02-03-2007', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (267, to_date('15-09-2008', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (268, to_date('06-05-1994', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (269, to_date('11-11-2018', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (270, to_date('07-08-2011', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (271, to_date('31-05-1972', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (272, to_date('27-06-1976', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (273, to_date('30-04-1983', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (274, to_date('27-09-1997', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (275, to_date('23-09-1980', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (276, to_date('19-05-1984', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (277, to_date('29-12-1989', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (278, to_date('17-05-1971', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (279, to_date('04-04-1986', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (280, to_date('21-05-1997', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (281, to_date('16-11-1997', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (282, to_date('26-02-2008', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (283, to_date('02-01-1982', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (284, to_date('15-06-2012', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (285, to_date('15-08-2010', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (286, to_date('11-05-2016', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (287, to_date('27-04-1967', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (288, to_date('23-08-1983', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (289, to_date('14-12-1965', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (290, to_date('15-08-1984', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (291, to_date('23-05-1996', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (292, to_date('08-06-2001', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (293, to_date('28-02-1963', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (294, to_date('05-02-2003', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (295, to_date('06-01-1984', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (296, to_date('01-11-2007', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (297, to_date('15-10-2000', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (298, to_date('17-06-1961', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (299, to_date('03-04-1978', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (300, to_date('26-02-1978', 'dd-mm-yyyy'), 'Bombs', 'F-35');
commit;
prompt 300 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (301, to_date('25-09-1971', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (302, to_date('25-03-1982', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (303, to_date('08-10-2004', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (304, to_date('17-06-2015', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (305, to_date('04-12-2017', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (306, to_date('13-10-1962', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (307, to_date('31-05-1982', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (308, to_date('15-07-1998', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (309, to_date('20-10-1981', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (310, to_date('28-07-1974', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (311, to_date('08-11-1984', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (312, to_date('11-06-1999', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (313, to_date('25-09-2006', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (314, to_date('04-12-1982', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (315, to_date('12-11-1997', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (316, to_date('10-06-2001', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (317, to_date('05-08-1973', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (318, to_date('26-11-2005', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (319, to_date('25-12-2016', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (320, to_date('14-05-1983', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (321, to_date('11-09-1975', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (322, to_date('18-08-1985', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (323, to_date('30-03-1965', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (324, to_date('18-04-2011', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (325, to_date('23-03-1969', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (326, to_date('13-07-1980', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (327, to_date('21-08-2005', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (328, to_date('22-06-1993', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (329, to_date('01-06-1991', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (330, to_date('18-12-1981', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (331, to_date('09-01-1978', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (332, to_date('17-06-1969', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (333, to_date('09-08-2013', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (334, to_date('03-08-1993', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (335, to_date('24-02-2005', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (336, to_date('26-05-2019', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (337, to_date('27-05-2011', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (338, to_date('07-01-2007', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (339, to_date('27-06-2007', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (340, to_date('09-05-1974', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (341, to_date('06-02-2009', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (342, to_date('04-02-2002', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (343, to_date('22-07-1961', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (344, to_date('02-09-1963', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (345, to_date('05-08-1990', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (346, to_date('26-04-1995', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (347, to_date('09-06-1991', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (348, to_date('18-04-1970', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (349, to_date('29-11-2003', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (350, to_date('03-10-1994', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (351, to_date('01-03-1998', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (352, to_date('12-12-1999', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (353, to_date('14-08-1961', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (354, to_date('03-01-1975', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (355, to_date('26-08-1986', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (356, to_date('24-02-1965', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (357, to_date('25-03-1974', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (358, to_date('08-07-2000', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (359, to_date('24-11-1984', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (360, to_date('04-01-1960', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (361, to_date('02-11-1968', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (362, to_date('16-10-1980', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (363, to_date('05-02-1965', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (364, to_date('06-09-1996', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (365, to_date('23-02-2000', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (366, to_date('18-11-1995', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (367, to_date('22-05-2011', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (368, to_date('04-07-1969', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (369, to_date('06-02-1976', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (370, to_date('09-08-1985', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (371, to_date('23-11-1973', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (372, to_date('03-09-1967', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (373, to_date('14-04-1995', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (374, to_date('10-12-2010', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (375, to_date('17-10-1963', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (376, to_date('10-06-1992', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (377, to_date('12-04-1988', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (378, to_date('13-01-1971', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (379, to_date('09-01-1999', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (380, to_date('14-10-2009', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (381, to_date('14-03-2010', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (382, to_date('17-03-2014', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (383, to_date('27-05-2005', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (384, to_date('05-06-1964', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (385, to_date('15-07-1966', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (386, to_date('07-07-2016', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (387, to_date('12-10-2012', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (388, to_date('12-03-1996', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (389, to_date('18-07-1969', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (390, to_date('24-02-1996', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (391, to_date('16-12-1980', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (392, to_date('28-08-1974', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (393, to_date('09-05-2017', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (394, to_date('02-04-1987', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (395, to_date('02-01-1965', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (396, to_date('08-12-2002', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (397, to_date('14-12-1982', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (398, to_date('29-06-2011', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (399, to_date('30-09-1964', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (400, to_date('31-08-2016', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
commit;
prompt 400 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (401, to_date('20-04-2015', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (402, to_date('22-11-1960', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (403, to_date('09-01-2018', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (404, to_date('13-01-1979', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (405, to_date('06-09-1969', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (406, to_date('19-04-2000', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (407, to_date('12-06-1972', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (408, to_date('26-10-1967', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (409, to_date('23-07-1979', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (410, to_date('23-12-2012', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (411, to_date('14-05-2005', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (412, to_date('17-05-2005', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (413, to_date('11-01-1977', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (414, to_date('01-10-1987', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (415, to_date('08-09-1976', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (416, to_date('15-07-1977', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (417, to_date('12-03-2004', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (418, to_date('04-02-1961', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (419, to_date('28-03-1974', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (420, to_date('22-04-2002', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (421, to_date('21-06-1992', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (422, to_date('13-09-2002', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (423, to_date('30-05-1986', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (424, to_date('26-04-2004', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (425, to_date('11-03-1982', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (426, to_date('30-10-1967', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (427, to_date('16-09-2011', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (428, to_date('07-01-1966', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (429, to_date('23-07-1969', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (430, to_date('02-01-2015', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (431, to_date('09-12-2009', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (432, to_date('15-06-2001', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (433, to_date('19-03-1963', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (434, to_date('05-06-1962', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (435, to_date('10-09-2014', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (436, to_date('29-08-2013', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (437, to_date('28-07-2007', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (438, to_date('17-07-2011', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (439, to_date('30-10-1961', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (440, to_date('16-07-1971', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (441, to_date('15-02-2005', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (442, to_date('27-03-1981', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (443, to_date('27-08-2003', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (444, to_date('14-03-1997', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (445, to_date('27-11-1964', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (446, to_date('18-01-1971', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (447, to_date('11-06-1993', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (448, to_date('11-09-2009', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (449, to_date('12-04-1999', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (450, to_date('19-11-1986', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (451, to_date('22-01-1960', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (452, to_date('18-01-2006', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (453, to_date('01-04-2006', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (454, to_date('25-08-1977', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (455, to_date('15-04-1987', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (456, to_date('02-08-1975', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (457, to_date('11-07-2009', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (458, to_date('17-03-2006', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (459, to_date('09-08-1967', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (460, to_date('03-06-2018', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (461, to_date('11-06-1983', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (462, to_date('06-03-1993', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (463, to_date('06-02-2015', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (464, to_date('18-02-1994', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (465, to_date('30-12-1984', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (466, to_date('04-12-1986', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (467, to_date('28-02-1997', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (468, to_date('17-06-1961', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (469, to_date('26-02-1990', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (470, to_date('25-03-2008', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (471, to_date('11-09-2019', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (472, to_date('15-01-1985', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (473, to_date('16-08-1986', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (474, to_date('28-01-1973', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (475, to_date('30-06-1995', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (476, to_date('05-02-2000', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (477, to_date('10-04-1990', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (478, to_date('18-12-1971', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (479, to_date('12-07-1980', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (480, to_date('02-01-1961', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (481, to_date('30-05-1967', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (482, to_date('14-03-1999', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (483, to_date('22-09-1977', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (484, to_date('05-09-1974', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (485, to_date('20-01-1960', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (486, to_date('22-08-1980', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (487, to_date('22-01-1963', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (488, to_date('23-09-2014', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (489, to_date('17-06-2006', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (490, to_date('03-04-2003', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (491, to_date('14-07-2003', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (492, to_date('26-04-1967', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (493, to_date('05-01-2004', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (494, to_date('20-12-2004', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (495, to_date('23-10-1991', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (496, to_date('25-08-1994', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (497, to_date('28-09-1976', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (498, to_date('22-04-1998', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (499, to_date('16-02-1977', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (500, to_date('11-01-2017', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
commit;
prompt 500 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (501, to_date('01-08-1964', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (502, to_date('13-02-1996', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (503, to_date('24-03-1987', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (504, to_date('11-06-2009', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (505, to_date('17-08-1966', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (506, to_date('19-12-1962', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (507, to_date('14-12-1990', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (508, to_date('02-08-2003', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (509, to_date('06-07-1965', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (510, to_date('16-07-2010', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (511, to_date('30-03-2006', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (512, to_date('05-04-1961', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (513, to_date('24-02-2015', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (514, to_date('19-07-1990', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (515, to_date('24-02-2013', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (516, to_date('18-02-2000', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (517, to_date('01-01-1969', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (518, to_date('12-07-1993', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (519, to_date('19-08-2006', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (520, to_date('19-09-1967', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (521, to_date('13-01-2001', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (522, to_date('07-01-1977', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (523, to_date('08-10-1998', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (524, to_date('28-07-2014', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (525, to_date('15-08-1966', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (526, to_date('08-07-2001', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (527, to_date('02-02-1975', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (528, to_date('21-08-1992', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (529, to_date('23-06-1985', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (530, to_date('03-09-1987', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (531, to_date('22-09-2004', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (532, to_date('27-08-2019', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (533, to_date('09-12-1963', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (534, to_date('20-02-1963', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (535, to_date('20-01-1999', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (536, to_date('22-07-2005', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (537, to_date('25-08-1988', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (538, to_date('19-07-1982', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (539, to_date('08-07-2008', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (540, to_date('13-11-1971', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (541, to_date('08-12-1998', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (542, to_date('06-01-1999', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (543, to_date('28-04-1982', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (544, to_date('09-12-2009', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (545, to_date('31-12-1979', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (546, to_date('16-08-1980', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (547, to_date('08-09-1970', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (548, to_date('16-01-1999', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (549, to_date('22-02-2014', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (550, to_date('03-05-1980', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (551, to_date('10-05-1964', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (552, to_date('14-03-2000', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (553, to_date('29-03-1962', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (554, to_date('01-10-2002', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (555, to_date('08-01-1961', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (556, to_date('23-09-1976', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (557, to_date('20-07-2002', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (558, to_date('24-02-2006', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (559, to_date('22-05-1963', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (560, to_date('05-06-1967', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (561, to_date('02-03-1969', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (562, to_date('22-04-1973', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (563, to_date('11-07-1988', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (564, to_date('21-04-1993', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (565, to_date('30-03-2007', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (566, to_date('01-06-1999', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (567, to_date('30-03-2003', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (568, to_date('14-11-2013', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (569, to_date('21-02-1977', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (570, to_date('28-08-2000', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (571, to_date('15-02-2015', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (572, to_date('03-11-1963', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (573, to_date('21-10-1974', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (574, to_date('22-10-1981', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (575, to_date('10-12-1963', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (576, to_date('18-03-1976', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (577, to_date('21-05-1970', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (578, to_date('24-04-2016', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (579, to_date('16-02-1973', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (580, to_date('21-09-2012', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (581, to_date('22-06-2002', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (582, to_date('16-04-2007', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (583, to_date('05-01-1976', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (584, to_date('09-07-1997', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (585, to_date('29-12-1979', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (586, to_date('14-11-1972', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (587, to_date('12-06-1966', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (588, to_date('13-01-2005', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (589, to_date('11-01-2019', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (590, to_date('20-05-1994', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (591, to_date('07-08-1978', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (592, to_date('08-01-2008', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (593, to_date('20-09-1976', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (594, to_date('09-09-2000', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (595, to_date('16-07-1995', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (596, to_date('22-08-1966', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (597, to_date('14-06-1979', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (598, to_date('06-04-1997', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (599, to_date('17-04-2001', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (600, to_date('30-07-1974', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
commit;
prompt 600 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (601, to_date('29-06-1977', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (602, to_date('27-04-1983', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (603, to_date('19-02-1986', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (604, to_date('30-01-2013', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (605, to_date('22-04-1973', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (606, to_date('13-07-2015', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (607, to_date('15-09-1969', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (608, to_date('06-12-2018', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (609, to_date('07-09-2005', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (610, to_date('07-09-1991', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (611, to_date('13-09-2001', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (612, to_date('07-03-1967', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (613, to_date('29-11-2006', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (614, to_date('13-10-2002', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (615, to_date('25-10-1994', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (616, to_date('13-09-1984', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (617, to_date('23-02-1965', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (618, to_date('01-01-2017', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (619, to_date('17-08-1979', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (620, to_date('30-05-1985', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (621, to_date('20-03-1999', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (622, to_date('01-12-2013', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (623, to_date('21-01-2006', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (624, to_date('14-02-2013', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (625, to_date('22-12-1967', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (626, to_date('26-06-1962', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (627, to_date('18-03-2011', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (628, to_date('05-01-1973', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (629, to_date('18-06-1991', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (630, to_date('07-03-2011', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (631, to_date('22-02-1988', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (632, to_date('17-07-1967', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (633, to_date('10-01-1976', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (634, to_date('29-09-2013', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (635, to_date('13-05-1965', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (636, to_date('13-11-2007', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (637, to_date('30-07-1970', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (638, to_date('22-12-1988', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (639, to_date('01-09-1981', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (640, to_date('22-08-1986', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (641, to_date('17-03-2016', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (642, to_date('28-12-2007', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (643, to_date('25-01-2016', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (644, to_date('06-02-1973', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (645, to_date('30-04-1966', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (646, to_date('02-06-1997', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (647, to_date('07-06-1967', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (648, to_date('18-06-2006', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (649, to_date('01-07-2009', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (650, to_date('12-12-1961', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (651, to_date('02-08-1973', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (652, to_date('20-06-2018', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (653, to_date('18-03-2002', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (654, to_date('23-08-2004', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (655, to_date('11-07-1994', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (656, to_date('14-02-1991', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (657, to_date('15-09-1993', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (658, to_date('17-07-2018', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (659, to_date('05-06-1999', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (660, to_date('15-06-1990', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (661, to_date('09-02-1960', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (662, to_date('08-11-2017', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (663, to_date('03-03-2012', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (664, to_date('26-04-1972', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (665, to_date('02-01-1960', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (666, to_date('30-04-1992', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (667, to_date('18-01-2005', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (668, to_date('24-02-1991', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (669, to_date('06-09-2018', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (670, to_date('16-02-1983', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (671, to_date('25-04-2005', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (672, to_date('27-07-2017', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (673, to_date('16-03-1963', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (674, to_date('05-09-2013', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (675, to_date('03-05-2014', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (676, to_date('12-11-1965', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (677, to_date('10-07-1985', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (678, to_date('23-12-2003', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (679, to_date('13-12-2013', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (680, to_date('14-03-2007', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (681, to_date('12-10-1965', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (682, to_date('11-09-1991', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (683, to_date('16-10-1989', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (684, to_date('05-07-1999', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (685, to_date('19-01-1983', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (686, to_date('22-08-1978', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (687, to_date('16-03-1976', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (688, to_date('01-02-2000', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (689, to_date('20-08-2015', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (690, to_date('24-11-1995', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (691, to_date('04-07-1962', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (692, to_date('07-09-2001', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (693, to_date('29-02-1968', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (694, to_date('28-02-1976', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (695, to_date('11-03-1995', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (696, to_date('28-02-1988', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (697, to_date('18-08-1977', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (698, to_date('29-08-1996', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (699, to_date('15-11-1985', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (700, to_date('27-07-1980', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
commit;
prompt 700 records committed...
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (701, to_date('16-08-2005', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (702, to_date('28-02-1971', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (703, to_date('27-07-2009', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (704, to_date('20-08-1999', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (705, to_date('09-11-2018', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (706, to_date('20-05-1984', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (707, to_date('16-01-1973', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (708, to_date('16-07-2005', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (709, to_date('28-03-1975', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (710, to_date('02-06-2017', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (711, to_date('27-11-2007', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (712, to_date('01-01-2011', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (713, to_date('30-08-1987', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (714, to_date('05-06-1987', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (715, to_date('20-02-2018', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (716, to_date('10-07-1978', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (717, to_date('16-09-1972', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (718, to_date('04-03-1960', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (719, to_date('29-09-2006', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (720, to_date('12-10-1967', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (721, to_date('01-06-1966', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (722, to_date('12-10-1988', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (723, to_date('18-03-2001', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (724, to_date('11-02-1994', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (725, to_date('30-04-1964', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (726, to_date('27-02-2007', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (727, to_date('13-06-1972', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (728, to_date('30-12-1973', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (729, to_date('15-01-2018', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (730, to_date('06-07-1981', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (731, to_date('14-12-1976', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (732, to_date('19-06-1968', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (733, to_date('09-05-2015', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (734, to_date('06-06-1998', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (735, to_date('16-10-1986', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (736, to_date('11-06-1990', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (737, to_date('15-04-1966', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (738, to_date('04-12-1982', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (739, to_date('03-03-1967', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (740, to_date('16-11-1976', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (741, to_date('23-02-2012', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (742, to_date('28-11-2014', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (743, to_date('08-04-1996', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (744, to_date('26-08-2001', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (745, to_date('30-09-1989', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (746, to_date('06-07-2007', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (747, to_date('19-12-1996', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (748, to_date('06-03-1980', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (749, to_date('05-02-2018', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (750, to_date('10-09-1985', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (751, to_date('22-03-1985', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (752, to_date('26-08-1991', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (753, to_date('20-08-1989', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (754, to_date('09-08-1998', 'dd-mm-yyyy'), 'Misssiles', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (755, to_date('26-09-2014', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (756, to_date('05-11-2019', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (757, to_date('05-04-2003', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (758, to_date('05-02-1974', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (759, to_date('22-08-1972', 'dd-mm-yyyy'), 'Empty', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (760, to_date('13-06-1968', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (761, to_date('25-04-2011', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (762, to_date('03-11-2018', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (763, to_date('07-11-1995', 'dd-mm-yyyy'), 'Bombs', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (764, to_date('08-11-1981', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (765, to_date('28-09-1967', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (766, to_date('26-06-2002', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (767, to_date('10-10-2012', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (768, to_date('14-04-1977', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (769, to_date('23-07-1979', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (770, to_date('23-04-1979', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (771, to_date('16-02-1990', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (772, to_date('27-04-2009', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (773, to_date('13-11-1978', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (774, to_date('15-10-2015', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (775, to_date('12-06-2019', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (776, to_date('11-08-1982', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (777, to_date('02-08-2007', 'dd-mm-yyyy'), 'Misssiles', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (778, to_date('01-07-1987', 'dd-mm-yyyy'), 'Empty', 'F-35');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (779, to_date('19-01-1993', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (780, to_date('06-11-2003', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (781, to_date('25-01-2002', 'dd-mm-yyyy'), 'Misssiles', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (782, to_date('03-11-1983', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (783, to_date('24-02-2014', 'dd-mm-yyyy'), 'Empty', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (784, to_date('02-11-1978', 'dd-mm-yyyy'), 'Empty', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (785, to_date('30-10-2019', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (786, to_date('21-12-1993', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (787, to_date('19-09-2000', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (788, to_date('28-08-2015', 'dd-mm-yyyy'), 'Misssiles', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (789, to_date('14-07-2005', 'dd-mm-yyyy'), 'Bombs', 'DJI-Mossad');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (790, to_date('03-06-1962', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (791, to_date('22-11-2017', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (792, to_date('29-10-1969', 'dd-mm-yyyy'), 'Empty', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (793, to_date('17-06-2008', 'dd-mm-yyyy'), 'Bombs', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (794, to_date('18-10-1997', 'dd-mm-yyyy'), 'Misssiles', 'B2');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (795, to_date('21-07-2008', 'dd-mm-yyyy'), 'Empty', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (796, to_date('10-06-1962', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (797, to_date('11-08-1978', 'dd-mm-yyyy'), 'Bombs', 'EX1-120');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (798, to_date('20-01-1993', 'dd-mm-yyyy'), 'Misssiles', 'Pigeon');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (799, to_date('06-10-2006', 'dd-mm-yyyy'), 'Bombs', 'F-15');
insert into AIRCRAFT (serialid, production_date, ammunitiontype, model)
values (800, to_date('21-02-1997', 'dd-mm-yyyy'), 'Bombs', 'Pigeon');
commit;
prompt 800 records loaded
prompt Loading AIRPLANE...
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (1, 74, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (2, 39, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (3, 33, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (4, 37, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (5, 66, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (6, 58, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (7, 8, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (8, 14, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (9, 52, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (10, 59, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (11, 23, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (12, 13, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (13, 79, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (14, 73, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (15, 6, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (16, 6, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (17, 32, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (18, 14, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (19, 77, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (20, 30, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (21, 39, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (22, 82, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (23, 83, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (24, 44, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (25, 72, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (26, 16, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (27, 79, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (28, 28, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (29, 29, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (30, 1, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (31, 100, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (32, 77, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (33, 60, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (34, 11, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (35, 90, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (36, 53, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (37, 5, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (38, 38, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (39, 16, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (40, 0, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (41, 93, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (42, 57, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (43, 63, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (44, 34, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (45, 98, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (46, 24, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (47, 76, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (48, 46, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (49, 59, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (50, 90, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (51, 39, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (52, 16, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (53, 25, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (54, 82, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (55, 62, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (56, 6, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (57, 48, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (58, 12, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (59, 29, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (60, 56, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (61, 59, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (62, 78, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (63, 46, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (64, 40, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (65, 3, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (66, 82, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (67, 70, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (68, 56, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (69, 4, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (70, 92, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (71, 13, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (72, 14, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (73, 93, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (74, 3, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (75, 67, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (76, 82, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (77, 16, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (78, 89, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (79, 68, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (80, 8, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (81, 19, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (82, 32, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (83, 15, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (84, 8, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (85, 53, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (86, 100, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (87, 17, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (88, 86, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (89, 61, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (90, 80, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (91, 3, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (92, 43, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (93, 51, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (94, 2, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (95, 50, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (96, 100, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (97, 39, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (98, 25, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (99, 100, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (100, 95, 9, 'T');
commit;
prompt 100 records committed...
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (101, 40, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (102, 21, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (103, 76, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (104, 78, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (105, 24, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (106, 42, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (107, 13, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (108, 99, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (109, 83, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (110, 17, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (111, 64, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (112, 45, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (113, 62, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (114, 15, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (115, 48, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (116, 2, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (117, 50, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (118, 93, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (119, 54, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (120, 18, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (121, 44, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (122, 81, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (123, 22, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (124, 8, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (125, 24, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (126, 9, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (127, 48, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (128, 42, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (129, 1, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (130, 60, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (131, 89, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (132, 67, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (133, 37, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (134, 95, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (135, 87, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (136, 92, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (137, 31, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (138, 4, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (139, 14, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (140, 26, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (141, 37, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (142, 72, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (143, 8, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (144, 30, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (145, 54, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (146, 49, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (147, 63, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (148, 49, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (149, 87, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (150, 87, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (151, 84, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (152, 18, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (153, 1, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (154, 69, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (155, 38, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (156, 71, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (157, 92, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (158, 42, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (159, 35, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (160, 81, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (161, 42, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (162, 40, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (163, 28, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (164, 22, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (165, 66, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (166, 40, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (167, 38, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (168, 34, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (169, 29, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (170, 12, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (171, 13, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (172, 10, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (173, 18, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (174, 32, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (175, 0, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (176, 68, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (177, 84, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (178, 84, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (179, 69, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (180, 49, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (181, 82, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (182, 68, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (183, 28, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (184, 76, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (185, 7, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (186, 84, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (187, 37, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (188, 48, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (189, 65, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (190, 61, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (191, 67, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (192, 57, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (193, 35, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (194, 60, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (195, 95, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (196, 64, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (197, 40, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (198, 54, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (199, 28, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (200, 58, 10, 'T');
commit;
prompt 200 records committed...
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (201, 2, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (202, 75, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (203, 88, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (204, 97, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (205, 57, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (206, 88, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (207, 97, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (208, 85, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (209, 59, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (210, 6, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (211, 56, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (212, 55, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (213, 97, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (214, 88, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (215, 14, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (216, 58, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (217, 8, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (218, 54, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (219, 36, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (220, 64, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (221, 48, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (222, 40, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (223, 54, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (224, 38, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (225, 74, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (226, 53, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (227, 45, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (228, 44, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (229, 20, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (230, 93, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (231, 66, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (232, 94, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (233, 5, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (234, 93, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (235, 47, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (236, 33, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (237, 82, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (238, 46, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (239, 12, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (240, 37, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (241, 10, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (242, 47, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (243, 0, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (244, 71, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (245, 40, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (246, 61, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (247, 79, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (248, 8, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (249, 16, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (250, 0, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (251, 88, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (252, 42, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (253, 42, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (254, 68, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (255, 65, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (256, 17, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (257, 71, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (258, 92, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (259, 19, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (260, 69, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (261, 11, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (262, 81, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (263, 65, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (264, 48, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (265, 63, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (266, 54, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (267, 33, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (268, 67, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (269, 15, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (270, 27, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (271, 22, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (272, 8, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (273, 85, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (274, 72, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (275, 58, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (276, 52, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (277, 65, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (278, 70, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (279, 65, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (280, 46, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (281, 19, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (282, 30, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (283, 74, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (284, 5, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (285, 43, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (286, 44, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (287, 27, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (288, 15, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (289, 62, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (290, 88, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (291, 42, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (292, 94, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (293, 66, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (294, 4, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (295, 48, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (296, 3, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (297, 72, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (298, 36, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (299, 21, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (300, 51, 8, 'F');
commit;
prompt 300 records committed...
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (301, 78, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (302, 64, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (303, 56, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (304, 5, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (305, 53, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (306, 86, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (307, 69, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (308, 7, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (309, 70, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (310, 55, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (311, 25, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (312, 69, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (313, 72, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (314, 41, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (315, 13, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (316, 82, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (317, 41, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (318, 88, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (319, 26, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (320, 81, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (321, 1, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (322, 91, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (323, 18, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (324, 27, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (325, 79, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (326, 14, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (327, 47, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (328, 20, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (329, 97, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (330, 5, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (331, 20, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (332, 36, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (333, 80, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (334, 4, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (335, 2, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (336, 65, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (337, 4, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (338, 35, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (339, 55, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (340, 94, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (341, 98, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (342, 26, 3, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (343, 18, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (344, 48, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (345, 0, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (346, 17, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (347, 54, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (348, 99, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (349, 22, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (350, 26, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (351, 3, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (352, 84, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (353, 64, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (354, 92, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (355, 37, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (356, 29, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (357, 91, 4, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (358, 24, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (359, 99, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (360, 35, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (361, 74, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (362, 18, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (363, 71, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (364, 77, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (365, 32, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (366, 12, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (367, 8, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (368, 47, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (369, 48, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (370, 4, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (371, 21, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (372, 23, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (373, 38, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (374, 55, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (375, 12, 5, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (376, 36, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (377, 0, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (378, 36, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (379, 80, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (380, 86, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (381, 69, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (382, 5, 10, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (383, 61, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (384, 27, 8, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (385, 44, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (386, 18, 9, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (387, 71, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (388, 10, 10, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (389, 91, 3, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (390, 14, 6, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (391, 50, 9, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (392, 61, 4, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (393, 10, 6, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (394, 18, 8, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (395, 47, 2, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (396, 27, 7, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (397, 39, 7, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (398, 62, 2, 'T');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (399, 79, 5, 'F');
insert into AIRPLANE (serialid, fuel, gforce_limit, ejection_seat_capable)
values (400, 42, 7, 'F');
commit;
prompt 400 records loaded
prompt Loading SOLDIER...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rowena', 'Grishunin', 'Captain', to_date('29-10-1994', 'dd-mm-yyyy'), 352876755);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lemuel', 'Habgood', 'Sergeant', to_date('08-07-1986', 'dd-mm-yyyy'), 310744513);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Duane', 'Rounce', 'Sergeant', to_date('07-07-1995', 'dd-mm-yyyy'), 230844972);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Olwen', 'Abbotson', 'Major', to_date('02-12-1995', 'dd-mm-yyyy'), 393929359);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hanni', 'Auletta', 'Corporal', to_date('05-12-1985', 'dd-mm-yyyy'), 374060924);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Desiri', 'Leatherland', 'Corporal', to_date('25-04-1984', 'dd-mm-yyyy'), 212367526);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pepi', 'Hansberry', 'Lieutenant', to_date('14-12-2000', 'dd-mm-yyyy'), 382416186);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Celestina', 'Farnworth', 'General', to_date('21-08-1982', 'dd-mm-yyyy'), 208012624);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mady', 'Kettlesing', 'Lieutenant', to_date('10-08-1991', 'dd-mm-yyyy'), 368187730);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nicolis', 'Dauney', 'Corporal', to_date('31-12-1991', 'dd-mm-yyyy'), 361668181);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Opal', 'Desseine', 'Captain', to_date('11-05-1989', 'dd-mm-yyyy'), 278811684);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Breanne', 'McLay', 'Major', to_date('26-05-1988', 'dd-mm-yyyy'), 377594399);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lorena', 'Moffett', 'Sergeant', to_date('14-08-1992', 'dd-mm-yyyy'), 240481019);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nickolas', 'Wasselin', 'Sergeant', to_date('06-05-2002', 'dd-mm-yyyy'), 243963149);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tate', 'Ornillos', 'Captain', to_date('20-01-1987', 'dd-mm-yyyy'), 351192575);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Heriberto', 'Crumbleholme', 'Corporal', to_date('16-05-1987', 'dd-mm-yyyy'), 286391083);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fax', 'Thomton', 'Sergeant', to_date('02-09-1994', 'dd-mm-yyyy'), 293109655);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emily', 'Hedingham', 'Corporal', to_date('08-02-1999', 'dd-mm-yyyy'), 351838716);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tierney', 'Menauteau', 'Lieutenant', to_date('02-02-1994', 'dd-mm-yyyy'), 246305138);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Winnifred', 'Uglow', 'Colonel', to_date('09-06-1999', 'dd-mm-yyyy'), 318205068);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Constanta', 'Brandenberg', 'Captain', to_date('31-03-2003', 'dd-mm-yyyy'), 225960286);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Berkley', 'Flacke', 'Sergeant', to_date('27-02-1984', 'dd-mm-yyyy'), 361805462);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Murdock', 'Steanyng', 'Lieutenant', to_date('29-02-1988', 'dd-mm-yyyy'), 281254938);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dorelia', 'Spleving', 'Lieutenant', to_date('07-08-2001', 'dd-mm-yyyy'), 399633559);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Veronica', 'Tincknell', 'Colonel', to_date('30-03-1982', 'dd-mm-yyyy'), 211015332);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jay', 'Bartoszinski', 'Major', to_date('01-07-1981', 'dd-mm-yyyy'), 322017091);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Vina', 'Ragot', 'Major', to_date('20-06-1998', 'dd-mm-yyyy'), 351673387);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Horatius', 'Dilkes', 'Private', to_date('28-03-1992', 'dd-mm-yyyy'), 224950365);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Daniela', 'Rashleigh', 'Lieutenant', to_date('21-12-1986', 'dd-mm-yyyy'), 393121842);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Henri', 'Yaldren', 'Sergeant', to_date('24-11-2002', 'dd-mm-yyyy'), 217732764);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cesar', 'Mattimoe', 'Lieutenant', to_date('08-02-2002', 'dd-mm-yyyy'), 350039705);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Paige', 'Gringley', 'Lieutenant', to_date('08-09-1984', 'dd-mm-yyyy'), 228198573);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Loralyn', 'Trenbay', 'Lieutenant', to_date('13-11-1981', 'dd-mm-yyyy'), 245647526);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tallia', 'Fielders', 'Captain', to_date('30-08-2003', 'dd-mm-yyyy'), 370005847);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lambert', 'Geere', 'Colonel', to_date('30-08-1981', 'dd-mm-yyyy'), 299851389);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tressa', 'Burnard', 'Colonel', to_date('08-04-1995', 'dd-mm-yyyy'), 250276923);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maggi', 'De la Feld', 'General', to_date('14-10-2002', 'dd-mm-yyyy'), 298579995);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Libby', 'Margarson', 'General', to_date('17-01-1991', 'dd-mm-yyyy'), 203674125);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wally', 'Waight', 'Private', to_date('21-06-2003', 'dd-mm-yyyy'), 255699157);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sib', 'Goudge', 'General', to_date('13-08-1986', 'dd-mm-yyyy'), 252913310);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ferrel', 'Haggard', 'General', to_date('22-06-1984', 'dd-mm-yyyy'), 212223814);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Meyer', 'Gulvin', 'General', to_date('28-07-1997', 'dd-mm-yyyy'), 394282032);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Suzann', 'Wherrett', 'Sergeant', to_date('19-08-2001', 'dd-mm-yyyy'), 375812775);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mina', 'Barge', 'General', to_date('12-09-2002', 'dd-mm-yyyy'), 234751380);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Crystal', 'Whittles', 'Lieutenant', to_date('11-01-1999', 'dd-mm-yyyy'), 252431023);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rhys', 'Gian', 'Corporal', to_date('27-07-1982', 'dd-mm-yyyy'), 321919788);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eb', 'Pautard', 'Major', to_date('18-09-1996', 'dd-mm-yyyy'), 223099775);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gloriana', 'Ikin', 'Sergeant', to_date('31-01-1990', 'dd-mm-yyyy'), 382226987);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Erastus', 'Cayette', 'Corporal', to_date('11-05-1999', 'dd-mm-yyyy'), 267161344);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Obadias', 'Blowes', 'Captain', to_date('23-12-1994', 'dd-mm-yyyy'), 286841717);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jeromy', 'Choulerton', 'Colonel', to_date('13-05-1983', 'dd-mm-yyyy'), 246107920);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Garey', 'Glasscott', 'Sergeant', to_date('11-04-1990', 'dd-mm-yyyy'), 335344463);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nariko', 'Henriksson', 'Sergeant', to_date('11-12-1998', 'dd-mm-yyyy'), 378053165);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Laurence', 'Bauchop', 'Lieutenant', to_date('12-01-1995', 'dd-mm-yyyy'), 359072464);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Chester', 'Swift', 'General', to_date('21-11-1988', 'dd-mm-yyyy'), 328655557);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cornie', 'Stobbs', 'Major', to_date('12-07-1985', 'dd-mm-yyyy'), 305034488);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Danika', 'Lasslett', 'Lieutenant', to_date('24-11-2000', 'dd-mm-yyyy'), 232303898);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Virginie', 'Hullock', 'Lieutenant', to_date('23-04-1983', 'dd-mm-yyyy'), 311073451);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Melisande', 'Vlasenko', 'Major', to_date('21-12-1992', 'dd-mm-yyyy'), 391935917);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lauren', 'McCuaig', 'Sergeant', to_date('14-10-1983', 'dd-mm-yyyy'), 213504836);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Vale', 'Tease', 'Lieutenant', to_date('08-03-1987', 'dd-mm-yyyy'), 246602769);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Danie', 'Rummins', 'Private', to_date('19-08-1999', 'dd-mm-yyyy'), 256485829);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Guglielmo', 'Jansen', 'Major', to_date('01-02-1996', 'dd-mm-yyyy'), 307851623);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Saul', 'Decent', 'Corporal', to_date('09-11-1988', 'dd-mm-yyyy'), 338550984);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tim', 'Lydden', 'Lieutenant', to_date('12-03-1999', 'dd-mm-yyyy'), 363711205);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rod', 'Maxwell', 'Sergeant', to_date('14-07-1988', 'dd-mm-yyyy'), 281784417);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Northrup', 'Dench', 'Private', to_date('20-01-2000', 'dd-mm-yyyy'), 303975193);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rochella', 'Streeter', 'Captain', to_date('14-06-1980', 'dd-mm-yyyy'), 202761268);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Concordia', 'Magne', 'Corporal', to_date('22-05-1981', 'dd-mm-yyyy'), 231978518);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Don', 'Macconaghy', 'Captain', to_date('11-03-1994', 'dd-mm-yyyy'), 283658054);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Naomi', 'Lowton', 'Lieutenant', to_date('05-09-1989', 'dd-mm-yyyy'), 262973027);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sonya', 'Goneau', 'General', to_date('25-06-2000', 'dd-mm-yyyy'), 250913628);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gamaliel', 'Bonaire', 'General', to_date('13-05-1998', 'dd-mm-yyyy'), 348921664);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shanna', 'Swinburn', 'Sergeant', to_date('15-10-1984', 'dd-mm-yyyy'), 315741002);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alaster', 'Dunthorne', 'Lieutenant', to_date('10-11-1980', 'dd-mm-yyyy'), 259591196);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cheri', 'Pavlenko', 'Colonel', to_date('31-01-1999', 'dd-mm-yyyy'), 377799888);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shanna', 'Thickin', 'Corporal', to_date('28-10-1990', 'dd-mm-yyyy'), 284582496);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sargent', 'Edelheid', 'Sergeant', to_date('27-06-1987', 'dd-mm-yyyy'), 248641347);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ula', 'Bax', 'Colonel', to_date('23-06-1993', 'dd-mm-yyyy'), 315734249);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tessie', 'Berthomieu', 'Lieutenant', to_date('29-10-1985', 'dd-mm-yyyy'), 325369392);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wiatt', 'Paddeley', 'General', to_date('17-07-1983', 'dd-mm-yyyy'), 302397797);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Madelena', 'Cestard', 'Corporal', to_date('10-02-2003', 'dd-mm-yyyy'), 349029408);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Phyllis', 'Giovannetti', 'Private', to_date('27-08-1980', 'dd-mm-yyyy'), 314623737);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nicolais', 'Goodrick', 'Corporal', to_date('29-12-1981', 'dd-mm-yyyy'), 201602389);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cortie', 'Jeakins', 'Captain', to_date('28-10-1992', 'dd-mm-yyyy'), 373019581);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Stanfield', 'Teale', 'Lieutenant', to_date('20-07-1994', 'dd-mm-yyyy'), 225531610);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Olin', 'Ormond', 'Major', to_date('05-01-1993', 'dd-mm-yyyy'), 379158398);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emmaline', 'Canete', 'Major', to_date('17-05-2000', 'dd-mm-yyyy'), 331931598);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hamel', 'Edsall', 'Lieutenant', to_date('07-08-2001', 'dd-mm-yyyy'), 217276877);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cassi', 'Oxterby', 'Sergeant', to_date('19-05-2000', 'dd-mm-yyyy'), 305522844);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tomasine', 'Fandrich', 'General', to_date('21-01-1987', 'dd-mm-yyyy'), 351839210);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mordecai', 'Simpole', 'Corporal', to_date('02-05-1982', 'dd-mm-yyyy'), 303317235);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nolana', 'Baudic', 'Lieutenant', to_date('28-02-1994', 'dd-mm-yyyy'), 252018270);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Johnny', 'Sidlow', 'Major', to_date('22-02-1980', 'dd-mm-yyyy'), 373130046);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jarad', 'Klaaasen', 'Captain', to_date('08-03-2003', 'dd-mm-yyyy'), 337903486);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alyse', 'Delle', 'General', to_date('13-09-1983', 'dd-mm-yyyy'), 381055930);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Judye', 'Gane', 'Lieutenant', to_date('29-03-1985', 'dd-mm-yyyy'), 265113936);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Adella', 'Carvill', 'General', to_date('26-01-1988', 'dd-mm-yyyy'), 325998549);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Niven', 'Arnholz', 'Colonel', to_date('31-01-2002', 'dd-mm-yyyy'), 358301921);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maye', 'Edis', 'Captain', to_date('18-10-1985', 'dd-mm-yyyy'), 262379648);
commit;
prompt 100 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Laney', 'Delap', 'Colonel', to_date('11-08-1985', 'dd-mm-yyyy'), 270870772);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Neron', 'Grafton', 'General', to_date('08-09-1995', 'dd-mm-yyyy'), 327204421);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elberta', 'Pickring', 'General', to_date('02-08-1997', 'dd-mm-yyyy'), 298415834);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Luca', 'Hallows', 'Colonel', to_date('26-06-1981', 'dd-mm-yyyy'), 308287424);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alastair', 'Thornborrow', 'Lieutenant', to_date('30-11-1982', 'dd-mm-yyyy'), 232370337);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hanson', 'Dryden', 'Sergeant', to_date('04-10-1987', 'dd-mm-yyyy'), 285293227);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Veronike', 'Sayburn', 'Corporal', to_date('21-04-1993', 'dd-mm-yyyy'), 210939483);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Camey', 'Bedells', 'Lieutenant', to_date('04-11-1983', 'dd-mm-yyyy'), 318733779);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sammy', 'Pentelow', 'Corporal', to_date('19-07-1997', 'dd-mm-yyyy'), 200257272);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rosanne', 'Clarricoates', 'General', to_date('04-06-1980', 'dd-mm-yyyy'), 335518463);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Neila', 'Van de Velde', 'General', to_date('17-11-1985', 'dd-mm-yyyy'), 317899278);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marget', 'Kemer', 'Sergeant', to_date('28-08-1988', 'dd-mm-yyyy'), 259474417);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marillin', 'Tuley', 'Private', to_date('21-08-1990', 'dd-mm-yyyy'), 272384020);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Friederike', 'Fiddyment', 'Corporal', to_date('19-08-1982', 'dd-mm-yyyy'), 320361086);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dare', 'McKeefry', 'Sergeant', to_date('22-08-2001', 'dd-mm-yyyy'), 379372552);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Simeon', 'Bernadzki', 'Private', to_date('29-12-1998', 'dd-mm-yyyy'), 265540575);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ephrem', 'Ezzle', 'Lieutenant', to_date('28-03-1985', 'dd-mm-yyyy'), 316817114);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Etty', 'Stratley', 'Sergeant', to_date('14-01-1993', 'dd-mm-yyyy'), 204248457);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Winnah', 'Gladeche', 'General', to_date('20-01-2001', 'dd-mm-yyyy'), 384295384);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sioux', 'Padley', 'Private', to_date('04-09-1993', 'dd-mm-yyyy'), 359540138);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Joelynn', 'Vieyra', 'Major', to_date('16-01-1990', 'dd-mm-yyyy'), 295551610);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Heindrick', 'Dearl', 'Private', to_date('17-10-1982', 'dd-mm-yyyy'), 300796391);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Barby', 'Morforth', 'Captain', to_date('11-12-2001', 'dd-mm-yyyy'), 391615586);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Winona', 'Durward', 'General', to_date('26-04-1983', 'dd-mm-yyyy'), 220098572);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lettie', 'Ivashinnikov', 'Major', to_date('26-05-1997', 'dd-mm-yyyy'), 212486535);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cilka', 'Lampett', 'Lieutenant', to_date('17-11-1991', 'dd-mm-yyyy'), 395488778);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Skylar', 'Bellini', 'Lieutenant', to_date('22-08-1984', 'dd-mm-yyyy'), 266445149);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Christy', 'Shuxsmith', 'Sergeant', to_date('10-04-1991', 'dd-mm-yyyy'), 304285527);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Raphael', 'Arkin', 'Lieutenant', to_date('03-08-1996', 'dd-mm-yyyy'), 373010301);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maury', 'Harry', 'Corporal', to_date('12-02-1999', 'dd-mm-yyyy'), 371702846);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Laurene', 'Bengtsen', 'Corporal', to_date('26-05-1983', 'dd-mm-yyyy'), 207039313);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Catharina', 'Rentz', 'Major', to_date('08-06-1993', 'dd-mm-yyyy'), 367954699);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Arnaldo', 'Tenney', 'Colonel', to_date('23-10-1997', 'dd-mm-yyyy'), 229384841);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anissa', 'Carbonell', 'Colonel', to_date('07-01-1991', 'dd-mm-yyyy'), 310184020);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Isobel', 'Truran', 'Sergeant', to_date('08-02-1990', 'dd-mm-yyyy'), 382151098);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emmaline', 'Muffett', 'Lieutenant', to_date('15-01-1990', 'dd-mm-yyyy'), 345286255);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Benita', 'MacCartan', 'Lieutenant', to_date('16-11-1996', 'dd-mm-yyyy'), 314326191);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Frankie', 'Negus', 'Captain', to_date('19-11-2000', 'dd-mm-yyyy'), 248690235);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cointon', 'Janu', 'Lieutenant', to_date('15-03-1999', 'dd-mm-yyyy'), 224700233);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elwood', 'Silverston', 'Captain', to_date('16-11-1997', 'dd-mm-yyyy'), 217219961);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bria', 'Ellph', 'Captain', to_date('12-12-1982', 'dd-mm-yyyy'), 283740532);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ambrosius', 'Glazyer', 'Major', to_date('14-01-1985', 'dd-mm-yyyy'), 361575587);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emmey', 'Cohen', 'Colonel', to_date('16-03-2002', 'dd-mm-yyyy'), 276197396);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rebecka', 'Hailston', 'General', to_date('30-11-1987', 'dd-mm-yyyy'), 284808427);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Quentin', 'Budget', 'Private', to_date('01-05-1985', 'dd-mm-yyyy'), 220360403);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('My', 'Casham', 'Captain', to_date('18-07-1993', 'dd-mm-yyyy'), 261791763);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Herschel', 'Roycraft', 'General', to_date('21-06-2000', 'dd-mm-yyyy'), 211607938);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Noel', 'Delyth', 'General', to_date('10-03-1992', 'dd-mm-yyyy'), 293806695);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rhonda', 'Gherardelli', 'Captain', to_date('04-08-2001', 'dd-mm-yyyy'), 293363749);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jabez', 'Phelan', 'Private', to_date('18-12-1984', 'dd-mm-yyyy'), 202262081);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hillary', 'Ladel', 'Captain', to_date('04-01-1982', 'dd-mm-yyyy'), 256514846);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gran', 'Folbige', 'Colonel', to_date('09-01-1983', 'dd-mm-yyyy'), 324778772);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Correna', 'Ragate', 'Colonel', to_date('10-01-1994', 'dd-mm-yyyy'), 397555975);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marris', 'Stoker', 'Private', to_date('30-03-1984', 'dd-mm-yyyy'), 395931486);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maurits', 'Finlan', 'Captain', to_date('18-01-1992', 'dd-mm-yyyy'), 263773252);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gerick', 'Domerc', 'Colonel', to_date('08-06-2003', 'dd-mm-yyyy'), 301434640);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Josy', 'Sweeney', 'Sergeant', to_date('30-10-2001', 'dd-mm-yyyy'), 377796619);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Chiquita', 'Byars', 'General', to_date('27-10-1984', 'dd-mm-yyyy'), 373110350);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Edgard', 'Rittelmeyer', 'Private', to_date('30-07-1982', 'dd-mm-yyyy'), 216754654);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Teodor', 'Semper', 'Colonel', to_date('30-07-1994', 'dd-mm-yyyy'), 333773862);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Georg', 'Tourle', 'Captain', to_date('30-12-1991', 'dd-mm-yyyy'), 338312631);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Loria', 'Dello', 'Lieutenant', to_date('11-03-2003', 'dd-mm-yyyy'), 377921159);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Salomo', 'Pinfold', 'General', to_date('12-02-1996', 'dd-mm-yyyy'), 393814153);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aurelie', 'Plowman', 'Sergeant', to_date('12-11-1991', 'dd-mm-yyyy'), 233073266);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wylie', 'Jesper', 'Sergeant', to_date('24-11-1982', 'dd-mm-yyyy'), 332326972);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mildrid', 'Henrot', 'Lieutenant', to_date('25-03-1996', 'dd-mm-yyyy'), 376186331);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cacilie', 'Renner', 'Private', to_date('07-04-2000', 'dd-mm-yyyy'), 225026778);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Daisey', 'Indge', 'Corporal', to_date('30-04-1992', 'dd-mm-yyyy'), 282400795);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Korry', 'Fitch', 'Colonel', to_date('20-04-1990', 'dd-mm-yyyy'), 312169232);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Allie', 'Shefton', 'Captain', to_date('09-04-1993', 'dd-mm-yyyy'), 242783287);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Analise', 'Vairow', 'Lieutenant', to_date('22-09-1995', 'dd-mm-yyyy'), 230645399);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dion', 'Stocken', 'General', to_date('22-09-1985', 'dd-mm-yyyy'), 284542188);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Neile', 'Blizard', 'Colonel', to_date('22-04-1987', 'dd-mm-yyyy'), 313156475);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Adrian', 'Masdin', 'Lieutenant', to_date('08-11-1986', 'dd-mm-yyyy'), 306476518);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rod', 'Tatlock', 'Colonel', to_date('28-11-1984', 'dd-mm-yyyy'), 274567928);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Scarlett', 'Tombleson', 'Major', to_date('29-12-1998', 'dd-mm-yyyy'), 365329806);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Adelaida', 'Weldrake', 'Colonel', to_date('12-05-1991', 'dd-mm-yyyy'), 397217144);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fraser', 'Raith', 'Private', to_date('24-07-1981', 'dd-mm-yyyy'), 232158523);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Beniamino', 'Ardling', 'Colonel', to_date('02-05-1991', 'dd-mm-yyyy'), 263306372);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sally', 'Saddington', 'General', to_date('25-09-1981', 'dd-mm-yyyy'), 368783843);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Everett', 'Tibald', 'Major', to_date('02-08-1998', 'dd-mm-yyyy'), 238535952);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ainsley', 'Ackrill', 'Lieutenant', to_date('22-03-1997', 'dd-mm-yyyy'), 246155619);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Brandi', 'Ferraraccio', 'Lieutenant', to_date('07-05-2000', 'dd-mm-yyyy'), 373075314);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carrol', 'McCaughen', 'Sergeant', to_date('24-04-1982', 'dd-mm-yyyy'), 319249060);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Faulkner', 'Braksper', 'Corporal', to_date('09-04-1987', 'dd-mm-yyyy'), 366740403);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Giulietta', 'Ghio', 'Captain', to_date('23-06-1984', 'dd-mm-yyyy'), 318249490);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Claudette', 'Touret', 'Corporal', to_date('08-04-1992', 'dd-mm-yyyy'), 266747526);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Edwin', 'Jewkes', 'Private', to_date('13-01-2003', 'dd-mm-yyyy'), 396925731);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lonee', 'Buttle', 'Corporal', to_date('05-03-1982', 'dd-mm-yyyy'), 338056009);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Karia', 'Hincham', 'Sergeant', to_date('07-06-1982', 'dd-mm-yyyy'), 208586019);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rhona', 'Reiners', 'Colonel', to_date('25-03-2002', 'dd-mm-yyyy'), 333835978);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pat', 'Cardillo', 'Colonel', to_date('29-03-1984', 'dd-mm-yyyy'), 219574223);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Waylen', 'Brymham', 'Lieutenant', to_date('10-08-1983', 'dd-mm-yyyy'), 285764748);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cly', 'Gabbitis', 'Captain', to_date('12-03-1997', 'dd-mm-yyyy'), 335628947);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tate', 'Gurdon', 'Colonel', to_date('16-06-1992', 'dd-mm-yyyy'), 259169287);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bud', 'Dosdill', 'General', to_date('19-06-1990', 'dd-mm-yyyy'), 389876311);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lilian', 'Tregenna', 'Sergeant', to_date('05-07-1999', 'dd-mm-yyyy'), 248169596);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Linn', 'Pretious', 'Major', to_date('03-03-1996', 'dd-mm-yyyy'), 376011584);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bryn', 'Deboy', 'General', to_date('08-05-2001', 'dd-mm-yyyy'), 245331396);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cob', 'Hackin', 'Captain', to_date('30-01-1989', 'dd-mm-yyyy'), 236682255);
commit;
prompt 200 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carroll', 'Trimmell', 'Sergeant', to_date('11-06-1995', 'dd-mm-yyyy'), 309385118);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mayne', 'Peplow', 'Captain', to_date('14-09-2003', 'dd-mm-yyyy'), 372245985);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gauthier', 'Cursons', 'Lieutenant', to_date('17-05-1986', 'dd-mm-yyyy'), 368155455);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Orelie', 'Husby', 'Private', to_date('05-08-1990', 'dd-mm-yyyy'), 286781734);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jasun', 'Verey', 'General', to_date('11-06-1981', 'dd-mm-yyyy'), 294470263);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Earvin', 'Darton', 'Sergeant', to_date('07-12-1992', 'dd-mm-yyyy'), 393426172);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tessie', 'Sterndale', 'Colonel', to_date('16-10-1990', 'dd-mm-yyyy'), 372998106);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shaun', 'Killough', 'Private', to_date('08-01-1997', 'dd-mm-yyyy'), 319047186);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Karel', 'Facchini', 'Colonel', to_date('15-06-1996', 'dd-mm-yyyy'), 328678456);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Asher', 'Antunes', 'Corporal', to_date('07-01-1980', 'dd-mm-yyyy'), 390446813);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maximilian', 'Merington', 'Private', to_date('12-01-1980', 'dd-mm-yyyy'), 251473876);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ricoriki', 'Algy', 'Private', to_date('24-02-1990', 'dd-mm-yyyy'), 255543002);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eddi', 'Hillam', 'General', to_date('13-08-1986', 'dd-mm-yyyy'), 278514293);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bondie', 'Whaplington', 'Major', to_date('23-12-1984', 'dd-mm-yyyy'), 332627677);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dinnie', 'Mattosoff', 'General', to_date('31-05-1980', 'dd-mm-yyyy'), 208448726);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gisele', 'Stieger', 'General', to_date('17-06-1987', 'dd-mm-yyyy'), 242215174);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bibbie', 'Goalley', 'Colonel', to_date('14-05-1998', 'dd-mm-yyyy'), 222932554);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hewie', 'McIlwraith', 'Captain', to_date('30-09-2000', 'dd-mm-yyyy'), 288906503);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Karlis', 'Merrell', 'Sergeant', to_date('08-03-1996', 'dd-mm-yyyy'), 242284292);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dorie', 'Daout', 'Private', to_date('26-06-1997', 'dd-mm-yyyy'), 213315031);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Quill', 'Wiffill', 'Sergeant', to_date('12-05-1997', 'dd-mm-yyyy'), 289531061);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Delilah', 'Duggon', 'Private', to_date('20-03-1992', 'dd-mm-yyyy'), 225805571);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Agustin', 'Rodnight', 'Sergeant', to_date('26-02-1997', 'dd-mm-yyyy'), 332331226);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carola', 'Milsom', 'Colonel', to_date('03-11-1993', 'dd-mm-yyyy'), 383141349);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Garnet', 'Piser', 'Sergeant', to_date('03-09-1988', 'dd-mm-yyyy'), 297035013);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jarred', 'Trowl', 'General', to_date('09-07-1991', 'dd-mm-yyyy'), 271292662);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gian', 'Colclough', 'Sergeant', to_date('20-12-1999', 'dd-mm-yyyy'), 281350965);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Yelena', 'Curzon', 'Captain', to_date('08-12-1997', 'dd-mm-yyyy'), 218040824);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anny', 'England', 'Sergeant', to_date('25-07-2000', 'dd-mm-yyyy'), 318671314);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ricard', 'Bartolomeoni', 'Private', to_date('04-12-1995', 'dd-mm-yyyy'), 292237699);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Paula', 'Cissen', 'General', to_date('28-05-1983', 'dd-mm-yyyy'), 385046080);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elna', 'Casbourne', 'Private', to_date('19-06-2000', 'dd-mm-yyyy'), 296407602);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kaycee', 'Mostyn', 'Captain', to_date('24-05-2000', 'dd-mm-yyyy'), 217409233);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Odilia', 'Longfut', 'Major', to_date('20-05-1984', 'dd-mm-yyyy'), 306112908);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sylvia', 'Chandlar', 'Colonel', to_date('21-12-1992', 'dd-mm-yyyy'), 275831961);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kristyn', 'Ferri', 'Sergeant', to_date('24-11-2002', 'dd-mm-yyyy'), 211521123);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Amandie', 'Dunbavin', 'Corporal', to_date('11-07-1996', 'dd-mm-yyyy'), 345865245);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Darrick', 'Dumphy', 'Sergeant', to_date('27-11-2001', 'dd-mm-yyyy'), 392889533);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Myrah', 'Goodswen', 'Colonel', to_date('29-10-2003', 'dd-mm-yyyy'), 234984060);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tedman', 'Kearney', 'Corporal', to_date('05-07-2001', 'dd-mm-yyyy'), 248341037);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Manfred', 'Jansen', 'Captain', to_date('17-05-1986', 'dd-mm-yyyy'), 217022192);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eilis', 'Heigold', 'General', to_date('01-01-1987', 'dd-mm-yyyy'), 258149052);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Neysa', 'Mellon', 'Lieutenant', to_date('08-02-1996', 'dd-mm-yyyy'), 317296920);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Terrell', 'Pither', 'Captain', to_date('10-03-1980', 'dd-mm-yyyy'), 322449190);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rudolph', 'Gianelli', 'Colonel', to_date('18-04-1999', 'dd-mm-yyyy'), 360828946);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Yevette', 'Kubatsch', 'Colonel', to_date('22-11-2002', 'dd-mm-yyyy'), 333559986);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Oates', 'Dumphy', 'Lieutenant', to_date('26-09-1995', 'dd-mm-yyyy'), 367714579);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Koralle', 'Godwyn', 'Colonel', to_date('17-01-2002', 'dd-mm-yyyy'), 207710374);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gisella', 'Vaun', 'Major', to_date('30-04-1999', 'dd-mm-yyyy'), 253517082);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Forrest', 'Abela', 'Sergeant', to_date('06-11-1994', 'dd-mm-yyyy'), 379139542);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alphonse', 'Westell', 'General', to_date('17-06-2003', 'dd-mm-yyyy'), 258182394);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Clara', 'Burthom', 'Corporal', to_date('16-10-2000', 'dd-mm-yyyy'), 283434229);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dyanna', 'Glyne', 'Private', to_date('10-06-1984', 'dd-mm-yyyy'), 313452626);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Winn', 'Banghe', 'Sergeant', to_date('21-07-2001', 'dd-mm-yyyy'), 361952349);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eleanore', 'Grevatt', 'General', to_date('20-03-1994', 'dd-mm-yyyy'), 362279899);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carey', 'Casseldine', 'Corporal', to_date('29-04-1989', 'dd-mm-yyyy'), 353423167);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Charmaine', 'Nortunen', 'Lieutenant', to_date('06-05-2002', 'dd-mm-yyyy'), 389437960);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Charleen', 'Thebeaud', 'Sergeant', to_date('25-03-2003', 'dd-mm-yyyy'), 396272770);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Celka', 'Lidgertwood', 'Sergeant', to_date('22-07-1996', 'dd-mm-yyyy'), 318491566);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Reinhard', 'Lamers', 'Lieutenant', to_date('14-06-1988', 'dd-mm-yyyy'), 370414685);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tally', 'Ritmeier', 'Corporal', to_date('26-11-1997', 'dd-mm-yyyy'), 226311528);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Amber', 'Gunton', 'Sergeant', to_date('10-12-1994', 'dd-mm-yyyy'), 208188533);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Biron', 'Gerry', 'Sergeant', to_date('30-10-1998', 'dd-mm-yyyy'), 318153502);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Phillipe', 'Theodore', 'Private', to_date('18-01-1984', 'dd-mm-yyyy'), 245765352);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Read', 'Massen', 'Major', to_date('14-09-1982', 'dd-mm-yyyy'), 283761508);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hedi', 'Gullam', 'Major', to_date('09-12-2001', 'dd-mm-yyyy'), 369691820);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Reena', 'Ewen', 'Private', to_date('01-06-1992', 'dd-mm-yyyy'), 235947953);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Adan', 'Dykas', 'Sergeant', to_date('10-10-1994', 'dd-mm-yyyy'), 277622076);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sunny', 'Nolleth', 'Sergeant', to_date('14-08-1982', 'dd-mm-yyyy'), 354733446);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Terese', 'Heustice', 'Major', to_date('03-08-2001', 'dd-mm-yyyy'), 287318682);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Novelia', 'Matterdace', 'Major', to_date('18-08-2002', 'dd-mm-yyyy'), 369240014);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marybelle', 'Fonzone', 'Colonel', to_date('01-09-1984', 'dd-mm-yyyy'), 203143823);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rita', 'Killimister', 'Colonel', to_date('09-06-1995', 'dd-mm-yyyy'), 220738772);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marshal', 'Judkin', 'General', to_date('10-08-1990', 'dd-mm-yyyy'), 381780312);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Etienne', 'Luisetti', 'Major', to_date('26-03-2001', 'dd-mm-yyyy'), 306597306);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kassi', 'Burnel', 'Captain', to_date('13-01-1994', 'dd-mm-yyyy'), 202609997);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Stanly', 'Treversh', 'Private', to_date('07-01-2001', 'dd-mm-yyyy'), 337499694);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lynna', 'Loosmore', 'Corporal', to_date('31-03-1983', 'dd-mm-yyyy'), 394466711);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Celestyna', 'Das', 'General', to_date('20-08-1981', 'dd-mm-yyyy'), 225275338);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Darryl', 'Hegge', 'Lieutenant', to_date('25-12-1986', 'dd-mm-yyyy'), 272877011);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Steffane', 'Cundict', 'Captain', to_date('10-07-1981', 'dd-mm-yyyy'), 377997084);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Roz', 'Heaford', 'Private', to_date('15-08-1981', 'dd-mm-yyyy'), 383146514);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lemmy', 'Snalom', 'Lieutenant', to_date('13-05-1981', 'dd-mm-yyyy'), 261612941);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rivalee', 'Weavill', 'Lieutenant', to_date('17-06-1983', 'dd-mm-yyyy'), 368115320);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alphonse', 'Barus', 'Colonel', to_date('03-04-1989', 'dd-mm-yyyy'), 345298260);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Harriet', 'Harms', 'Colonel', to_date('13-11-1990', 'dd-mm-yyyy'), 237960278);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Charline', 'Yurinov', 'Colonel', to_date('28-12-2001', 'dd-mm-yyyy'), 364419310);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Giustino', 'Skippings', 'Sergeant', to_date('24-11-1982', 'dd-mm-yyyy'), 340502089);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Liv', 'Hardan', 'Private', to_date('25-07-2001', 'dd-mm-yyyy'), 290846028);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Osborne', 'Mosedall', 'Colonel', to_date('25-02-1985', 'dd-mm-yyyy'), 257876572);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Susana', 'Reader', 'Lieutenant', to_date('03-04-2003', 'dd-mm-yyyy'), 369016068);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Annadiana', 'Castella', 'Private', to_date('07-05-1982', 'dd-mm-yyyy'), 336597549);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Brodie', 'McTear', 'General', to_date('26-05-1995', 'dd-mm-yyyy'), 299828181);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Colene', 'Lacrouts', 'Captain', to_date('10-11-1999', 'dd-mm-yyyy'), 235557961);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Krystalle', 'Camilli', 'Corporal', to_date('05-02-1990', 'dd-mm-yyyy'), 283492160);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hugues', 'Kidwell', 'Corporal', to_date('20-04-1993', 'dd-mm-yyyy'), 379214076);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Junia', 'Stowe', 'Lieutenant', to_date('23-01-1999', 'dd-mm-yyyy'), 300483849);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Meg', 'Spoward', 'Colonel', to_date('27-02-1989', 'dd-mm-yyyy'), 211370297);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aurea', 'Checcuzzi', 'Lieutenant', to_date('15-06-1988', 'dd-mm-yyyy'), 347344328);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Edd', 'Lynam', 'Corporal', to_date('12-10-1985', 'dd-mm-yyyy'), 301522752);
commit;
prompt 300 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anders', 'Miere', 'Colonel', to_date('08-05-1987', 'dd-mm-yyyy'), 221485074);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tuesday', 'Wilbraham', 'Colonel', to_date('29-06-1982', 'dd-mm-yyyy'), 242351401);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nils', 'Ronchetti', 'Sergeant', to_date('29-04-2001', 'dd-mm-yyyy'), 320248553);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jacob', 'Cripps', 'Sergeant', to_date('04-02-1985', 'dd-mm-yyyy'), 374048613);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Chrysa', 'Baack', 'Major', to_date('19-08-1984', 'dd-mm-yyyy'), 234391026);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rayna', 'Petre', 'Sergeant', to_date('19-01-1983', 'dd-mm-yyyy'), 269675504);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jayme', 'Compfort', 'Captain', to_date('07-01-1981', 'dd-mm-yyyy'), 267517965);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sergei', 'McLean', 'Captain', to_date('17-08-1981', 'dd-mm-yyyy'), 299034698);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Iorgo', 'Figura', 'Private', to_date('05-07-1983', 'dd-mm-yyyy'), 266756172);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Barbe', 'Callaway', 'Lieutenant', to_date('19-05-1988', 'dd-mm-yyyy'), 253867228);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alon', 'Redmille', 'Corporal', to_date('19-02-1997', 'dd-mm-yyyy'), 228115379);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ignaz', 'Kettel', 'Captain', to_date('11-03-1990', 'dd-mm-yyyy'), 291253848);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('North', 'Ziehm', 'Lieutenant', to_date('23-07-1987', 'dd-mm-yyyy'), 246457178);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kerry', 'Studders', 'Captain', to_date('22-06-2000', 'dd-mm-yyyy'), 378054448);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mohandas', 'Prescote', 'Major', to_date('19-03-1999', 'dd-mm-yyyy'), 356112409);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aldous', 'Shapiro', 'Private', to_date('02-12-1982', 'dd-mm-yyyy'), 307133321);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tammi', 'Linn', 'Private', to_date('15-07-1989', 'dd-mm-yyyy'), 315126730);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Waring', 'Garrigan', 'Captain', to_date('05-10-1989', 'dd-mm-yyyy'), 339508037);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Brewster', 'Trevance', 'Major', to_date('09-06-1996', 'dd-mm-yyyy'), 296769348);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Claudian', 'Pinke', 'Captain', to_date('04-04-1992', 'dd-mm-yyyy'), 266014264);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ferd', 'Wahlberg', 'Private', to_date('27-06-1999', 'dd-mm-yyyy'), 288621954);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Vivien', 'Dobrowski', 'Captain', to_date('11-12-1990', 'dd-mm-yyyy'), 241988269);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rossy', 'Mangan', 'Major', to_date('13-02-1980', 'dd-mm-yyyy'), 219965661);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Papagena', 'Sorton', 'Captain', to_date('09-11-1996', 'dd-mm-yyyy'), 250005671);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sula', 'Borth', 'General', to_date('17-06-1982', 'dd-mm-yyyy'), 306177521);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Merle', 'Guynemer', 'Major', to_date('13-11-2001', 'dd-mm-yyyy'), 330942224);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jenine', 'Barthot', 'Lieutenant', to_date('05-10-1980', 'dd-mm-yyyy'), 249121769);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cristionna', 'Killelea', 'Captain', to_date('06-05-1982', 'dd-mm-yyyy'), 263040929);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kelsey', 'Futty', 'Lieutenant', to_date('12-04-2000', 'dd-mm-yyyy'), 333900275);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Concettina', 'Canty', 'Captain', to_date('19-11-1995', 'dd-mm-yyyy'), 306473255);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Douglass', 'Kinny', 'Colonel', to_date('11-02-1998', 'dd-mm-yyyy'), 252157813);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Farlee', 'Seefus', 'Major', to_date('17-01-1989', 'dd-mm-yyyy'), 355472401);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anallese', 'Minchella', 'Private', to_date('07-08-1996', 'dd-mm-yyyy'), 201223241);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Andeee', 'Randales', 'General', to_date('22-08-1994', 'dd-mm-yyyy'), 356211147);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Torey', 'Pitcaithley', 'Private', to_date('09-04-1997', 'dd-mm-yyyy'), 211974501);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Waite', 'Aslie', 'Captain', to_date('18-04-1998', 'dd-mm-yyyy'), 228064589);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rice', 'Simoens', 'Corporal', to_date('29-07-1981', 'dd-mm-yyyy'), 316403466);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anabelle', 'Brugmann', 'Private', to_date('12-03-1998', 'dd-mm-yyyy'), 303351352);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Any', 'Poletto', 'Major', to_date('20-02-1988', 'dd-mm-yyyy'), 258114104);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kelley', 'Bowller', 'Lieutenant', to_date('04-06-1984', 'dd-mm-yyyy'), 324512804);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Birdie', 'Salman', 'Lieutenant', to_date('13-04-1990', 'dd-mm-yyyy'), 204726159);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jeralee', 'McMichell', 'Colonel', to_date('14-11-1999', 'dd-mm-yyyy'), 202176818);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Harold', 'Kosel', 'Private', to_date('17-12-2000', 'dd-mm-yyyy'), 362562760);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Deonne', 'Farge', 'Captain', to_date('02-12-1983', 'dd-mm-yyyy'), 258154389);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alonso', 'Grute', 'Colonel', to_date('03-05-1987', 'dd-mm-yyyy'), 362099046);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nate', 'Dorre', 'Private', to_date('23-07-1981', 'dd-mm-yyyy'), 285591057);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Simonne', 'Juanes', 'Major', to_date('17-08-2002', 'dd-mm-yyyy'), 215910601);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dore', 'Challinor', 'Lieutenant', to_date('29-12-2002', 'dd-mm-yyyy'), 208280328);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fanny', 'Triner', 'Captain', to_date('27-10-1984', 'dd-mm-yyyy'), 266612834);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Micki', 'Castro', 'Captain', to_date('21-05-1985', 'dd-mm-yyyy'), 204697038);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ab', 'Manneville', 'Private', to_date('12-11-1989', 'dd-mm-yyyy'), 337177477);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Curr', 'Cayle', 'Colonel', to_date('16-03-2001', 'dd-mm-yyyy'), 294942657);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hestia', 'Nicolls', 'Lieutenant', to_date('19-12-1981', 'dd-mm-yyyy'), 375835167);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lindsey', 'St. Louis', 'Private', to_date('20-06-1995', 'dd-mm-yyyy'), 279282410);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Richmond', 'Durtnal', 'Private', to_date('26-01-1993', 'dd-mm-yyyy'), 200313811);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eddi', 'Stockey', 'Colonel', to_date('10-02-1984', 'dd-mm-yyyy'), 255399546);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aloin', 'Wanjek', 'Lieutenant', to_date('09-06-1986', 'dd-mm-yyyy'), 280015404);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lennard', 'Secrett', 'Colonel', to_date('01-01-2003', 'dd-mm-yyyy'), 200473707);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Prudy', 'Greatorex', 'Corporal', to_date('19-11-2000', 'dd-mm-yyyy'), 377781748);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hazel', 'Mingotti', 'Corporal', to_date('25-09-1987', 'dd-mm-yyyy'), 375892648);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sally', 'Stockford', 'Lieutenant', to_date('05-05-1992', 'dd-mm-yyyy'), 305122832);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tove', 'Cicccitti', 'General', to_date('17-02-1996', 'dd-mm-yyyy'), 232037345);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maurine', 'Christer', 'Private', to_date('26-03-1984', 'dd-mm-yyyy'), 345265049);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Daven', 'Schwartz', 'General', to_date('01-11-1993', 'dd-mm-yyyy'), 390961408);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Margaret', 'Burdess', 'Major', to_date('06-05-1984', 'dd-mm-yyyy'), 231096004);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eli', 'Champneys', 'Captain', to_date('26-11-1992', 'dd-mm-yyyy'), 202506383);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hannah', 'Balducci', 'Private', to_date('03-10-1992', 'dd-mm-yyyy'), 229582437);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Melamie', 'Landsberg', 'Corporal', to_date('27-11-1992', 'dd-mm-yyyy'), 315399133);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Venus', 'Adriaens', 'Lieutenant', to_date('29-06-1980', 'dd-mm-yyyy'), 395567551);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marylee', 'Barrabeale', 'Captain', to_date('31-08-1996', 'dd-mm-yyyy'), 284300779);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Niven', 'Beckmann', 'Private', to_date('24-06-1982', 'dd-mm-yyyy'), 362587786);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Juliette', 'Dawidowitsch', 'General', to_date('15-08-1987', 'dd-mm-yyyy'), 308712470);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cristy', 'Hucker', 'Captain', to_date('27-12-1991', 'dd-mm-yyyy'), 316938669);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Yance', 'Rookwell', 'Major', to_date('22-04-1984', 'dd-mm-yyyy'), 327466886);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Perrine', 'Beesley', 'Private', to_date('14-01-1993', 'dd-mm-yyyy'), 352406342);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Abbey', 'Emblin', 'Captain', to_date('26-07-1984', 'dd-mm-yyyy'), 339799499);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Henry', 'Couling', 'Private', to_date('21-01-1984', 'dd-mm-yyyy'), 271031383);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lek', 'Calcott', 'Sergeant', to_date('25-08-1999', 'dd-mm-yyyy'), 381339784);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gordie', 'Beaford', 'Captain', to_date('23-08-1980', 'dd-mm-yyyy'), 376444368);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kristine', 'Kemell', 'Corporal', to_date('11-08-1988', 'dd-mm-yyyy'), 250344291);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tucky', 'Cheevers', 'Major', to_date('01-02-1987', 'dd-mm-yyyy'), 247077560);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Andria', 'Briance', 'Corporal', to_date('30-03-1980', 'dd-mm-yyyy'), 334144245);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lawry', 'Feasey', 'General', to_date('17-11-1986', 'dd-mm-yyyy'), 317457927);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emory', 'Vakhlov', 'Sergeant', to_date('05-05-1999', 'dd-mm-yyyy'), 286506962);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Evie', 'Ivel', 'General', to_date('22-05-1996', 'dd-mm-yyyy'), 278310514);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anett', 'Armytage', 'Private', to_date('24-08-1983', 'dd-mm-yyyy'), 300849979);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jandy', 'Bernuzzi', 'General', to_date('04-06-1998', 'dd-mm-yyyy'), 227146613);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Drucy', 'Rodolphe', 'General', to_date('16-01-1996', 'dd-mm-yyyy'), 399429753);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kylie', 'Tamplin', 'Sergeant', to_date('27-01-2001', 'dd-mm-yyyy'), 222831659);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Thorvald', 'Amesbury', 'Sergeant', to_date('08-03-1986', 'dd-mm-yyyy'), 260662391);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aldon', 'Czyz', 'Corporal', to_date('02-04-1998', 'dd-mm-yyyy'), 239169856);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rickert', 'Gelder', 'Sergeant', to_date('28-11-1989', 'dd-mm-yyyy'), 300433417);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wittie', 'Candy', 'Colonel', to_date('16-10-1993', 'dd-mm-yyyy'), 251538887);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rozalin', 'Lapenna', 'General', to_date('19-05-1988', 'dd-mm-yyyy'), 281283799);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dania', 'Busain', 'Private', to_date('13-04-2001', 'dd-mm-yyyy'), 299880973);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('James', 'Chazerand', 'Major', to_date('05-08-1989', 'dd-mm-yyyy'), 370443105);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Barbara', 'Vasyunichev', 'Corporal', to_date('26-01-1994', 'dd-mm-yyyy'), 379808603);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Judy', 'Persitt', 'General', to_date('13-03-1994', 'dd-mm-yyyy'), 294348574);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ferguson', 'Andreoletti', 'Sergeant', to_date('04-12-1988', 'dd-mm-yyyy'), 393978612);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lira', 'Stowell', 'Sergeant', to_date('21-08-1982', 'dd-mm-yyyy'), 250750869);
commit;
prompt 400 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Virgie', 'McIan', 'Colonel', to_date('30-08-1991', 'dd-mm-yyyy'), 210845827);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carlotta', 'Steffans', 'Colonel', to_date('30-04-1999', 'dd-mm-yyyy'), 309820797);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elsinore', 'Salmoni', 'General', to_date('30-10-1992', 'dd-mm-yyyy'), 386850983);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sephira', 'Liver', 'Lieutenant', to_date('09-04-1982', 'dd-mm-yyyy'), 301833832);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Deborah', 'Youdell', 'Corporal', to_date('20-04-1997', 'dd-mm-yyyy'), 361994811);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Frederigo', 'Tilby', 'Sergeant', to_date('13-05-1984', 'dd-mm-yyyy'), 351193035);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Robyn', 'Masding', 'Corporal', to_date('01-02-1989', 'dd-mm-yyyy'), 376252916);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Odie', 'Penwright', 'Sergeant', to_date('23-10-2002', 'dd-mm-yyyy'), 285282479);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alvira', 'Faltskog', 'Major', to_date('29-07-2002', 'dd-mm-yyyy'), 278222021);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ozzie', 'Arundale', 'Major', to_date('21-12-2001', 'dd-mm-yyyy'), 383952335);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lyn', 'Shillito', 'Lieutenant', to_date('28-06-1992', 'dd-mm-yyyy'), 221361227);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lissi', 'Pacht', 'General', to_date('03-12-1980', 'dd-mm-yyyy'), 274160886);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shandeigh', 'McEnhill', 'Sergeant', to_date('31-01-1991', 'dd-mm-yyyy'), 300786395);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bev', 'Lazer', 'Private', to_date('29-10-1984', 'dd-mm-yyyy'), 252867096);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Svend', 'Vann', 'Colonel', to_date('19-11-1987', 'dd-mm-yyyy'), 244569777);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Silvano', 'Dakhov', 'Major', to_date('28-02-2002', 'dd-mm-yyyy'), 205893325);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Clayson', 'Kienlein', 'Major', to_date('22-07-1984', 'dd-mm-yyyy'), 211357219);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hermia', 'Willmot', 'Private', to_date('26-08-1992', 'dd-mm-yyyy'), 213113355);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rollo', 'Schimke', 'Corporal', to_date('05-01-1982', 'dd-mm-yyyy'), 237778114);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lynea', 'Dearlove', 'Lieutenant', to_date('30-06-1993', 'dd-mm-yyyy'), 244493407);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Culver', 'Allatt', 'Sergeant', to_date('25-03-1989', 'dd-mm-yyyy'), 325735592);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Romola', 'Whate', 'Major', to_date('04-08-1983', 'dd-mm-yyyy'), 272748906);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Julina', 'Ohrtmann', 'Lieutenant', to_date('27-06-1994', 'dd-mm-yyyy'), 283071208);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Frankie', 'Dabinett', 'Captain', to_date('09-03-1999', 'dd-mm-yyyy'), 296538924);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Beulah', 'Ashbe', 'Major', to_date('26-11-1988', 'dd-mm-yyyy'), 393547848);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ginelle', 'Cronin', 'Private', to_date('08-05-1993', 'dd-mm-yyyy'), 309640599);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gallard', 'Siely', 'Colonel', to_date('13-07-1999', 'dd-mm-yyyy'), 307570440);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Claudelle', 'Lissaman', 'Captain', to_date('16-10-2000', 'dd-mm-yyyy'), 239379314);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ado', 'Passo', 'Corporal', to_date('04-05-1984', 'dd-mm-yyyy'), 233082662);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Catharina', 'Hurdman', 'Corporal', to_date('23-02-1984', 'dd-mm-yyyy'), 203924458);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Violetta', 'Olwen', 'Major', to_date('01-06-1982', 'dd-mm-yyyy'), 273317894);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aida', 'Proffer', 'General', to_date('08-02-1984', 'dd-mm-yyyy'), 257145485);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shelley', 'Cino', 'Major', to_date('13-10-2003', 'dd-mm-yyyy'), 344643982);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gladi', 'Vidineev', 'Corporal', to_date('31-12-1982', 'dd-mm-yyyy'), 233331336);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rebeka', 'Vlies', 'General', to_date('08-12-1981', 'dd-mm-yyyy'), 231696592);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Derry', 'Enston', 'General', to_date('15-07-1983', 'dd-mm-yyyy'), 380339273);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gelya', 'Dan', 'Corporal', to_date('06-06-1989', 'dd-mm-yyyy'), 311020193);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jesus', 'Aronow', 'Sergeant', to_date('08-06-2000', 'dd-mm-yyyy'), 333197417);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Myrna', 'Ginnell', 'Major', to_date('01-08-1996', 'dd-mm-yyyy'), 240767084);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lizette', 'Chastagnier', 'Corporal', to_date('02-06-1991', 'dd-mm-yyyy'), 266346339);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Benedikt', 'Tarney', 'Captain', to_date('26-11-1984', 'dd-mm-yyyy'), 325256753);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Grazia', 'O''Caherny', 'General', to_date('15-08-1981', 'dd-mm-yyyy'), 328026732);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Torey', 'Tuxill', 'Lieutenant', to_date('24-11-1984', 'dd-mm-yyyy'), 398208315);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Justina', 'Haselup', 'Sergeant', to_date('07-05-2002', 'dd-mm-yyyy'), 364477521);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cobby', 'Silversmidt', 'Captain', to_date('08-07-1997', 'dd-mm-yyyy'), 266739488);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Donny', 'Duran', 'General', to_date('23-12-1991', 'dd-mm-yyyy'), 247243857);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Barbaraanne', 'Crocken', 'Captain', to_date('18-01-1996', 'dd-mm-yyyy'), 241010968);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ingelbert', 'Klainman', 'Captain', to_date('17-05-1980', 'dd-mm-yyyy'), 339622049);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Izak', 'McMenamin', 'Major', to_date('01-10-2000', 'dd-mm-yyyy'), 399099376);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ring', 'De-Ville', 'General', to_date('26-03-2000', 'dd-mm-yyyy'), 346897127);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rosemary', 'Philipet', 'Corporal', to_date('30-03-1993', 'dd-mm-yyyy'), 372886275);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kory', 'Cokayne', 'General', to_date('21-01-1985', 'dd-mm-yyyy'), 303671412);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jessika', 'Bende', 'Colonel', to_date('12-08-1997', 'dd-mm-yyyy'), 320470995);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Flossie', 'Dacke', 'Private', to_date('03-08-1996', 'dd-mm-yyyy'), 370128352);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gertrudis', 'Murford', 'Major', to_date('09-03-1997', 'dd-mm-yyyy'), 263968821);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Thorstein', 'Chazerand', 'Corporal', to_date('15-02-1990', 'dd-mm-yyyy'), 364542944);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Berk', 'Andor', 'Private', to_date('04-08-1981', 'dd-mm-yyyy'), 250453465);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rozele', 'Kellegher', 'Lieutenant', to_date('18-01-1993', 'dd-mm-yyyy'), 383860133);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Demetris', 'Leavold', 'Corporal', to_date('09-03-2001', 'dd-mm-yyyy'), 200387058);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Agnella', 'Milington', 'Sergeant', to_date('03-06-1982', 'dd-mm-yyyy'), 326277215);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lidia', 'Doughartie', 'Sergeant', to_date('26-02-1999', 'dd-mm-yyyy'), 236452747);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cale', 'Jeffree', 'Sergeant', to_date('07-04-1992', 'dd-mm-yyyy'), 227414161);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mason', 'Giddy', 'Captain', to_date('13-10-2002', 'dd-mm-yyyy'), 313956555);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Brose', 'Corbishley', 'Major', to_date('23-06-1984', 'dd-mm-yyyy'), 254672187);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lauren', 'Aime', 'Captain', to_date('09-04-1982', 'dd-mm-yyyy'), 363827194);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Roxana', 'Alekseev', 'Colonel', to_date('25-01-1996', 'dd-mm-yyyy'), 303705104);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jacynth', 'Perle', 'Sergeant', to_date('14-03-1987', 'dd-mm-yyyy'), 301842802);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Briney', 'Lote', 'Private', to_date('27-12-1994', 'dd-mm-yyyy'), 274223134);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Amalia', 'Briers', 'Colonel', to_date('28-10-1983', 'dd-mm-yyyy'), 307630528);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sybil', 'Palfrie', 'Colonel', to_date('25-12-1995', 'dd-mm-yyyy'), 343316197);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ivan', 'Hevey', 'Corporal', to_date('28-04-1992', 'dd-mm-yyyy'), 356938392);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Stephi', 'Connar', 'Corporal', to_date('03-01-1988', 'dd-mm-yyyy'), 283259618);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lonny', 'Redolfi', 'Captain', to_date('21-05-2001', 'dd-mm-yyyy'), 309371344);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Julianna', 'Le Strange', 'Colonel', to_date('04-08-1984', 'dd-mm-yyyy'), 368479535);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Roddie', 'Rouby', 'Captain', to_date('19-08-1982', 'dd-mm-yyyy'), 318306436);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aridatha', 'De Ruggiero', 'Sergeant', to_date('09-05-2002', 'dd-mm-yyyy'), 353706769);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Randie', 'Sich', 'Lieutenant', to_date('08-04-1980', 'dd-mm-yyyy'), 383548055);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Van', 'McFadden', 'Major', to_date('23-03-2003', 'dd-mm-yyyy'), 257366591);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rustie', 'Hellsdon', 'Sergeant', to_date('25-05-1983', 'dd-mm-yyyy'), 368886633);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Matelda', 'Dimnage', 'Sergeant', to_date('04-07-1982', 'dd-mm-yyyy'), 211190842);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eleanor', 'MacCallam', 'Corporal', to_date('29-08-1998', 'dd-mm-yyyy'), 290969200);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hillery', 'Bendin', 'Private', to_date('04-02-1998', 'dd-mm-yyyy'), 281580042);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kamila', 'Reynalds', 'General', to_date('03-04-1990', 'dd-mm-yyyy'), 304268938);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dwight', 'Fishbie', 'General', to_date('04-11-1997', 'dd-mm-yyyy'), 306475991);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Judith', 'Estcourt', 'Sergeant', to_date('20-07-1985', 'dd-mm-yyyy'), 335829214);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Erwin', 'Le Friec', 'General', to_date('10-04-1988', 'dd-mm-yyyy'), 325559062);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Allyson', 'Panton', 'Corporal', to_date('29-03-1980', 'dd-mm-yyyy'), 371215742);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dasha', 'Cuttell', 'Lieutenant', to_date('05-02-1992', 'dd-mm-yyyy'), 253206515);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Langsdon', 'Sawfoot', 'General', to_date('23-01-1994', 'dd-mm-yyyy'), 235335126);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tania', 'Copson', 'Corporal', to_date('17-10-1992', 'dd-mm-yyyy'), 369662083);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emanuele', 'Wheelwright', 'Lieutenant', to_date('07-03-1999', 'dd-mm-yyyy'), 347535911);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Isacco', 'Phebee', 'Lieutenant', to_date('05-01-1993', 'dd-mm-yyyy'), 337933018);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nikolos', 'Corstan', 'Private', to_date('03-05-1996', 'dd-mm-yyyy'), 219833309);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Chan', 'Marusik', 'General', to_date('19-01-1986', 'dd-mm-yyyy'), 395280480);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sheppard', 'Ritter', 'Captain', to_date('21-06-2002', 'dd-mm-yyyy'), 305357497);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dannie', 'Novello', 'Corporal', to_date('26-06-1997', 'dd-mm-yyyy'), 250500388);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Quinn', 'Adan', 'Captain', to_date('14-06-2001', 'dd-mm-yyyy'), 354769587);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jessamyn', 'Layburn', 'Lieutenant', to_date('06-12-1988', 'dd-mm-yyyy'), 237419822);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Melantha', 'Orable', 'Colonel', to_date('18-06-1982', 'dd-mm-yyyy'), 374802399);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gustave', 'Adamovitch', 'Corporal', to_date('12-11-1992', 'dd-mm-yyyy'), 377208276);
commit;
prompt 500 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ajay', 'Peele', 'Lieutenant', to_date('01-02-1999', 'dd-mm-yyyy'), 222888385);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Isadora', 'Deluze', 'General', to_date('18-10-1985', 'dd-mm-yyyy'), 383836814);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Abelard', 'Overstreet', 'Captain', to_date('18-01-1986', 'dd-mm-yyyy'), 287062738);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Corie', 'Vallentin', 'Major', to_date('15-07-1989', 'dd-mm-yyyy'), 285866795);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Brig', 'Siddall', 'Colonel', to_date('06-03-1988', 'dd-mm-yyyy'), 385804654);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tirrell', 'Pippard', 'Sergeant', to_date('19-09-1982', 'dd-mm-yyyy'), 335984445);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Zorina', 'Doghartie', 'General', to_date('16-08-1993', 'dd-mm-yyyy'), 283858458);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Anstice', 'Tander', 'Major', to_date('03-09-1988', 'dd-mm-yyyy'), 244257658);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dudley', 'L''argent', 'Sergeant', to_date('14-09-1991', 'dd-mm-yyyy'), 335847080);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Junie', 'Klimuk', 'Sergeant', to_date('24-03-1980', 'dd-mm-yyyy'), 331728622);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lorin', 'Lukehurst', 'Lieutenant', to_date('21-10-1984', 'dd-mm-yyyy'), 311052814);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Waiter', 'Truluck', 'Private', to_date('14-12-1982', 'dd-mm-yyyy'), 233262480);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fernande', 'Henrion', 'General', to_date('09-10-2003', 'dd-mm-yyyy'), 208362687);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Benjamen', 'Biset', 'Captain', to_date('28-05-1989', 'dd-mm-yyyy'), 238447934);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Simona', 'Turnbull', 'Lieutenant', to_date('08-06-1994', 'dd-mm-yyyy'), 279524736);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nils', 'Pinnigar', 'Lieutenant', to_date('15-06-1998', 'dd-mm-yyyy'), 272115809);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alisun', 'Irnis', 'Private', to_date('06-07-1998', 'dd-mm-yyyy'), 337080029);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dorey', 'Prestage', 'Corporal', to_date('13-07-1985', 'dd-mm-yyyy'), 395651246);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Stearne', 'Brandts', 'Corporal', to_date('31-10-1981', 'dd-mm-yyyy'), 356650648);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Michelina', 'Tanguy', 'Private', to_date('04-09-1992', 'dd-mm-yyyy'), 325413907);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shelby', 'Vannini', 'Lieutenant', to_date('20-02-1980', 'dd-mm-yyyy'), 270779920);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alberik', 'Rubinowitch', 'Private', to_date('21-08-1980', 'dd-mm-yyyy'), 281928641);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Daniella', 'Boxer', 'Major', to_date('05-12-2002', 'dd-mm-yyyy'), 338229439);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Agnes', 'Hurl', 'Private', to_date('07-02-1987', 'dd-mm-yyyy'), 336686279);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kaila', 'Dooler', 'Colonel', to_date('14-11-1982', 'dd-mm-yyyy'), 231274183);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Liza', 'Bolton', 'Major', to_date('12-06-1991', 'dd-mm-yyyy'), 209698295);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Arnuad', 'Filkov', 'Captain', to_date('18-10-2001', 'dd-mm-yyyy'), 265392648);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marcellina', 'Beekman', 'Lieutenant', to_date('05-11-1984', 'dd-mm-yyyy'), 236701923);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Neala', 'Skeffington', 'General', to_date('09-01-1996', 'dd-mm-yyyy'), 336272706);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dedra', 'Selliman', 'Major', to_date('03-12-1989', 'dd-mm-yyyy'), 352638775);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gonzalo', 'Lesmonde', 'Captain', to_date('11-06-1991', 'dd-mm-yyyy'), 256155234);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hobard', 'Haggarth', 'Private', to_date('30-01-1980', 'dd-mm-yyyy'), 257746076);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Genni', 'Neathway', 'Corporal', to_date('11-12-2000', 'dd-mm-yyyy'), 375209729);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pauli', 'Rider', 'Sergeant', to_date('03-01-1985', 'dd-mm-yyyy'), 272987663);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fanechka', 'Troillet', 'Captain', to_date('09-11-1989', 'dd-mm-yyyy'), 212878020);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gena', 'Wraith', 'Captain', to_date('09-05-2003', 'dd-mm-yyyy'), 206651299);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pippo', 'Yesinin', 'Major', to_date('23-03-1988', 'dd-mm-yyyy'), 282561272);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Katheryn', 'Gurys', 'Colonel', to_date('23-06-1998', 'dd-mm-yyyy'), 228952988);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Preston', 'Elmes', 'Corporal', to_date('19-07-1988', 'dd-mm-yyyy'), 361783956);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Blancha', 'Howsam', 'Lieutenant', to_date('09-06-1981', 'dd-mm-yyyy'), 370301271);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Yasmeen', 'Ibbitson', 'Major', to_date('11-07-1983', 'dd-mm-yyyy'), 334784654);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bryon', 'Dagger', 'Colonel', to_date('26-11-1983', 'dd-mm-yyyy'), 230322450);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lester', 'Aspel', 'Major', to_date('04-05-1984', 'dd-mm-yyyy'), 241196716);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marilyn', 'Ridgley', 'Major', to_date('28-07-1984', 'dd-mm-yyyy'), 205236470);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Keene', 'Pepperell', 'Private', to_date('08-11-1984', 'dd-mm-yyyy'), 270557935);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Evie', 'Roebuck', 'Colonel', to_date('13-04-1990', 'dd-mm-yyyy'), 307254506);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jacqui', 'Boyce', 'Captain', to_date('16-03-2000', 'dd-mm-yyyy'), 331236554);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Karyl', 'Jados', 'Corporal', to_date('25-04-1998', 'dd-mm-yyyy'), 245818731);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Melvyn', 'Skipperbottom', 'Colonel', to_date('07-02-1991', 'dd-mm-yyyy'), 265547298);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Iolanthe', 'Wornum', 'Lieutenant', to_date('01-03-1996', 'dd-mm-yyyy'), 347067953);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Iormina', 'Raynor', 'General', to_date('19-09-2000', 'dd-mm-yyyy'), 308107908);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fred', 'Kondratenya', 'Lieutenant', to_date('25-04-1988', 'dd-mm-yyyy'), 298006662);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Devi', 'Lockner', 'Lieutenant', to_date('17-12-1998', 'dd-mm-yyyy'), 333950047);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gibbie', 'Foxon', 'Lieutenant', to_date('16-08-1993', 'dd-mm-yyyy'), 244732500);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kessiah', 'Hirsch', 'Colonel', to_date('24-02-1994', 'dd-mm-yyyy'), 235130780);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marty', 'Fenix', 'Major', to_date('25-09-2000', 'dd-mm-yyyy'), 278864964);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pete', 'Pedroli', 'Colonel', to_date('08-11-1997', 'dd-mm-yyyy'), 223346749);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gratiana', 'Rawdales', 'Captain', to_date('21-01-1996', 'dd-mm-yyyy'), 244857843);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Somerset', 'Durtnell', 'Major', to_date('13-11-1988', 'dd-mm-yyyy'), 211679520);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Crosby', 'Joynes', 'Colonel', to_date('09-07-1988', 'dd-mm-yyyy'), 367850455);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Courtney', 'Albutt', 'General', to_date('14-06-1980', 'dd-mm-yyyy'), 351043069);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Stepha', 'Kenna', 'Colonel', to_date('21-01-1983', 'dd-mm-yyyy'), 365058142);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Giffie', 'Hendin', 'Captain', to_date('25-05-1987', 'dd-mm-yyyy'), 274052509);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lorine', 'Catley', 'Captain', to_date('16-03-1989', 'dd-mm-yyyy'), 290714294);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ashby', 'McGrowther', 'Colonel', to_date('01-12-1999', 'dd-mm-yyyy'), 338146884);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dona', 'McGarrity', 'Lieutenant', to_date('21-11-1997', 'dd-mm-yyyy'), 225087331);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Codie', 'Cuer', 'Lieutenant', to_date('19-11-2002', 'dd-mm-yyyy'), 316243493);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Robin', 'Bentjens', 'Colonel', to_date('08-07-1996', 'dd-mm-yyyy'), 237409965);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jillana', 'Klaiser', 'Sergeant', to_date('29-05-1997', 'dd-mm-yyyy'), 259673490);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Westbrooke', 'Zammitt', 'General', to_date('13-09-1983', 'dd-mm-yyyy'), 237581407);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Casey', 'Goodacre', 'Private', to_date('22-09-1989', 'dd-mm-yyyy'), 373756218);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Solomon', 'Bimrose', 'Corporal', to_date('13-09-1990', 'dd-mm-yyyy'), 327711468);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Octavia', 'Louca', 'Sergeant', to_date('21-02-2000', 'dd-mm-yyyy'), 344387598);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Waldo', 'Strewthers', 'General', to_date('09-08-2003', 'dd-mm-yyyy'), 302642076);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Joceline', 'Tuohy', 'General', to_date('01-11-1980', 'dd-mm-yyyy'), 328578554);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Loralee', 'Wainscot', 'Lieutenant', to_date('26-01-1988', 'dd-mm-yyyy'), 222947149);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Flore', 'Cowans', 'Major', to_date('30-09-1980', 'dd-mm-yyyy'), 378912456);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Devi', 'Bignall', 'Sergeant', to_date('14-05-1992', 'dd-mm-yyyy'), 325860082);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Renie', 'Middlemist', 'Corporal', to_date('23-05-1992', 'dd-mm-yyyy'), 293735930);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ritchie', 'Pollack', 'Captain', to_date('23-01-1993', 'dd-mm-yyyy'), 307955613);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jillane', 'Carbin', 'Private', to_date('30-10-1989', 'dd-mm-yyyy'), 245559396);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Claudianus', 'Gagan', 'Major', to_date('29-03-1990', 'dd-mm-yyyy'), 262316659);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Boothe', 'Brunton', 'Captain', to_date('12-10-1998', 'dd-mm-yyyy'), 239213755);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alexis', 'Suffield', 'Lieutenant', to_date('21-10-1981', 'dd-mm-yyyy'), 284951591);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cloe', 'Buck', 'Corporal', to_date('04-12-1999', 'dd-mm-yyyy'), 241625873);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jennica', 'Fludgate', 'Lieutenant', to_date('25-03-1981', 'dd-mm-yyyy'), 215783297);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Betsy', 'Kikke', 'Sergeant', to_date('10-02-1994', 'dd-mm-yyyy'), 283956186);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lorianna', 'Dudill', 'Sergeant', to_date('08-09-1992', 'dd-mm-yyyy'), 228614816);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emyle', 'Giron', 'General', to_date('27-03-2000', 'dd-mm-yyyy'), 210445937);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Philbert', 'Petto', 'Sergeant', to_date('19-06-1990', 'dd-mm-yyyy'), 249543773);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mela', 'Thompstone', 'Sergeant', to_date('18-04-1982', 'dd-mm-yyyy'), 276949346);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jacklin', 'Slessar', 'Corporal', to_date('02-08-1991', 'dd-mm-yyyy'), 293961478);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Leontyne', 'Longmaid', 'Sergeant', to_date('14-05-1997', 'dd-mm-yyyy'), 260900474);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hussein', 'Timewell', 'Corporal', to_date('14-12-1980', 'dd-mm-yyyy'), 209040130);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Herminia', 'Dodgshon', 'Colonel', to_date('30-04-1993', 'dd-mm-yyyy'), 336031507);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lea', 'Leitche', 'Corporal', to_date('30-08-1984', 'dd-mm-yyyy'), 208249542);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Glenine', 'Dimock', 'General', to_date('06-11-1993', 'dd-mm-yyyy'), 221019615);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lind', 'Kirkam', 'Private', to_date('04-07-1987', 'dd-mm-yyyy'), 359797310);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gordie', 'Teeney', 'Sergeant', to_date('17-10-1987', 'dd-mm-yyyy'), 283336932);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Travers', 'Hartridge', 'Captain', to_date('16-10-2003', 'dd-mm-yyyy'), 276332120);
commit;
prompt 600 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wiatt', 'Pavel', 'Sergeant', to_date('09-07-1988', 'dd-mm-yyyy'), 292244714);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jeannine', 'Dugood', 'Sergeant', to_date('04-03-1981', 'dd-mm-yyyy'), 398872942);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Courtenay', 'Caulket', 'Colonel', to_date('07-01-1985', 'dd-mm-yyyy'), 230198185);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rochella', 'Swinerd', 'Captain', to_date('21-04-1994', 'dd-mm-yyyy'), 279249032);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cyb', 'Tinmouth', 'Corporal', to_date('02-02-1997', 'dd-mm-yyyy'), 290929479);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gertrud', 'Tremellier', 'Private', to_date('13-03-1995', 'dd-mm-yyyy'), 367853431);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kerr', 'Delacote', 'Corporal', to_date('03-01-1995', 'dd-mm-yyyy'), 283130641);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Matilde', 'Troughton', 'Major', to_date('24-12-1989', 'dd-mm-yyyy'), 307188719);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Leonie', 'Ascroft', 'Colonel', to_date('12-01-1991', 'dd-mm-yyyy'), 313050675);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Reggi', 'Jencken', 'Corporal', to_date('02-10-1981', 'dd-mm-yyyy'), 384566638);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Camellia', 'De Blase', 'General', to_date('07-03-1996', 'dd-mm-yyyy'), 289957341);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elli', 'Wodeland', 'Captain', to_date('08-06-2002', 'dd-mm-yyyy'), 261514186);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Trudey', 'Buessen', 'Colonel', to_date('25-08-1992', 'dd-mm-yyyy'), 368690531);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Farly', 'Simmill', 'Captain', to_date('26-09-1996', 'dd-mm-yyyy'), 383968040);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ilario', 'Glayzer', 'Colonel', to_date('12-12-1981', 'dd-mm-yyyy'), 280016749);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Casar', 'Standfield', 'Captain', to_date('04-01-1989', 'dd-mm-yyyy'), 276830981);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ophelia', 'Oldacres', 'Lieutenant', to_date('25-09-1989', 'dd-mm-yyyy'), 273381701);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dode', 'Corbie', 'Colonel', to_date('25-02-1989', 'dd-mm-yyyy'), 206247058);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nickolaus', 'Korneluk', 'Sergeant', to_date('06-04-1991', 'dd-mm-yyyy'), 261685997);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Joni', 'Blas', 'Lieutenant', to_date('15-12-1980', 'dd-mm-yyyy'), 249562512);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Willard', 'Cisec', 'Private', to_date('12-09-1988', 'dd-mm-yyyy'), 345556162);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rania', 'Steers', 'Colonel', to_date('04-06-2002', 'dd-mm-yyyy'), 221000440);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Devi', 'Mullen', 'Corporal', to_date('01-08-1993', 'dd-mm-yyyy'), 267631250);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gilbertina', 'Van Der Walt', 'Private', to_date('17-05-2002', 'dd-mm-yyyy'), 212047739);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Timoteo', 'Cookman', 'Corporal', to_date('08-02-2002', 'dd-mm-yyyy'), 306568053);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Riordan', 'Arent', 'Captain', to_date('17-12-1992', 'dd-mm-yyyy'), 226550059);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Germaine', 'Jenyns', 'Corporal', to_date('29-03-1998', 'dd-mm-yyyy'), 335534944);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Christi', 'Piddlehinton', 'Colonel', to_date('08-01-1985', 'dd-mm-yyyy'), 394195602);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Flor', 'McReedy', 'Private', to_date('23-08-1994', 'dd-mm-yyyy'), 330837622);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carolina', 'Feighney', 'Sergeant', to_date('09-12-1980', 'dd-mm-yyyy'), 290011356);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Layla', 'GiacobbiniJacob', 'Captain', to_date('22-07-1990', 'dd-mm-yyyy'), 201428401);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fey', 'Kildea', 'Captain', to_date('03-07-2000', 'dd-mm-yyyy'), 388437948);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nilson', 'Tippell', 'Captain', to_date('10-12-1983', 'dd-mm-yyyy'), 396546390);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Prinz', 'Tokley', 'Captain', to_date('20-05-1981', 'dd-mm-yyyy'), 364211743);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tildie', 'Gonnin', 'Lieutenant', to_date('18-02-2001', 'dd-mm-yyyy'), 351051039);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Collie', 'Domleo', 'Lieutenant', to_date('12-08-1990', 'dd-mm-yyyy'), 251953975);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Marjorie', 'Iiannoni', 'Major', to_date('09-11-1993', 'dd-mm-yyyy'), 263023363);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Perice', 'Reville', 'Private', to_date('04-05-1992', 'dd-mm-yyyy'), 306014639);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pepito', 'Fautley', 'Lieutenant', to_date('21-04-2000', 'dd-mm-yyyy'), 206361434);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ximenez', 'Grigoriev', 'Private', to_date('23-05-1997', 'dd-mm-yyyy'), 364109698);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cece', 'Pattullo', 'Captain', to_date('30-01-2001', 'dd-mm-yyyy'), 224256534);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ronny', 'Wearne', 'Sergeant', to_date('27-01-2001', 'dd-mm-yyyy'), 336124367);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maribel', 'Gilbard', 'Colonel', to_date('13-08-1987', 'dd-mm-yyyy'), 393576835);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wang', 'Paolotto', 'Sergeant', to_date('05-12-1988', 'dd-mm-yyyy'), 377221779);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kathrine', 'Mc Giffin', 'Captain', to_date('11-07-2003', 'dd-mm-yyyy'), 301644116);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cherianne', 'Zanussii', 'Major', to_date('10-09-1981', 'dd-mm-yyyy'), 320595981);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Abeu', 'Giorgielli', 'General', to_date('05-07-1991', 'dd-mm-yyyy'), 234815710);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kimberli', 'Singyard', 'Lieutenant', to_date('21-01-1997', 'dd-mm-yyyy'), 227460641);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kenon', 'Gallyon', 'Captain', to_date('26-11-1987', 'dd-mm-yyyy'), 361977936);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lyell', 'Skinn', 'Private', to_date('02-01-1986', 'dd-mm-yyyy'), 327502045);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elnar', 'Jagielski', 'Colonel', to_date('26-07-1988', 'dd-mm-yyyy'), 255709716);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Natty', 'Marciek', 'Private', to_date('29-10-2002', 'dd-mm-yyyy'), 245768993);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Deeyn', 'Glasner', 'Private', to_date('24-06-1987', 'dd-mm-yyyy'), 235698590);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cori', 'Egle of Germany', 'Colonel', to_date('01-04-1988', 'dd-mm-yyyy'), 317793093);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sheree', 'Beckhouse', 'Private', to_date('22-09-1986', 'dd-mm-yyyy'), 205547055);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nicko', 'Ritchard', 'Major', to_date('07-11-1994', 'dd-mm-yyyy'), 387208027);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Stanleigh', 'Kime', 'Sergeant', to_date('27-01-1999', 'dd-mm-yyyy'), 294015557);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Thebault', 'Gonzales', 'General', to_date('13-01-1997', 'dd-mm-yyyy'), 346428021);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wallis', 'Ponton', 'Captain', to_date('01-06-1994', 'dd-mm-yyyy'), 353158185);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Brandais', 'Di Ruggero', 'General', to_date('25-06-1996', 'dd-mm-yyyy'), 348480389);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elle', 'Halse', 'Colonel', to_date('27-02-1991', 'dd-mm-yyyy'), 384941375);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Benedict', 'Stubbs', 'Colonel', to_date('27-12-1984', 'dd-mm-yyyy'), 347293499);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jyoti', 'Wilce', 'General', to_date('24-04-1981', 'dd-mm-yyyy'), 376458243);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Alica', 'Franchyonok', 'Corporal', to_date('05-12-1994', 'dd-mm-yyyy'), 304858692);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dave', 'Haquard', 'Colonel', to_date('01-12-2000', 'dd-mm-yyyy'), 345683133);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Adriaens', 'Spirritt', 'Lieutenant', to_date('11-01-1993', 'dd-mm-yyyy'), 351821660);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Krystalle', 'Jerche', 'Corporal', to_date('01-11-1981', 'dd-mm-yyyy'), 310919947);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kiley', 'Reeman', 'General', to_date('02-06-1999', 'dd-mm-yyyy'), 262759003);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Chantal', 'Vagges', 'Corporal', to_date('01-08-1988', 'dd-mm-yyyy'), 343660024);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Barnie', 'Bruinsma', 'Lieutenant', to_date('07-07-1980', 'dd-mm-yyyy'), 316206767);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lesya', 'Moynham', 'Private', to_date('15-10-1996', 'dd-mm-yyyy'), 397535264);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Artie', 'Bright', 'Major', to_date('25-02-1986', 'dd-mm-yyyy'), 213342450);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Christina', 'Collingham', 'Private', to_date('07-07-1984', 'dd-mm-yyyy'), 285047907);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Sadella', 'Whimpenny', 'Colonel', to_date('13-08-1987', 'dd-mm-yyyy'), 355595286);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Euell', 'Veasey', 'Captain', to_date('07-12-1985', 'dd-mm-yyyy'), 396377663);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Frederica', 'Boddie', 'Sergeant', to_date('24-12-1995', 'dd-mm-yyyy'), 365715213);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Web', 'Pringer', 'Major', to_date('01-08-1994', 'dd-mm-yyyy'), 254663078);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dre', 'Sipson', 'Corporal', to_date('01-04-1985', 'dd-mm-yyyy'), 365008432);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Arney', 'Lindores', 'Corporal', to_date('03-03-2002', 'dd-mm-yyyy'), 347669157);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Puff', 'Goodwyn', 'Sergeant', to_date('27-11-2002', 'dd-mm-yyyy'), 308147725);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Clary', 'Farnin', 'Captain', to_date('14-01-2000', 'dd-mm-yyyy'), 262179843);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jaclyn', 'Twiggins', 'Major', to_date('22-07-1981', 'dd-mm-yyyy'), 218910229);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Enrica', 'Mozzini', 'Captain', to_date('24-02-2001', 'dd-mm-yyyy'), 255277263);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Latrina', 'Beet', 'Corporal', to_date('23-11-1993', 'dd-mm-yyyy'), 269283221);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dorene', 'Sproule', 'Corporal', to_date('27-06-1981', 'dd-mm-yyyy'), 346845087);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Flynn', 'Bleything', 'Colonel', to_date('30-07-1988', 'dd-mm-yyyy'), 218270200);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Carlynne', 'Beddon', 'Major', to_date('18-09-1997', 'dd-mm-yyyy'), 342323455);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Berta', 'Maghull', 'Lieutenant', to_date('16-02-1993', 'dd-mm-yyyy'), 327854292);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Martino', 'Renzullo', 'General', to_date('02-05-1992', 'dd-mm-yyyy'), 216132990);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Margery', 'Iorillo', 'Captain', to_date('27-06-1984', 'dd-mm-yyyy'), 372822728);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Colet', 'Gosnold', 'Major', to_date('18-10-1989', 'dd-mm-yyyy'), 291492297);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Saxe', 'Yurkiewicz', 'Lieutenant', to_date('09-10-1991', 'dd-mm-yyyy'), 218309845);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gregor', 'Horsburgh', 'Private', to_date('16-08-2000', 'dd-mm-yyyy'), 247097361);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lani', 'Bishell', 'Corporal', to_date('22-05-1993', 'dd-mm-yyyy'), 296689914);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Idette', 'Oris', 'Sergeant', to_date('25-11-1987', 'dd-mm-yyyy'), 328741784);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cobby', 'Carnegie', 'Private', to_date('20-12-1987', 'dd-mm-yyyy'), 268173055);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Christyna', 'Warren', 'General', to_date('01-11-1999', 'dd-mm-yyyy'), 248603389);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Thoma', 'Bass', 'General', to_date('19-07-1997', 'dd-mm-yyyy'), 241998248);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Denise', 'Shuter', 'Private', to_date('10-03-1988', 'dd-mm-yyyy'), 325848256);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jinny', 'Feighney', 'Private', to_date('06-09-1993', 'dd-mm-yyyy'), 213562417);
commit;
prompt 700 records committed...
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Karita', 'Menci', 'Lieutenant', to_date('24-11-1997', 'dd-mm-yyyy'), 297763975);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Padraic', 'Quarless', 'Sergeant', to_date('01-02-1981', 'dd-mm-yyyy'), 277426304);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Darius', 'Nerney', 'Corporal', to_date('16-10-1985', 'dd-mm-yyyy'), 361096272);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Andrej', 'Wallas', 'Colonel', to_date('14-06-1986', 'dd-mm-yyyy'), 366538470);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Harriett', 'Goult', 'Private', to_date('24-01-1983', 'dd-mm-yyyy'), 393358177);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Silvie', 'Thorington', 'General', to_date('08-09-1982', 'dd-mm-yyyy'), 317262044);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fidela', 'Ponting', 'Lieutenant', to_date('01-02-1988', 'dd-mm-yyyy'), 218102535);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rea', 'Romans', 'Lieutenant', to_date('26-04-1998', 'dd-mm-yyyy'), 275791974);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nester', 'Janjic', 'Colonel', to_date('28-02-2002', 'dd-mm-yyyy'), 343041424);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tyrus', 'Vaudin', 'General', to_date('06-01-1999', 'dd-mm-yyyy'), 293249932);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Eileen', 'Rossborough', 'Captain', to_date('03-01-2002', 'dd-mm-yyyy'), 255094739);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Robinet', 'Wilcox', 'Colonel', to_date('15-01-1981', 'dd-mm-yyyy'), 264970298);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Meris', 'Clementson', 'Colonel', to_date('29-11-1992', 'dd-mm-yyyy'), 301780879);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kristan', 'Beeston', 'General', to_date('12-08-2001', 'dd-mm-yyyy'), 352054150);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Horton', 'Massinger', 'Major', to_date('16-05-2003', 'dd-mm-yyyy'), 277799386);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dido', 'Grieswood', 'Corporal', to_date('10-06-1982', 'dd-mm-yyyy'), 326747654);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Gaven', 'Safell', 'Captain', to_date('21-04-1993', 'dd-mm-yyyy'), 274254359);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tildy', 'Torbeck', 'Captain', to_date('30-05-1992', 'dd-mm-yyyy'), 388333169);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Adena', 'Mityakov', 'Captain', to_date('11-10-1986', 'dd-mm-yyyy'), 271298547);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tabina', 'Braidwood', 'Private', to_date('09-06-2001', 'dd-mm-yyyy'), 295623646);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elwood', 'Cawthorn', 'General', to_date('15-04-1986', 'dd-mm-yyyy'), 243775536);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Davin', 'Jacmard', 'Colonel', to_date('01-09-1984', 'dd-mm-yyyy'), 367770020);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Beret', 'Mesant', 'Sergeant', to_date('01-04-1980', 'dd-mm-yyyy'), 323370729);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Maritsa', 'Ferrino', 'Corporal', to_date('26-07-1988', 'dd-mm-yyyy'), 378833614);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shandra', 'Hewlings', 'Captain', to_date('09-03-1995', 'dd-mm-yyyy'), 369064381);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nevile', 'Van Dale', 'Sergeant', to_date('23-10-1991', 'dd-mm-yyyy'), 318494144);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Allyce', 'Gerran', 'Major', to_date('01-01-1995', 'dd-mm-yyyy'), 274349753);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jordan', 'Moret', 'Sergeant', to_date('14-04-1981', 'dd-mm-yyyy'), 309351990);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Elsie', 'Plover', 'Major', to_date('24-06-1983', 'dd-mm-yyyy'), 209002775);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rosemarie', 'Neild', 'Captain', to_date('27-05-2002', 'dd-mm-yyyy'), 231348871);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Julian', 'Caillou', 'Corporal', to_date('21-08-1983', 'dd-mm-yyyy'), 203807353);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Keven', 'Benzies', 'Private', to_date('04-11-1983', 'dd-mm-yyyy'), 357337798);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Siobhan', 'Dumelow', 'Corporal', to_date('26-10-1986', 'dd-mm-yyyy'), 381134451);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ulises', 'Dymond', 'Captain', to_date('31-10-1981', 'dd-mm-yyyy'), 338377247);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Andie', 'Canfer', 'Corporal', to_date('09-01-1987', 'dd-mm-yyyy'), 396441230);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lombard', 'Arkle', 'Major', to_date('11-12-1984', 'dd-mm-yyyy'), 385610136);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Norman', 'Bellinger', 'Private', to_date('06-06-1994', 'dd-mm-yyyy'), 368723995);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Chloe', 'Ucceli', 'Corporal', to_date('26-01-1992', 'dd-mm-yyyy'), 360294496);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Waylen', 'Ridehalgh', 'Lieutenant', to_date('26-06-1989', 'dd-mm-yyyy'), 237914383);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Wally', 'Simionato', 'Private', to_date('21-07-1980', 'dd-mm-yyyy'), 371877932);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Zackariah', 'Pedler', 'Major', to_date('24-05-2003', 'dd-mm-yyyy'), 381229567);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ethe', 'Bruinsma', 'Major', to_date('29-03-1986', 'dd-mm-yyyy'), 392943424);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Edita', 'Janus', 'Major', to_date('17-06-1988', 'dd-mm-yyyy'), 397670262);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Allis', 'Peel', 'General', to_date('15-02-1984', 'dd-mm-yyyy'), 281343404);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hodge', 'Cantos', 'General', to_date('25-01-1987', 'dd-mm-yyyy'), 389517031);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Hall', 'Treker', 'Major', to_date('28-12-2003', 'dd-mm-yyyy'), 386623888);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Etan', 'Sictornes', 'Major', to_date('26-08-1991', 'dd-mm-yyyy'), 220958338);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Angelique', 'Mathers', 'Colonel', to_date('01-10-1998', 'dd-mm-yyyy'), 368627783);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Emmy', 'Barge', 'Major', to_date('31-08-1997', 'dd-mm-yyyy'), 386325549);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Valerie', 'Normanton', 'Major', to_date('22-09-1980', 'dd-mm-yyyy'), 281612412);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Philbert', 'Ivermee', 'Captain', to_date('18-01-1987', 'dd-mm-yyyy'), 222825630);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shantee', 'Libreros', 'Captain', to_date('27-05-1980', 'dd-mm-yyyy'), 228594598);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rowen', 'Sturge', 'Lieutenant', to_date('02-08-1980', 'dd-mm-yyyy'), 254316764);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Fredericka', 'Gianasi', 'Private', to_date('30-03-2001', 'dd-mm-yyyy'), 264228011);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kingston', 'Creeghan', 'Captain', to_date('17-11-2001', 'dd-mm-yyyy'), 263020646);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Vickie', 'De Coursey', 'General', to_date('09-10-1981', 'dd-mm-yyyy'), 288329113);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Aguistin', 'Pietzner', 'Captain', to_date('26-08-2001', 'dd-mm-yyyy'), 251024518);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Patti', 'Philipot', 'Colonel', to_date('14-06-1984', 'dd-mm-yyyy'), 339436379);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Riannon', 'Janousek', 'Major', to_date('08-08-2000', 'dd-mm-yyyy'), 350317207);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Torrence', 'Reims', 'Captain', to_date('24-02-1997', 'dd-mm-yyyy'), 242703125);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Herby', 'Hulks', 'Captain', to_date('13-01-1987', 'dd-mm-yyyy'), 287653764);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Merell', 'Salling', 'Major', to_date('21-05-1982', 'dd-mm-yyyy'), 242717208);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Shawn', 'Bounds', 'Lieutenant', to_date('23-05-1994', 'dd-mm-yyyy'), 270454008);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Vivianna', 'Gandar', 'Private', to_date('06-08-1995', 'dd-mm-yyyy'), 345490732);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Babette', 'Byres', 'Major', to_date('23-09-1986', 'dd-mm-yyyy'), 363548957);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Drugi', 'Aulsford', 'Private', to_date('05-07-1997', 'dd-mm-yyyy'), 204642542);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Blane', 'Castello', 'Private', to_date('30-12-2003', 'dd-mm-yyyy'), 308991986);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jakob', 'Osgorby', 'General', to_date('28-04-1990', 'dd-mm-yyyy'), 271165297);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Thorsten', 'Zanicchelli', 'Corporal', to_date('11-01-1995', 'dd-mm-yyyy'), 290472808);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ingamar', 'Meo', 'Captain', to_date('26-06-1981', 'dd-mm-yyyy'), 365255583);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jerald', 'Ivanikov', 'Private', to_date('22-01-1998', 'dd-mm-yyyy'), 297281835);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Audra', 'Wathan', 'Sergeant', to_date('08-01-1999', 'dd-mm-yyyy'), 216675905);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Violette', 'Beves', 'Colonel', to_date('29-03-1997', 'dd-mm-yyyy'), 232814448);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Giovanna', 'Semour', 'Lieutenant', to_date('06-07-1981', 'dd-mm-yyyy'), 204080690);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Lisette', 'Woolmer', 'Captain', to_date('26-12-1985', 'dd-mm-yyyy'), 285269724);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Tootsie', 'Jacqueminot', 'Private', to_date('19-03-1990', 'dd-mm-yyyy'), 389987678);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cally', 'Dallicott', 'Lieutenant', to_date('30-08-1995', 'dd-mm-yyyy'), 218886775);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kenon', 'Fere', 'Major', to_date('27-09-1998', 'dd-mm-yyyy'), 271073001);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Erek', 'Speller', 'Sergeant', to_date('19-11-1995', 'dd-mm-yyyy'), 380419023);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Orel', 'Chappelle', 'Colonel', to_date('31-10-1987', 'dd-mm-yyyy'), 358134629);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Zulema', 'Balnave', 'Private', to_date('17-08-1993', 'dd-mm-yyyy'), 239709592);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Mallory', 'Taylorson', 'Colonel', to_date('06-12-2003', 'dd-mm-yyyy'), 398329048);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Cesare', 'Matcham', 'Private', to_date('16-05-1995', 'dd-mm-yyyy'), 269988693);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Bartlett', 'Merryweather', 'Captain', to_date('13-05-1989', 'dd-mm-yyyy'), 239892364);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Melli', 'Garfath', 'Corporal', to_date('14-02-1998', 'dd-mm-yyyy'), 231953943);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Joye', 'Bourtoumieux', 'Corporal', to_date('06-06-2000', 'dd-mm-yyyy'), 394372003);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Kimball', 'Frankling', 'Sergeant', to_date('18-10-2002', 'dd-mm-yyyy'), 310268741);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Nicky', 'Jarrell', 'Sergeant', to_date('03-04-1987', 'dd-mm-yyyy'), 380683529);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Dunstan', 'Forcade', 'Private', to_date('19-06-1980', 'dd-mm-yyyy'), 249451886);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Felice', 'Swinden', 'Corporal', to_date('13-09-2000', 'dd-mm-yyyy'), 345037567);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Andy', 'Issatt', 'Corporal', to_date('20-04-1980', 'dd-mm-yyyy'), 309796962);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Beverie', 'Winterscale', 'Private', to_date('18-06-1996', 'dd-mm-yyyy'), 353066547);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Jarvis', 'Fosher', 'Sergeant', to_date('02-01-1992', 'dd-mm-yyyy'), 392036198);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Roth', 'Janous', 'Private', to_date('06-01-1983', 'dd-mm-yyyy'), 250858754);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Euell', 'Breinlein', 'Captain', to_date('14-03-2002', 'dd-mm-yyyy'), 238531970);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Pieter', 'Royston', 'Corporal', to_date('26-10-1985', 'dd-mm-yyyy'), 327682581);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Manda', 'Tissington', 'Lieutenant', to_date('02-10-2003', 'dd-mm-yyyy'), 312913960);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Andee', 'Trodden', 'Major', to_date('05-01-1980', 'dd-mm-yyyy'), 254992151);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Rosy', 'Langfat', 'General', to_date('05-08-2001', 'dd-mm-yyyy'), 282602391);
insert into SOLDIER (first_name, last_name, rank, birthdate, id)
values ('Ignacio', 'Tolerton', 'Major', to_date('23-02-1988', 'dd-mm-yyyy'), 312292157);
commit;
prompt 800 records loaded
prompt Loading PILOT...
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (300433417, 'UAV', 22407, 'Raven', 456482);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377796619, 'Plane', 49751, 'Bane', 122065);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (320595981, 'UAV', 23045, 'Raven', 310912);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (344387598, 'Plane', 41409, 'Hex', 855726);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (360828946, 'Plane', 23915, 'Grim', 522455);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (356112409, 'UAV', 16130, 'Raven', 949752);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368723995, 'Plane', 34467, 'Vex', 481873);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (298579995, 'UAV', 5192, 'Grim', 657250);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (397535264, 'Plane', 35770, 'Vex', 887415);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (312913960, 'Plane', 9233, 'Raven', 359300);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (371877932, 'UAV', 2735, 'Hex', 960954);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393121842, 'UAV', 24057, 'Hex', 739845);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (332326972, 'UAV', 23326, 'Bane', 265044);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368627783, 'UAV', 43958, 'Raven', 293094);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393547848, 'UAV', 25591, 'Hex', 220633);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (299034698, 'Plane', 23719, 'Hex', 140849);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361977936, 'UAV', 1618, 'Vex', 405277);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (313452626, 'UAV', 36900, 'Vex', 855726);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (310184020, 'Plane', 42060, 'Vex', 503065);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (365058142, 'Plane', 21359, 'Vex', 424623);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (326277215, 'UAV', 38814, 'Raven', 492956);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (395280480, 'Plane', 32271, 'Raven', 182669);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (360294496, 'Plane', 23579, 'Raven', 861867);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (309796962, 'Plane', 35528, 'Grim', 890497);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (333197417, 'Plane', 42752, 'Grim', 530928);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (303671412, 'UAV', 1552, 'Hex', 488965);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (399429753, 'UAV', 27774, 'Hex', 931670);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (369662083, 'Plane', 23121, 'Bane', 828586);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318306436, 'Plane', 16708, 'Bane', 787131);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (298006662, 'Plane', 37546, 'Vex', 706395);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (381339784, 'Plane', 3023, 'Vex', 572594);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393814153, 'UAV', 28659, 'Vex', 638308);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (334784654, 'UAV', 42002, 'Grim', 712373);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (305522844, 'UAV', 45063, 'Raven', 522455);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (339622049, 'Plane', 40805, 'Vex', 236721);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (386850983, 'UAV', 17333, 'Vex', 755715);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (395651246, 'Plane', 9982, 'Hex', 642587);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (333559986, 'UAV', 37352, 'Hex', 638308);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (338229439, 'UAV', 37703, 'Bane', 731069);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (338550984, 'Plane', 30852, 'Bane', 757831);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (313956555, 'Plane', 30519, 'Bane', 234976);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (352876755, 'Plane', 30643, 'Raven', 613055);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (327854292, 'UAV', 14581, 'Hex', 431223);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (332331226, 'UAV', 34112, 'Hex', 370214);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (317262044, 'UAV', 13235, 'Hex', 680899);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (327502045, 'Plane', 24326, 'Grim', 358050);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335829214, 'UAV', 26974, 'Vex', 463259);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (358301921, 'Plane', 47662, 'Raven', 231350);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (315734249, 'Plane', 1217, 'Hex', 928512);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (364419310, 'UAV', 22062, 'Raven', 757831);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (303317235, 'UAV', 34223, 'Vex', 861867);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (379214076, 'Plane', 271, 'Hex', 308527);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (342323455, 'UAV', 41528, 'Raven', 622300);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (390961408, 'Plane', 36532, 'Grim', 652003);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (397555975, 'Plane', 25526, 'Vex', 292771);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (367714579, 'UAV', 35259, 'Hex', 602589);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (317296920, 'UAV', 15459, 'Vex', 120990);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (363548957, 'Plane', 20094, 'Vex', 377676);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306473255, 'Plane', 31564, 'Hex', 788882);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (297281835, 'Plane', 42289, 'Raven', 944651);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (373756218, 'Plane', 13653, 'Grim', 938387);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368187730, 'Plane', 5231, 'Vex', 729720);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (301644116, 'UAV', 15859, 'Grim', 268172);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (396546390, 'Plane', 14412, 'Hex', 757606);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (370301271, 'Plane', 33900, 'Vex', 191008);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (381780312, 'Plane', 8715, 'Hex', 922955);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (302397797, 'UAV', 9962, 'Grim', 685187);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (362099046, 'UAV', 11208, 'Bane', 787131);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307851623, 'UAV', 37504, 'Bane', 157814);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (385804654, 'Plane', 4995, 'Grim', 563960);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (398872942, 'UAV', 6750, 'Raven', 575873);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (301842802, 'Plane', 33802, 'Hex', 890497);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393576835, 'UAV', 42751, 'Raven', 165875);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306112908, 'Plane', 6473, 'Vex', 703584);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (344643982, 'Plane', 25550, 'Raven', 168024);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (386623888, 'UAV', 40079, 'Vex', 463259);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (385610136, 'Plane', 5183, 'Vex', 838171);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (367770020, 'Plane', 36359, 'Grim', 486859);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (316938669, 'UAV', 1957, 'Hex', 566780);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306014639, 'Plane', 26796, 'Bane', 968263);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (382151098, 'UAV', 3678, 'Hex', 321260);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (369064381, 'Plane', 20623, 'Bane', 438590);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (395567551, 'Plane', 20623, 'Grim', 642587);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307630528, 'Plane', 38679, 'Bane', 797395);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (356211147, 'Plane', 7036, 'Grim', 747366);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (336124367, 'UAV', 31147, 'Bane', 152270);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (309371344, 'Plane', 38095, 'Raven', 484462);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318671314, 'Plane', 41706, 'Hex', 914584);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (384295384, 'Plane', 8725, 'Vex', 731069);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368783843, 'UAV', 9046, 'Vex', 394003);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (300796391, 'Plane', 35116, 'Vex', 178510);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (333900275, 'Plane', 13196, 'Bane', 846927);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (376252916, 'UAV', 23462, 'Bane', 196139);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351838716, 'Plane', 14015, 'Grim', 508774);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (381229567, 'Plane', 9932, 'Hex', 317669);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (389437960, 'UAV', 24200, 'Bane', 759709);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (299880973, 'Plane', 7035, 'Grim', 657602);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (317899278, 'Plane', 15724, 'Bane', 684602);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (311052814, 'Plane', 22066, 'Raven', 446952);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383146514, 'Plane', 14095, 'Vex', 357402);
commit;
prompt 100 records committed...
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318249490, 'UAV', 40469, 'Vex', 973507);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (327682581, 'Plane', 735, 'Raven', 864706);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (375835167, 'UAV', 24408, 'Hex', 394003);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377594399, 'UAV', 36668, 'Bane', 999422);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (338377247, 'UAV', 906, 'Grim', 875354);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (347535911, 'Plane', 40309, 'Bane', 319042);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (382226987, 'UAV', 6548, 'Vex', 231822);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (336597549, 'Plane', 49933, 'Grim', 920828);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (378053165, 'UAV', 47338, 'Raven', 473129);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361994811, 'UAV', 38696, 'Grim', 814932);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (359797310, 'Plane', 38786, 'Grim', 845926);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (389876311, 'UAV', 44276, 'Raven', 357617);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (328026732, 'UAV', 3561, 'Vex', 585443);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (346428021, 'Plane', 35542, 'Vex', 182669);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (320361086, 'Plane', 10156, 'Grim', 618384);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (308107908, 'UAV', 21462, 'Bane', 484586);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383836814, 'UAV', 27283, 'Grim', 130550);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393929359, 'Plane', 38456, 'Vex', 627416);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (394195602, 'Plane', 22713, 'Raven', 281688);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335628947, 'UAV', 27451, 'Vex', 566780);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361783956, 'Plane', 42217, 'Vex', 685388);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377221779, 'Plane', 23209, 'Grim', 190360);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383548055, 'UAV', 38594, 'Hex', 973507);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (356938392, 'Plane', 16309, 'Hex', 449267);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (350317207, 'Plane', 10792, 'Vex', 905935);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (311020193, 'Plane', 37413, 'Vex', 371388);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (319249060, 'UAV', 42414, 'Vex', 186334);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (347669157, 'UAV', 23435, 'Vex', 676721);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (375812775, 'UAV', 9328, 'Grim', 757831);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (375892648, 'Plane', 16269, 'Bane', 410190);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (311073451, 'UAV', 8742, 'Grim', 506170);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (354769587, 'UAV', 21991, 'Raven', 312157);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (305357497, 'UAV', 39588, 'Grim', 614023);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (328655557, 'Plane', 12695, 'Raven', 871990);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (357337798, 'UAV', 5646, 'Vex', 237418);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (372822728, 'UAV', 15895, 'Bane', 696636);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (378833614, 'UAV', 15235, 'Hex', 317669);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (359072464, 'UAV', 45258, 'Hex', 281601);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (337933018, 'UAV', 18551, 'Raven', 532714);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (300786395, 'Plane', 19217, 'Raven', 884653);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (363711205, 'UAV', 15884, 'Raven', 748837);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (346897127, 'Plane', 6671, 'Raven', 849145);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (320248553, 'Plane', 27696, 'Raven', 780034);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (327711468, 'Plane', 34785, 'Bane', 759234);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325860082, 'UAV', 39506, 'Hex', 293094);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393978612, 'UAV', 2896, 'Raven', 526718);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (334144245, 'Plane', 10737, 'Raven', 321260);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335518463, 'Plane', 2199, 'Grim', 188050);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345037567, 'Plane', 34217, 'Grim', 793786);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (372886275, 'UAV', 3680, 'Grim', 438590);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (367954699, 'Plane', 41190, 'Grim', 377464);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (310919947, 'Plane', 13369, 'Vex', 422678);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (312169232, 'Plane', 12061, 'Vex', 801147);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (353706769, 'Plane', 19519, 'Vex', 508284);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (324778772, 'UAV', 564, 'Bane', 566780);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325559062, 'UAV', 16720, 'Grim', 937903);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (303975193, 'Plane', 35596, 'Hex', 179105);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318153502, 'Plane', 7301, 'Hex', 980781);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (396925731, 'UAV', 13260, 'Grim', 297264);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383968040, 'Plane', 5058, 'Hex', 136077);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (321919788, 'UAV', 47778, 'Vex', 849145);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (300849979, 'UAV', 16037, 'Bane', 152920);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (312292157, 'UAV', 7611, 'Hex', 178510);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (373130046, 'Plane', 40055, 'Bane', 875354);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368155455, 'Plane', 34062, 'Hex', 838171);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (376011584, 'UAV', 30529, 'Vex', 864828);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (310268741, 'UAV', 32915, 'Vex', 602589);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (352406342, 'Plane', 7540, 'Vex', 120990);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (339508037, 'UAV', 16139, 'Grim', 456742);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (317793093, 'UAV', 10205, 'Raven', 648372);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (338056009, 'Plane', 27821, 'Raven', 924761);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (315741002, 'Plane', 7438, 'Grim', 757606);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335344463, 'UAV', 29319, 'Grim', 926300);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (387208027, 'Plane', 8083, 'Hex', 642587);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (379808603, 'Plane', 47163, 'Bane', 319116);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (339436379, 'Plane', 24439, 'Grim', 362620);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335534944, 'Plane', 10213, 'Bane', 924636);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (370443105, 'UAV', 36552, 'Vex', 627416);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393358177, 'UAV', 12492, 'Bane', 907027);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (358134629, 'Plane', 38431, 'Grim', 611002);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368886633, 'Plane', 49442, 'Bane', 203280);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306568053, 'Plane', 9706, 'Grim', 937903);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (313156475, 'Plane', 25993, 'Vex', 924998);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (348480389, 'UAV', 6723, 'Grim', 968263);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (352054150, 'UAV', 40927, 'Vex', 228636);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (337177477, 'Plane', 9621, 'Hex', 466087);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307133321, 'UAV', 38161, 'Raven', 212051);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (328741784, 'Plane', 25897, 'Hex', 977096);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345265049, 'Plane', 42654, 'Raven', 696636);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (302642076, 'UAV', 28871, 'Vex', 668364);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (365255583, 'UAV', 47459, 'Raven', 713318);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (394372003, 'Plane', 17613, 'Vex', 744506);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318491566, 'Plane', 3317, 'Raven', 901691);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (366740403, 'UAV', 44660, 'Hex', 773082);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (381055930, 'Plane', 3793, 'Bane', 648372);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (373019581, 'Plane', 38727, 'Grim', 236721);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (315126730, 'Plane', 23166, 'Raven', 460338);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (380419023, 'Plane', 20337, 'Bane', 999422);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (299828181, 'UAV', 35999, 'Grim', 473129);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306475991, 'UAV', 42966, 'Bane', 966878);
commit;
prompt 200 records committed...
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (367850455, 'UAV', 36761, 'Raven', 327322);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (362279899, 'Plane', 5070, 'Bane', 196139);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (315399133, 'Plane', 41053, 'Grim', 712373);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (364542944, 'Plane', 9908, 'Grim', 182669);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351839210, 'Plane', 49846, 'Hex', 295930);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307188719, 'Plane', 35830, 'Vex', 256841);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (376458243, 'UAV', 23156, 'Hex', 238091);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (379372552, 'Plane', 24933, 'Bane', 861867);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (303705104, 'UAV', 17881, 'Grim', 345826);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (355472401, 'UAV', 31189, 'Raven', 405277);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325413907, 'Plane', 40578, 'Grim', 162160);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (308712470, 'Plane', 1793, 'Hex', 508774);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (355595286, 'Plane', 47214, 'Raven', 808544);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345865245, 'UAV', 13631, 'Hex', 692879);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (349029408, 'UAV', 18658, 'Hex', 759709);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (324512804, 'UAV', 39288, 'Grim', 914584);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (333773862, 'Plane', 25795, 'Hex', 722416);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (353158185, 'UAV', 37029, 'Grim', 237131);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351673387, 'UAV', 49571, 'Vex', 964644);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (386325549, 'UAV', 47024, 'Bane', 466087);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (394282032, 'Plane', 43701, 'Hex', 907027);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (328678456, 'UAV', 31914, 'Bane', 438590);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (371702846, 'Plane', 49869, 'Vex', 116224);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (380339273, 'UAV', 24917, 'Hex', 180565);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361096272, 'UAV', 17376, 'Raven', 781563);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (364477521, 'Plane', 29827, 'Grim', 600867);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (370414685, 'Plane', 33320, 'Raven', 773082);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361952349, 'Plane', 45328, 'Raven', 957184);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (333950047, 'UAV', 40829, 'Raven', 664305);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (391615586, 'UAV', 35349, 'Grim', 276759);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (396272770, 'Plane', 43488, 'Grim', 161918);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (297763975, 'UAV', 38933, 'Hex', 211823);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318205068, 'UAV', 18153, 'Hex', 563960);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (399633559, 'Plane', 41766, 'Vex', 877168);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361575587, 'UAV', 9203, 'Vex', 877168);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325735592, 'UAV', 15731, 'Grim', 203111);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (369691820, 'Plane', 49331, 'Grim', 331645);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (314326191, 'Plane', 20585, 'Bane', 719852);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345683133, 'UAV', 27833, 'Vex', 960954);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (392889533, 'UAV', 33843, 'Vex', 984770);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325848256, 'UAV', 786, 'Raven', 776789);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345556162, 'Plane', 22832, 'Raven', 556927);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (336686279, 'UAV', 12455, 'Hex', 484586);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (362562760, 'Plane', 2875, 'Vex', 927863);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (331236554, 'UAV', 12848, 'Grim', 938387);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377799888, 'UAV', 22620, 'Raven', 648372);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (398329048, 'UAV', 34076, 'Grim', 890051);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307254506, 'Plane', 20178, 'Raven', 682264);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (305034488, 'Plane', 9313, 'Vex', 431223);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (393426172, 'UAV', 37756, 'Grim', 521913);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (369016068, 'Plane', 6192, 'Bane', 390261);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (300483849, 'UAV', 46024, 'Raven', 748837);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (380683529, 'UAV', 2726, 'Grim', 746336);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351051039, 'Plane', 30405, 'Raven', 627416);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345490732, 'UAV', 19723, 'Raven', 162160);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368479535, 'UAV', 25624, 'Raven', 655051);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (382416186, 'UAV', 19000, 'Raven', 944651);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (398208315, 'UAV', 39647, 'Grim', 466087);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (384941375, 'UAV', 32446, 'Bane', 514057);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (336272706, 'UAV', 4499, 'Hex', 427524);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345298260, 'Plane', 21277, 'Vex', 801147);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (389987678, 'UAV', 11402, 'Hex', 358050);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368690531, 'UAV', 39404, 'Hex', 231640);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (384566638, 'Plane', 8160, 'Bane', 149395);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (373075314, 'Plane', 6141, 'Bane', 966204);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (397217144, 'UAV', 41167, 'Hex', 884653);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (309820797, 'Plane', 2373, 'Grim', 897718);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (371215742, 'UAV', 11180, 'Grim', 172711);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (354733446, 'Plane', 17748, 'Vex', 460338);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (365329806, 'UAV', 5591, 'Grim', 219888);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (343041424, 'Plane', 38264, 'Grim', 759114);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (309640599, 'Plane', 14092, 'Vex', 422678);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (394466711, 'UAV', 38284, 'Vex', 380834);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383860133, 'Plane', 25505, 'Grim', 140849);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (359540138, 'Plane', 9744, 'Grim', 508774);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (338312631, 'Plane', 17485, 'Bane', 514057);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306597306, 'UAV', 48066, 'Hex', 797395);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318494144, 'UAV', 13254, 'Grim', 345369);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (310744513, 'Plane', 13202, 'Bane', 370214);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (347344328, 'Plane', 43354, 'Grim', 790106);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (339799499, 'Plane', 16665, 'Raven', 281688);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383952335, 'Plane', 44687, 'Raven', 781563);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (376444368, 'Plane', 22041, 'Vex', 827441);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (318733779, 'Plane', 2280, 'Vex', 463259);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377208276, 'Plane', 40868, 'Vex', 746336);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (379139542, 'Plane', 28081, 'Hex', 377204);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (376186331, 'UAV', 13275, 'Vex', 294036);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (370128352, 'UAV', 41936, 'Vex', 178510);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (372245985, 'Plane', 31455, 'Bane', 773082);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (383141349, 'UAV', 41070, 'Bane', 196139);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306476518, 'Plane', 48043, 'Hex', 331946);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (399099376, 'Plane', 48489, 'Vex', 709124);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (306177521, 'UAV', 43349, 'Raven', 377204);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377781748, 'UAV', 3771, 'Raven', 932474);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (343660024, 'Plane', 41206, 'Raven', 827441);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (328578554, 'UAV', 27949, 'Grim', 710521);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351043069, 'UAV', 32937, 'Vex', 122065);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351192575, 'Plane', 14438, 'Hex', 739845);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (326747654, 'UAV', 15433, 'Raven', 308527);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (317457927, 'Plane', 7338, 'Raven', 932474);
commit;
prompt 300 records committed...
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (395488778, 'Plane', 40374, 'Bane', 578893);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (308147725, 'Plane', 35286, 'Raven', 362620);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (305122832, 'UAV', 288, 'Hex', 340692);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (319047186, 'UAV', 15228, 'Bane', 294036);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (364211743, 'Plane', 46691, 'Vex', 973507);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (316243493, 'Plane', 3081, 'Hex', 560595);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (337499694, 'Plane', 21964, 'Grim', 581742);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325369392, 'UAV', 1129, 'Raven', 960954);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (365008432, 'UAV', 28830, 'Grim', 819579);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (347067953, 'UAV', 12501, 'Raven', 985101);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (313050675, 'Plane', 24204, 'Grim', 864828);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (353066547, 'UAV', 45100, 'Hex', 927206);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325256753, 'UAV', 8884, 'Vex', 676721);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (309351990, 'UAV', 11972, 'Bane', 927206);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (303351352, 'UAV', 11358, 'Grim', 572459);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (396377663, 'Plane', 32394, 'Vex', 748603);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (385046080, 'UAV', 10797, 'Raven', 860567);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (304858692, 'Plane', 7309, 'Vex', 968263);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (327204421, 'Plane', 18053, 'Vex', 578893);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (338146884, 'UAV', 27290, 'Raven', 319436);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (340502089, 'UAV', 38935, 'Bane', 780034);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (373110350, 'Plane', 22363, 'Grim', 999422);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361668181, 'Plane', 31834, 'Vex', 322029);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (301833832, 'Plane', 2636, 'Vex', 808544);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (345286255, 'Plane', 29318, 'Raven', 289879);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (388333169, 'Plane', 47359, 'Vex', 269211);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (381134451, 'UAV', 2215, 'Raven', 491028);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (330837622, 'Plane', 43871, 'Raven', 530928);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (368115320, 'UAV', 32479, 'Bane', 875354);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (299851389, 'UAV', 39071, 'Vex', 733129);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377921159, 'UAV', 11988, 'Raven', 456742);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (304268938, 'UAV', 29289, 'Vex', 585443);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (362587786, 'Plane', 17399, 'Hex', 922955);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (396441230, 'Plane', 20071, 'Hex', 966878);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (361805462, 'Plane', 7616, 'Raven', 358050);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (356650648, 'UAV', 24961, 'Vex', 137098);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (350039705, 'UAV', 41175, 'Grim', 836350);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335847080, 'UAV', 21, 'Hex', 968263);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (316206767, 'Plane', 30173, 'Raven', 245374);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (378912456, 'Plane', 12457, 'Bane', 212444);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (333835978, 'UAV', 42513, 'Raven', 793786);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (316817114, 'Plane', 26615, 'Bane', 898183);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (298415834, 'Plane', 38932, 'Vex', 676076);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (337080029, 'Plane', 28553, 'Vex', 180565);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (332627677, 'UAV', 25633, 'Bane', 715116);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (390446813, 'Plane', 34153, 'Vex', 618384);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (343316197, 'UAV', 6073, 'Bane', 203280);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (366538470, 'UAV', 21935, 'Grim', 521913);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (389517031, 'UAV', 43078, 'Vex', 980781);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (323370729, 'UAV', 11404, 'Hex', 292394);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (331728622, 'UAV', 38982, 'Vex', 575562);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (314623737, 'Plane', 43480, 'Hex', 157814);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (375209729, 'UAV', 37740, 'Vex', 614023);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307570440, 'UAV', 21202, 'Vex', 957762);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (316403466, 'Plane', 31479, 'Raven', 487376);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (365715213, 'Plane', 40485, 'Bane', 920828);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (301434640, 'Plane', 3737, 'Grim', 602589);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (330942224, 'UAV', 26045, 'Vex', 219888);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (336031507, 'Plane', 7633, 'Hex', 168024);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (377997084, 'Plane', 15630, 'Raven', 871990);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (322449190, 'Plane', 29834, 'Bane', 522456);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (378054448, 'Plane', 28509, 'Hex', 481381);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (352638775, 'UAV', 18385, 'Hex', 122065);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (347293499, 'Plane', 31558, 'Raven', 801147);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (335984445, 'Plane', 48920, 'Bane', 897718);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (353423167, 'UAV', 28434, 'Raven', 894459);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (348921664, 'Plane', 45588, 'Raven', 759709);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (301522752, 'Plane', 32844, 'Hex', 293094);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (392943424, 'UAV', 10792, 'Grim', 289879);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (322017091, 'Plane', 37943, 'Hex', 421122);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (304285527, 'UAV', 48069, 'Vex', 914584);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (370005847, 'Plane', 19594, 'Bane', 329674);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351821660, 'Plane', 12155, 'Raven', 122065);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (395931486, 'UAV', 42456, 'Raven', 310912);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (374048613, 'Plane', 43462, 'Vex', 776789);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (392036198, 'Plane', 4885, 'Raven', 499845);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (397670262, 'Plane', 49347, 'Raven', 797395);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (367853431, 'Plane', 19696, 'Vex', 640731);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (374060924, 'Plane', 34195, 'Hex', 165875);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (373010301, 'UAV', 28846, 'Vex', 747366);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (379158398, 'Plane', 49811, 'Vex', 748837);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (337903486, 'UAV', 3971, 'Bane', 345826);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (364109698, 'Plane', 3712, 'Hex', 685388);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (327466886, 'UAV', 4532, 'Raven', 203280);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (301780879, 'Plane', 20384, 'Vex', 357402);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (307955613, 'Plane', 25434, 'Bane', 371388);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (309385118, 'Plane', 38650, 'Grim', 123594);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (346845087, 'Plane', 9863, 'Hex', 748837);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (391935917, 'Plane', 19007, 'Vex', 122065);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (388437948, 'UAV', 16769, 'Vex', 574359);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (308287424, 'UAV', 27458, 'Vex', 526718);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (351193035, 'UAV', 6473, 'Grim', 397321);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (369240014, 'Plane', 8797, 'Vex', 499845);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (331931598, 'Plane', 15630, 'Raven', 944651);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (320470995, 'UAV', 17317, 'Raven', 295930);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (325998549, 'UAV', 34904, 'Raven', 265044);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (372998106, 'Plane', 30212, 'Raven', 902976);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (374802399, 'Plane', 28863, 'Vex', 746377);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (308991986, 'UAV', 33490, 'Hex', 492956);
insert into PILOT (id, type, flight_hours, call_sign, squadron_number)
values (363827194, 'Plane', 41426, 'Hex', 979080);
commit;
prompt 400 records loaded
prompt Loading FLIGHT...
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (136564, 384295384, 'Shannyn Krieger AirBase', 94, to_date('11-05-1991', 'dd-mm-yyyy'), 415);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (935195, 337903486, 'Mili Klugh AirBase', 14, to_date('10-05-2003', 'dd-mm-yyyy'), 89);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (330088, 337933018, 'Alannah Laws AirBase', 88, to_date('22-11-2003', 'dd-mm-yyyy'), 254);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (634216, 391615586, 'Cloris Herndon AirBase', 700, to_date('12-11-1997', 'dd-mm-yyyy'), 439);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (293063, 318306436, 'Teri Roy Parnell AirBase', 156, to_date('28-09-1986', 'dd-mm-yyyy'), 392);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (481741, 306475991, 'Tilda McLean AirBase', 360, to_date('03-04-2012', 'dd-mm-yyyy'), 101);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (817461, 394372003, 'Joaquin Collins AirBase', 619, to_date('05-12-1982', 'dd-mm-yyyy'), 524);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (920643, 325256753, 'Alfie Sayer AirBase', 89, to_date('13-07-2009', 'dd-mm-yyyy'), 365);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (167309, 332326972, 'Teena Hoffman AirBase', 334, to_date('09-11-1984', 'dd-mm-yyyy'), 156);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (544625, 389517031, 'Naomi Luongo AirBase', 68, to_date('08-11-1983', 'dd-mm-yyyy'), 198);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (369633, 398872942, 'Al Harry AirBase', 389, to_date('01-10-1993', 'dd-mm-yyyy'), 168);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (589477, 351051039, 'Talvin Palin AirBase', 737, to_date('23-04-2010', 'dd-mm-yyyy'), 375);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (231163, 327502045, 'Freda Stiller AirBase', 336, to_date('09-09-2008', 'dd-mm-yyyy'), 595);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (541244, 298579995, 'Rebecca Vanian AirBase', 170, to_date('26-01-2008', 'dd-mm-yyyy'), 447);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (432091, 371215742, 'Barbara Wiedlin AirBase', 311, to_date('10-01-2009', 'dd-mm-yyyy'), 321);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (962841, 368115320, 'Ellen Liotta AirBase', 688, to_date('01-12-1999', 'dd-mm-yyyy'), 487);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (910939, 361783956, 'Joseph Keeslar AirBase', 212, to_date('27-03-2004', 'dd-mm-yyyy'), 322);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (165687, 318249490, 'Wendy Johansen AirBase', 394, to_date('20-06-1981', 'dd-mm-yyyy'), 203);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (679602, 309820797, 'Trick Fariq AirBase', 103, to_date('20-11-1983', 'dd-mm-yyyy'), 479);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (377929, 347535911, 'Peabo De Almeida AirBase', 678, to_date('02-02-1994', 'dd-mm-yyyy'), 554);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (532636, 336124367, 'Holland Teng AirBase', 591, to_date('03-12-1988', 'dd-mm-yyyy'), 202);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (585801, 390446813, 'Tia Benet AirBase', 167, to_date('22-10-1997', 'dd-mm-yyyy'), 170);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (339840, 379139542, 'Lonnie Winwood AirBase', 555, to_date('13-11-1989', 'dd-mm-yyyy'), 236);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (249699, 327204421, 'Kid Taylor AirBase', 168, to_date('21-03-1991', 'dd-mm-yyyy'), 278);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (836203, 319047186, 'Clarence Beckham AirBase', 179, to_date('12-02-1982', 'dd-mm-yyyy'), 243);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (521516, 310919947, 'Coley Gertner AirBase', 478, to_date('22-09-1995', 'dd-mm-yyyy'), 79);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (248278, 369691820, 'Rebecca Biel AirBase', 653, to_date('03-01-2005', 'dd-mm-yyyy'), 476);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (614820, 321919788, 'Pat Lizzy AirBase', 623, to_date('25-01-1994', 'dd-mm-yyyy'), 150);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (621042, 345286255, 'Ashley Plimpton AirBase', 108, to_date('08-10-2011', 'dd-mm-yyyy'), 57);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (704414, 393929359, 'Debby Craddock AirBase', 179, to_date('09-07-2007', 'dd-mm-yyyy'), 226);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (234312, 361668181, 'Ethan Willis AirBase', 746, to_date('19-01-1990', 'dd-mm-yyyy'), 462);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (456865, 393121842, 'Tia Rowlands AirBase', 49, to_date('25-08-2002', 'dd-mm-yyyy'), 358);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (922767, 320470995, 'Ossie Parsons AirBase', 725, to_date('07-03-1987', 'dd-mm-yyyy'), 550);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (518547, 335534944, 'Sean Davis AirBase', 350, to_date('02-02-2001', 'dd-mm-yyyy'), 404);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (838651, 342323455, 'Max Freeman AirBase', 566, to_date('10-10-1998', 'dd-mm-yyyy'), 276);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (112761, 327466886, 'Daniel Moody AirBase', 375, to_date('14-03-2020', 'dd-mm-yyyy'), 23);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (121212, 313156475, 'Vendetta Springfield AirBase', 441, to_date('28-11-1983', 'dd-mm-yyyy'), 325);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (322511, 375209729, 'Ossie Parsons AirBase', 701, to_date('30-12-1986', 'dd-mm-yyyy'), 341);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (361944, 369064381, 'Kyle Eldard AirBase', 102, to_date('14-06-1986', 'dd-mm-yyyy'), 344);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (360477, 343660024, 'Katie Macht AirBase', 485, to_date('25-04-1988', 'dd-mm-yyyy'), 317);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (579689, 350039705, 'Loren Pacino AirBase', 626, to_date('10-10-2016', 'dd-mm-yyyy'), 400);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (452764, 346897127, 'Karen Mantegna AirBase', 34, to_date('08-08-2012', 'dd-mm-yyyy'), 472);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (744668, 382151098, 'Elisabeth Hannah AirBase', 118, to_date('05-06-1988', 'dd-mm-yyyy'), 413);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (887977, 368690531, 'Shirley Schwimmer AirBase', 499, to_date('03-03-1987', 'dd-mm-yyyy'), 235);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (715496, 317296920, 'Aaron Peebles AirBase', 554, to_date('06-01-2015', 'dd-mm-yyyy'), 91);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (508197, 311073451, 'Faye McDowell AirBase', 749, to_date('31-05-2001', 'dd-mm-yyyy'), 88);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (678255, 328678456, 'Tia Benet AirBase', 720, to_date('01-11-1996', 'dd-mm-yyyy'), 327);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (843409, 356650648, 'Holland Teng AirBase', 510, to_date('15-11-1986', 'dd-mm-yyyy'), 371);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (401673, 325369392, 'Woody Palmieri AirBase', 799, to_date('19-07-1999', 'dd-mm-yyyy'), 29);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (715954, 371702846, 'Jonny McDiarmid AirBase', 601, to_date('25-06-1983', 'dd-mm-yyyy'), 547);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (247482, 395488778, 'Andy Todd AirBase', 384, to_date('01-06-1997', 'dd-mm-yyyy'), 257);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (566556, 299851389, 'Grant Taylor AirBase', 163, to_date('28-12-1989', 'dd-mm-yyyy'), 537);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (800014, 345683133, 'Raul Parm AirBase', 677, to_date('14-05-2000', 'dd-mm-yyyy'), 490);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (878502, 382226987, 'Jared Coburn AirBase', 509, to_date('14-12-2002', 'dd-mm-yyyy'), 543);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (904097, 385610136, 'Garland Moffat AirBase', 220, to_date('26-06-1998', 'dd-mm-yyyy'), 374);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (901525, 347067953, 'Queen Cox AirBase', 690, to_date('15-02-2019', 'dd-mm-yyyy'), 72);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (425318, 327502045, 'Jonny McDiarmid AirBase', 146, to_date('27-01-2008', 'dd-mm-yyyy'), 341);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (501954, 361805462, 'Delbert Cube AirBase', 414, to_date('05-10-1996', 'dd-mm-yyyy'), 570);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (771705, 395651246, 'Barbara Wiedlin AirBase', 693, to_date('04-01-2010', 'dd-mm-yyyy'), 558);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (990699, 395567551, 'Queen Cox AirBase', 593, to_date('31-08-1991', 'dd-mm-yyyy'), 256);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (940904, 336686279, 'Ron Azaria AirBase', 550, to_date('28-06-2001', 'dd-mm-yyyy'), 172);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (105634, 395651246, 'Naomi Speaks AirBase', 785, to_date('30-05-1980', 'dd-mm-yyyy'), 40);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (581902, 328741784, 'Taylor Diehl AirBase', 398, to_date('28-10-2014', 'dd-mm-yyyy'), 147);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (849927, 356938392, 'Samuel Washington AirBase', 175, to_date('28-08-1985', 'dd-mm-yyyy'), 561);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (185366, 315741002, 'Katrin Pastore AirBase', 211, to_date('21-06-2009', 'dd-mm-yyyy'), 139);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (112901, 397555975, 'Stanley Grier AirBase', 180, to_date('02-12-1994', 'dd-mm-yyyy'), 49);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (441655, 344643982, 'Liquid Benoit AirBase', 74, to_date('12-12-2015', 'dd-mm-yyyy'), 85);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (624971, 304858692, 'Mykelti Perry AirBase', 524, to_date('12-10-2014', 'dd-mm-yyyy'), 547);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (330577, 375892648, 'Liquid Neville AirBase', 80, to_date('05-10-1996', 'dd-mm-yyyy'), 210);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (923222, 308147725, 'Ethan Willis AirBase', 52, to_date('07-11-1982', 'dd-mm-yyyy'), 565);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (931936, 326277215, 'Kurt McIntosh AirBase', 678, to_date('18-01-1992', 'dd-mm-yyyy'), 377);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (129204, 300786395, 'Ned Shandling AirBase', 146, to_date('20-06-1984', 'dd-mm-yyyy'), 321);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (570953, 338146884, 'Vonda Cronin AirBase', 225, to_date('14-01-1994', 'dd-mm-yyyy'), 449);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (565485, 345037567, 'Forest Tolkan AirBase', 4, to_date('02-07-2013', 'dd-mm-yyyy'), 313);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (437606, 320470995, 'Temuera Ferrell AirBase', 305, to_date('12-01-2013', 'dd-mm-yyyy'), 540);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (462550, 398329048, 'Ice Moffat AirBase', 446, to_date('23-02-1997', 'dd-mm-yyyy'), 146);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (443959, 399633559, 'Halle Stevenson AirBase', 784, to_date('17-01-2010', 'dd-mm-yyyy'), 152);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (732576, 318205068, 'Derrick Duchovny AirBase', 303, to_date('13-03-2017', 'dd-mm-yyyy'), 543);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (408546, 383146514, 'Harry Edmunds AirBase', 357, to_date('29-09-2011', 'dd-mm-yyyy'), 90);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (511684, 305122832, 'Dennis Thornton AirBase', 65, to_date('04-08-1998', 'dd-mm-yyyy'), 383);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (281863, 397555975, 'David Aiken AirBase', 155, to_date('14-11-2019', 'dd-mm-yyyy'), 566);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (497195, 381229567, 'Liquid Benoit AirBase', 433, to_date('24-09-1994', 'dd-mm-yyyy'), 260);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (552041, 399099376, 'Kurt Downey AirBase', 166, to_date('15-10-2009', 'dd-mm-yyyy'), 243);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (931476, 361952349, 'Grace Smith AirBase', 457, to_date('03-06-1983', 'dd-mm-yyyy'), 580);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (594749, 309371344, 'Embeth Holden AirBase', 44, to_date('28-04-1987', 'dd-mm-yyyy'), 562);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (208928, 395651246, 'Pelvic Michael AirBase', 103, to_date('21-11-1987', 'dd-mm-yyyy'), 59);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (156411, 383548055, 'Lara Borgnine AirBase', 60, to_date('06-07-1999', 'dd-mm-yyyy'), 341);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (307684, 381780312, 'Linda De Almeida AirBase', 327, to_date('18-09-2003', 'dd-mm-yyyy'), 80);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (384772, 307188719, 'Terence McClinton AirBase', 559, to_date('24-06-2005', 'dd-mm-yyyy'), 12);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (272570, 312913960, 'Angela Candy AirBase', 308, to_date('25-02-2021', 'dd-mm-yyyy'), 389);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (145898, 375835167, 'Red Piven AirBase', 88, to_date('22-01-1986', 'dd-mm-yyyy'), 221);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (600904, 309371344, 'Robby Sylvian AirBase', 511, to_date('24-09-1980', 'dd-mm-yyyy'), 142);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (691665, 346897127, 'Shirley Schwimmer AirBase', 555, to_date('22-04-2009', 'dd-mm-yyyy'), 261);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (207688, 340502089, 'Andie Raitt AirBase', 434, to_date('27-06-2014', 'dd-mm-yyyy'), 145);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (466793, 377781748, 'Radney De Almeida AirBase', 786, to_date('07-08-2021', 'dd-mm-yyyy'), 258);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (271759, 347067953, 'Saffron Short AirBase', 109, to_date('21-10-1991', 'dd-mm-yyyy'), 482);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (769499, 306568053, 'David Schneider AirBase', 32, to_date('09-06-1984', 'dd-mm-yyyy'), 492);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (689451, 335344463, 'Ellen Liotta AirBase', 216, to_date('04-04-2003', 'dd-mm-yyyy'), 320);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (904823, 375812775, 'Gaby Rhodes AirBase', 402, to_date('24-08-2021', 'dd-mm-yyyy'), 262);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (287351, 377799888, 'Amanda Puckett AirBase', 669, to_date('20-04-1982', 'dd-mm-yyyy'), 286);
commit;
prompt 100 records committed...
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (394692, 326747654, 'Nickel Place AirBase', 576, to_date('28-01-2000', 'dd-mm-yyyy'), 45);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (470692, 313452626, 'Keanu Senior AirBase', 148, to_date('20-04-1993', 'dd-mm-yyyy'), 312);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (833784, 377799888, 'Millie Dunaway AirBase', 562, to_date('09-07-1993', 'dd-mm-yyyy'), 187);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (508952, 386623888, 'Clarence Beckham AirBase', 20, to_date('30-09-1994', 'dd-mm-yyyy'), 148);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (205261, 338377247, 'Saffron Short AirBase', 658, to_date('27-12-1981', 'dd-mm-yyyy'), 172);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (785231, 367954699, 'Coley Gertner AirBase', 338, to_date('01-02-1997', 'dd-mm-yyyy'), 461);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (595421, 352638775, 'Terence McClinton AirBase', 391, to_date('06-12-2004', 'dd-mm-yyyy'), 281);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (860949, 332331226, 'Donal Donelly AirBase', 552, to_date('26-01-1991', 'dd-mm-yyyy'), 195);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (971338, 381339784, 'Oliver Drive AirBase', 178, to_date('07-09-1981', 'dd-mm-yyyy'), 517);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (132448, 313050675, 'Shawn Pressly AirBase', 218, to_date('09-01-1999', 'dd-mm-yyyy'), 209);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (910561, 352638775, 'Maura Driver AirBase', 688, to_date('07-09-2018', 'dd-mm-yyyy'), 98);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (981044, 307630528, 'Tanya Curtis-Hall AirBase', 751, to_date('14-12-1981', 'dd-mm-yyyy'), 332);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (896918, 311073451, 'Elvis Page AirBase', 660, to_date('31-08-2017', 'dd-mm-yyyy'), 361);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (143101, 361668181, 'Jose Spears AirBase', 699, to_date('18-11-2017', 'dd-mm-yyyy'), 120);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (321500, 349029408, 'Tia Rowlands AirBase', 539, to_date('03-07-2013', 'dd-mm-yyyy'), 498);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (151692, 370301271, 'Sinead Stampley AirBase', 384, to_date('30-04-2001', 'dd-mm-yyyy'), 214);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (852878, 361994811, 'Karon Coyote AirBase', 296, to_date('24-10-1992', 'dd-mm-yyyy'), 491);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (926395, 303975193, 'Kyle Eldard AirBase', 784, to_date('07-05-2014', 'dd-mm-yyyy'), 107);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (565630, 347067953, 'Sara Mandrell AirBase', 792, to_date('03-01-2013', 'dd-mm-yyyy'), 365);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (212804, 368690531, 'Freddy Folds AirBase', 125, to_date('29-12-2009', 'dd-mm-yyyy'), 149);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (441224, 335534944, 'Samantha Weaver AirBase', 646, to_date('06-12-1981', 'dd-mm-yyyy'), 381);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (298305, 303705104, 'Saffron Boorem AirBase', 621, to_date('11-09-2021', 'dd-mm-yyyy'), 351);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (980328, 399633559, 'Embeth Holden AirBase', 777, to_date('10-10-1980', 'dd-mm-yyyy'), 451);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (655687, 368187730, 'Marty Goodman AirBase', 448, to_date('04-05-1980', 'dd-mm-yyyy'), 560);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (190608, 388333169, 'Ritchie Bullock AirBase', 178, to_date('15-05-2007', 'dd-mm-yyyy'), 136);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (491145, 324512804, 'Shawn Pressly AirBase', 610, to_date('04-08-1995', 'dd-mm-yyyy'), 191);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (839081, 316403466, 'Tia Rowlands AirBase', 277, to_date('24-07-2001', 'dd-mm-yyyy'), 174);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (298241, 393576835, 'Dennis Thornton AirBase', 548, to_date('24-03-1994', 'dd-mm-yyyy'), 596);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (883078, 313956555, 'Crystal Hoffman AirBase', 266, to_date('20-10-2016', 'dd-mm-yyyy'), 111);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (744387, 391935917, 'Shannyn Krieger AirBase', 566, to_date('06-01-2013', 'dd-mm-yyyy'), 297);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (618879, 314326191, 'Saffron Boorem AirBase', 343, to_date('15-08-1992', 'dd-mm-yyyy'), 354);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (141405, 395567551, 'Reese Lauper AirBase', 533, to_date('16-12-2017', 'dd-mm-yyyy'), 30);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (912093, 365058142, 'Kurtwood Strong AirBase', 435, to_date('14-02-2021', 'dd-mm-yyyy'), 567);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (976735, 370005847, 'Kurt Downey AirBase', 524, to_date('28-04-1980', 'dd-mm-yyyy'), 454);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (398836, 399099376, 'Rebecca Vanian AirBase', 571, to_date('07-03-1995', 'dd-mm-yyyy'), 77);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (206851, 318306436, 'Terence McClinton AirBase', 455, to_date('29-05-1984', 'dd-mm-yyyy'), 309);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (671774, 361805462, 'William Love AirBase', 456, to_date('18-06-2014', 'dd-mm-yyyy'), 176);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (339442, 381339784, 'Fats Berkeley AirBase', 795, to_date('27-05-1984', 'dd-mm-yyyy'), 34);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (790084, 318205068, 'Gaby Rhodes AirBase', 20, to_date('30-12-1995', 'dd-mm-yyyy'), 103);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (255930, 331931598, 'Dennis Banderas AirBase', 188, to_date('04-04-2014', 'dd-mm-yyyy'), 24);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (477417, 351839210, 'Claude Imperioli AirBase', 492, to_date('01-05-2012', 'dd-mm-yyyy'), 484);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (550880, 297281835, 'Derrick Duchovny AirBase', 477, to_date('29-12-1984', 'dd-mm-yyyy'), 585);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (996898, 351821660, 'Daryle Walsh AirBase', 179, to_date('31-01-1993', 'dd-mm-yyyy'), 396);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (789868, 298006662, 'Cornell Clark AirBase', 167, to_date('05-05-2020', 'dd-mm-yyyy'), 175);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (117249, 315399133, 'Trini Orbit AirBase', 92, to_date('24-11-1997', 'dd-mm-yyyy'), 354);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (512365, 361977936, 'Catherine Assante AirBase', 11, to_date('07-02-1982', 'dd-mm-yyyy'), 463);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (309082, 346897127, 'Gordie Bridges AirBase', 394, to_date('21-07-2011', 'dd-mm-yyyy'), 53);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (731209, 351839210, 'Morris Breslin AirBase', 566, to_date('28-02-1997', 'dd-mm-yyyy'), 300);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (935434, 318671314, 'Raul Parm AirBase', 37, to_date('14-05-1986', 'dd-mm-yyyy'), 497);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (205220, 328741784, 'Coley Patrick AirBase', 589, to_date('22-07-1986', 'dd-mm-yyyy'), 450);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (325602, 361096272, 'Rowan Madsen AirBase', 132, to_date('11-07-1985', 'dd-mm-yyyy'), 233);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (786514, 316938669, 'Radney Breslin AirBase', 534, to_date('24-06-1987', 'dd-mm-yyyy'), 271);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (546336, 369016068, 'Tony Robinson AirBase', 636, to_date('07-07-1997', 'dd-mm-yyyy'), 357);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (369102, 302397797, 'Freddie Botti AirBase', 412, to_date('03-09-2003', 'dd-mm-yyyy'), 237);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (709468, 299851389, 'Christine Keitel AirBase', 104, to_date('11-04-2010', 'dd-mm-yyyy'), 19);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (790303, 372998106, 'Cesar Assante AirBase', 677, to_date('24-01-2020', 'dd-mm-yyyy'), 44);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (880019, 377796619, 'Claude Imperioli AirBase', 471, to_date('30-04-2020', 'dd-mm-yyyy'), 351);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (661569, 371215742, 'Saffron Jay AirBase', 598, to_date('30-01-1988', 'dd-mm-yyyy'), 569);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (173866, 358134629, 'Alannah Witt AirBase', 636, to_date('22-05-1998', 'dd-mm-yyyy'), 15);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (930252, 345865245, 'Stephen Brody AirBase', 789, to_date('22-07-2018', 'dd-mm-yyyy'), 342);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (759012, 309820797, 'Jared Wills AirBase', 391, to_date('09-10-2011', 'dd-mm-yyyy'), 11);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (798901, 389987678, 'Mike Spine AirBase', 741, to_date('13-08-2021', 'dd-mm-yyyy'), 388);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (899543, 319249060, 'Nile Rebhorn AirBase', 487, to_date('12-02-2000', 'dd-mm-yyyy'), 53);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (553636, 336686279, 'Curtis Shue AirBase', 39, to_date('14-06-2017', 'dd-mm-yyyy'), 122);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (906314, 345286255, 'Earl Walker AirBase', 759, to_date('07-09-2013', 'dd-mm-yyyy'), 296);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (178170, 361805462, 'Kate Gere AirBase', 115, to_date('25-05-2000', 'dd-mm-yyyy'), 236);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (183440, 315126730, 'Nelly Scheider AirBase', 121, to_date('29-10-2011', 'dd-mm-yyyy'), 497);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (855030, 399429753, 'Hex Gleeson AirBase', 399, to_date('21-03-2013', 'dd-mm-yyyy'), 280);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (684650, 310919947, 'Kurt Downey AirBase', 747, to_date('19-10-2009', 'dd-mm-yyyy'), 35);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (480560, 387208027, 'Emerson Bush AirBase', 536, to_date('29-12-2006', 'dd-mm-yyyy'), 69);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (818569, 307570440, 'Joseph Keeslar AirBase', 630, to_date('04-08-1986', 'dd-mm-yyyy'), 33);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (645245, 372822728, 'Wally Chilton AirBase', 528, to_date('13-07-1996', 'dd-mm-yyyy'), 16);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (966982, 397535264, 'Grant Taylor AirBase', 479, to_date('20-11-1984', 'dd-mm-yyyy'), 88);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (455938, 386623888, 'Tamala Stone AirBase', 466, to_date('18-09-1981', 'dd-mm-yyyy'), 362);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (605154, 308287424, 'Lari Torn AirBase', 698, to_date('19-11-2004', 'dd-mm-yyyy'), 584);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (501535, 394372003, 'Clarence Beckham AirBase', 109, to_date('24-08-1997', 'dd-mm-yyyy'), 16);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (538264, 338229439, 'Saffron Short AirBase', 431, to_date('11-01-2018', 'dd-mm-yyyy'), 451);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (888677, 301780879, 'Maureen Robards AirBase', 377, to_date('22-01-1995', 'dd-mm-yyyy'), 589);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (593010, 307254506, 'Hex Farina AirBase', 424, to_date('05-06-2017', 'dd-mm-yyyy'), 447);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (899031, 309351990, 'Dar Harry AirBase', 226, to_date('13-11-2018', 'dd-mm-yyyy'), 77);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (428454, 395488778, 'Ron Azaria AirBase', 471, to_date('02-01-1990', 'dd-mm-yyyy'), 356);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (844718, 331728622, 'Chrissie Fehr AirBase', 151, to_date('29-03-1987', 'dd-mm-yyyy'), 407);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (555174, 307570440, 'Austin Hersh AirBase', 797, to_date('17-02-2000', 'dd-mm-yyyy'), 469);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (623444, 308287424, 'Earl Walker AirBase', 599, to_date('05-03-1980', 'dd-mm-yyyy'), 589);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (876767, 326277215, 'Peter Sewell AirBase', 159, to_date('24-10-1996', 'dd-mm-yyyy'), 177);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (499901, 299034698, 'Larnelle Hingle AirBase', 542, to_date('18-11-1982', 'dd-mm-yyyy'), 569);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (592790, 391935917, 'Clarence Beckham AirBase', 409, to_date('08-03-2017', 'dd-mm-yyyy'), 207);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (865007, 337903486, 'Vendetta Springfield AirBase', 71, to_date('21-12-2013', 'dd-mm-yyyy'), 232);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (827184, 393576835, 'Seann Garber AirBase', 290, to_date('02-05-1999', 'dd-mm-yyyy'), 423);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (649528, 373110350, 'Nelly Scheider AirBase', 685, to_date('22-10-1982', 'dd-mm-yyyy'), 45);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (771244, 382151098, 'Alex Oakenfold AirBase', 630, to_date('07-04-1982', 'dd-mm-yyyy'), 45);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (593670, 386850983, 'Jared Coburn AirBase', 331, to_date('05-12-2016', 'dd-mm-yyyy'), 490);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (855212, 310744513, 'Edie Fierstein AirBase', 88, to_date('22-01-2011', 'dd-mm-yyyy'), 171);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (699184, 369016068, 'Rickie Loggia AirBase', 451, to_date('21-12-1994', 'dd-mm-yyyy'), 559);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (587541, 310184020, 'Dustin Barrymore AirBase', 25, to_date('15-11-1999', 'dd-mm-yyyy'), 382);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (315549, 313956555, 'Ted Sorvino AirBase', 109, to_date('23-12-2012', 'dd-mm-yyyy'), 463);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (525891, 316817114, 'Ray Newman AirBase', 454, to_date('12-01-1984', 'dd-mm-yyyy'), 265);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (536811, 370443105, 'Melanie Benoit AirBase', 457, to_date('03-07-1994', 'dd-mm-yyyy'), 234);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (968942, 389437960, 'Sylvester Bandy AirBase', 430, to_date('08-10-1984', 'dd-mm-yyyy'), 274);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (710617, 315126730, 'Kurt McIntosh AirBase', 598, to_date('07-06-1983', 'dd-mm-yyyy'), 278);
commit;
prompt 200 records committed...
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (983051, 308991986, 'Elisabeth Hannah AirBase', 459, to_date('01-11-1980', 'dd-mm-yyyy'), 61);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (886026, 389987678, 'Oliver Drive AirBase', 520, to_date('22-11-1980', 'dd-mm-yyyy'), 568);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (702848, 374048613, 'LeVar Farina AirBase', 665, to_date('03-08-1987', 'dd-mm-yyyy'), 245);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (651650, 325413907, 'Jared Coburn AirBase', 544, to_date('21-03-2004', 'dd-mm-yyyy'), 107);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (169818, 374802399, 'Teri Roy Parnell AirBase', 693, to_date('03-10-2002', 'dd-mm-yyyy'), 102);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (340689, 351051039, 'Peabo O''Hara AirBase', 571, to_date('16-04-2006', 'dd-mm-yyyy'), 152);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (797928, 367853431, 'Nile Rebhorn AirBase', 309, to_date('05-07-2008', 'dd-mm-yyyy'), 412);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (904424, 301833832, 'Liquid Benoit AirBase', 175, to_date('01-04-2018', 'dd-mm-yyyy'), 108);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (480376, 364211743, 'Mike Quinn AirBase', 654, to_date('10-01-2020', 'dd-mm-yyyy'), 114);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (780728, 396441230, 'Mike Spine AirBase', 9, to_date('01-12-2006', 'dd-mm-yyyy'), 539);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (576507, 368723995, 'Ethan Weller AirBase', 720, to_date('15-02-2013', 'dd-mm-yyyy'), 414);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (909161, 324778772, 'Toshiro Perrineau AirBase', 386, to_date('20-11-1998', 'dd-mm-yyyy'), 109);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (942973, 299851389, 'Reese Cube AirBase', 602, to_date('03-04-1994', 'dd-mm-yyyy'), 583);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (469207, 376011584, 'Dar Harry AirBase', 306, to_date('20-08-1983', 'dd-mm-yyyy'), 36);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (798194, 369064381, 'Ashley Plimpton AirBase', 103, to_date('15-05-1982', 'dd-mm-yyyy'), 564);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (343221, 379808603, 'Rebecca Vanian AirBase', 370, to_date('05-08-2000', 'dd-mm-yyyy'), 210);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (934177, 373010301, 'Al Harry AirBase', 643, to_date('04-12-2018', 'dd-mm-yyyy'), 229);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (930644, 345265049, 'Oliver Drive AirBase', 471, to_date('11-08-1985', 'dd-mm-yyyy'), 239);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (314769, 378053165, 'Sylvester Bandy AirBase', 234, to_date('12-08-1996', 'dd-mm-yyyy'), 80);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (965050, 307188719, 'Jack Applegate AirBase', 102, to_date('22-08-2012', 'dd-mm-yyyy'), 544);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (124387, 332627677, 'Katrin Pastore AirBase', 288, to_date('12-01-1990', 'dd-mm-yyyy'), 19);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (610587, 345286255, 'Vincent Hannah AirBase', 555, to_date('16-02-1981', 'dd-mm-yyyy'), 487);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (656313, 307851623, 'Orlando Hobson AirBase', 25, to_date('16-11-2017', 'dd-mm-yyyy'), 88);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (639375, 300786395, 'Collin Cheadle AirBase', 472, to_date('23-12-1993', 'dd-mm-yyyy'), 183);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (954588, 351193035, 'Freda Stiller AirBase', 34, to_date('17-11-1982', 'dd-mm-yyyy'), 127);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (516427, 328026732, 'Arturo Makeba AirBase', 407, to_date('30-06-1993', 'dd-mm-yyyy'), 334);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (548593, 314326191, 'Roscoe Finney AirBase', 750, to_date('20-02-2000', 'dd-mm-yyyy'), 149);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (243648, 300796391, 'Dustin Worrell AirBase', 266, to_date('26-03-2005', 'dd-mm-yyyy'), 512);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (144360, 327682581, 'Lynn Bonham AirBase', 222, to_date('10-12-1990', 'dd-mm-yyyy'), 473);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (239476, 365329806, 'Jane McGregor AirBase', 84, to_date('12-02-1998', 'dd-mm-yyyy'), 581);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (161691, 364477521, 'Raul Parm AirBase', 513, to_date('27-10-1991', 'dd-mm-yyyy'), 153);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (955741, 347293499, 'Tilda McLean AirBase', 402, to_date('23-10-2017', 'dd-mm-yyyy'), 74);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (731136, 313452626, 'Remy Diesel AirBase', 322, to_date('29-11-1992', 'dd-mm-yyyy'), 124);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (558281, 367770020, 'Morgan Pantoliano AirBase', 309, to_date('25-08-2000', 'dd-mm-yyyy'), 501);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (689894, 332331226, 'Willie Berenger AirBase', 365, to_date('10-05-2020', 'dd-mm-yyyy'), 469);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (922896, 367714579, 'Rachel Mollard AirBase', 209, to_date('20-02-1988', 'dd-mm-yyyy'), 385);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (540710, 318306436, 'Naomi Speaks AirBase', 287, to_date('30-10-2011', 'dd-mm-yyyy'), 266);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (923198, 394372003, 'Rachid Bailey AirBase', 577, to_date('27-04-2002', 'dd-mm-yyyy'), 125);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (162817, 325998549, 'Andie Farrow AirBase', 480, to_date('24-11-2010', 'dd-mm-yyyy'), 368);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (311914, 338312631, 'Nils Barry AirBase', 164, to_date('11-01-1987', 'dd-mm-yyyy'), 260);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (288993, 317793093, 'Embeth Holden AirBase', 743, to_date('07-05-1998', 'dd-mm-yyyy'), 136);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (822211, 393576835, 'Jake Reinhold AirBase', 516, to_date('04-05-2020', 'dd-mm-yyyy'), 500);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (787795, 318491566, 'Maureen Robards AirBase', 772, to_date('21-02-1991', 'dd-mm-yyyy'), 16);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (340603, 351193035, 'Peabo O''Hara AirBase', 670, to_date('05-03-2006', 'dd-mm-yyyy'), 519);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (715025, 380683529, 'Ike Holm AirBase', 433, to_date('22-02-2000', 'dd-mm-yyyy'), 69);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (528002, 342323455, 'Dabney Meyer AirBase', 489, to_date('18-06-1995', 'dd-mm-yyyy'), 135);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (823509, 317899278, 'Cathy Loring AirBase', 367, to_date('21-04-1994', 'dd-mm-yyyy'), 155);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (790475, 378053165, 'Gordie Bridges AirBase', 93, to_date('30-09-1987', 'dd-mm-yyyy'), 160);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (445227, 340502089, 'Sydney Palmer AirBase', 518, to_date('05-06-1987', 'dd-mm-yyyy'), 454);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (326273, 310184020, 'Pelvic Hirsch AirBase', 659, to_date('27-08-2006', 'dd-mm-yyyy'), 65);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (684875, 368783843, 'Anita Michael AirBase', 719, to_date('10-03-1996', 'dd-mm-yyyy'), 34);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (500689, 318153502, 'Vienna Reilly AirBase', 44, to_date('20-02-1993', 'dd-mm-yyyy'), 550);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (888914, 361668181, 'Hilary Klein AirBase', 518, to_date('31-07-2006', 'dd-mm-yyyy'), 133);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (925313, 340502089, 'Fats Berkeley AirBase', 93, to_date('23-11-1994', 'dd-mm-yyyy'), 365);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (779171, 368479535, 'Chaka Apple AirBase', 388, to_date('24-05-2012', 'dd-mm-yyyy'), 115);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (843245, 369662083, 'Nils Barry AirBase', 308, to_date('04-11-2006', 'dd-mm-yyyy'), 487);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (165050, 364477521, 'Katrin Pastore AirBase', 309, to_date('10-12-1989', 'dd-mm-yyyy'), 155);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (546823, 347535911, 'Alannah Laws AirBase', 718, to_date('10-02-2004', 'dd-mm-yyyy'), 565);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (973422, 298579995, 'Hal Crouse AirBase', 653, to_date('27-08-2019', 'dd-mm-yyyy'), 82);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (479435, 325369392, 'Samuel Washington AirBase', 232, to_date('31-05-2005', 'dd-mm-yyyy'), 465);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (360254, 357337798, 'Peter Sewell AirBase', 167, to_date('10-09-2019', 'dd-mm-yyyy'), 475);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (397981, 376444368, 'Linda De Almeida AirBase', 132, to_date('21-03-2015', 'dd-mm-yyyy'), 374);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (793035, 383548055, 'Petula Damon AirBase', 386, to_date('13-04-1995', 'dd-mm-yyyy'), 437);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (297532, 363548957, 'Bob Robbins AirBase', 157, to_date('11-08-1997', 'dd-mm-yyyy'), 178);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (218066, 342323455, 'Nick Utada AirBase', 465, to_date('12-11-1995', 'dd-mm-yyyy'), 239);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (524768, 337499694, 'Vienna Reilly AirBase', 462, to_date('20-04-2003', 'dd-mm-yyyy'), 164);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (351679, 371877932, 'Ewan Phifer AirBase', 172, to_date('07-10-1990', 'dd-mm-yyyy'), 584);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (531740, 332326972, 'Kurtwood Strong AirBase', 496, to_date('10-08-1993', 'dd-mm-yyyy'), 491);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (259443, 367714579, 'Liquid Benoit AirBase', 217, to_date('07-07-2010', 'dd-mm-yyyy'), 469);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (446533, 364109698, 'Will Hiatt AirBase', 469, to_date('29-11-2007', 'dd-mm-yyyy'), 597);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (212418, 351839210, 'Amanda Puckett AirBase', 477, to_date('21-06-1987', 'dd-mm-yyyy'), 495);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (862384, 300433417, 'Mykelti Perry AirBase', 72, to_date('20-05-1987', 'dd-mm-yyyy'), 428);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (534527, 327682581, 'Cuba Gosdin AirBase', 74, to_date('16-12-1999', 'dd-mm-yyyy'), 276);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (971817, 347067953, 'Oliver Drive AirBase', 508, to_date('01-07-2006', 'dd-mm-yyyy'), 216);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (180096, 367770020, 'Rik Firth AirBase', 273, to_date('19-06-1996', 'dd-mm-yyyy'), 55);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (797362, 365255583, 'Loretta Cleese AirBase', 100, to_date('06-03-1994', 'dd-mm-yyyy'), 397);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (905646, 380683529, 'Lea Palin AirBase', 168, to_date('13-03-2019', 'dd-mm-yyyy'), 216);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (895421, 357337798, 'Lindsey Kotto AirBase', 336, to_date('15-12-2010', 'dd-mm-yyyy'), 467);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (624968, 307955613, 'Embeth Tyson AirBase', 104, to_date('28-06-1982', 'dd-mm-yyyy'), 211);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (334835, 352406342, 'Wendy Johansen AirBase', 217, to_date('20-02-2017', 'dd-mm-yyyy'), 435);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (261577, 357337798, 'Dianne Warden AirBase', 11, to_date('30-05-2004', 'dd-mm-yyyy'), 353);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (276728, 325848256, 'Brendan Rankin AirBase', 167, to_date('19-04-2009', 'dd-mm-yyyy'), 417);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (937582, 391615586, 'Ned Shandling AirBase', 8, to_date('09-01-1990', 'dd-mm-yyyy'), 20);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (907175, 333950047, 'Reese Cube AirBase', 168, to_date('15-01-1985', 'dd-mm-yyyy'), 557);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (963050, 332326972, 'Chuck Imperioli AirBase', 435, to_date('17-08-1989', 'dd-mm-yyyy'), 137);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (399273, 367714579, 'Alex Oakenfold AirBase', 184, to_date('17-06-2004', 'dd-mm-yyyy'), 70);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (514915, 342323455, 'Forest Tolkan AirBase', 286, to_date('05-07-2009', 'dd-mm-yyyy'), 243);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (306159, 375835167, 'Goldie Weaver AirBase', 737, to_date('24-02-1997', 'dd-mm-yyyy'), 249);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (519507, 351043069, 'Coley Patrick AirBase', 391, to_date('19-06-2021', 'dd-mm-yyyy'), 86);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (411561, 345265049, 'Terence McClinton AirBase', 94, to_date('24-03-1982', 'dd-mm-yyyy'), 478);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (477752, 380683529, 'Jeffrey Holbrook AirBase', 325, to_date('31-08-2003', 'dd-mm-yyyy'), 465);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (489416, 364211743, 'Shawn Pressly AirBase', 731, to_date('22-03-1993', 'dd-mm-yyyy'), 76);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (197111, 343041424, 'Seann Garber AirBase', 594, to_date('19-01-1982', 'dd-mm-yyyy'), 563);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (549142, 346845087, 'Loren Pacino AirBase', 336, to_date('14-04-2018', 'dd-mm-yyyy'), 40);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (719321, 380339273, 'Jason Saucedo AirBase', 267, to_date('16-12-2009', 'dd-mm-yyyy'), 396);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (368119, 375835167, 'Hex Gleeson AirBase', 411, to_date('06-08-1982', 'dd-mm-yyyy'), 68);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (858000, 332331226, 'Temuera Ferrell AirBase', 416, to_date('12-01-1992', 'dd-mm-yyyy'), 572);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (237927, 375892648, 'Carla Katt AirBase', 139, to_date('21-05-2020', 'dd-mm-yyyy'), 597);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (385176, 361096272, 'Garland Sedgwick AirBase', 727, to_date('09-03-1983', 'dd-mm-yyyy'), 23);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (575933, 335628947, 'Jared Coburn AirBase', 176, to_date('16-06-1992', 'dd-mm-yyyy'), 218);
commit;
prompt 300 records committed...
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (430803, 328655557, 'Lizzy Puckett AirBase', 35, to_date('16-09-2007', 'dd-mm-yyyy'), 153);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (978759, 380339273, 'Cesar Assante AirBase', 431, to_date('31-08-1987', 'dd-mm-yyyy'), 261);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (884330, 362099046, 'Anita Michael AirBase', 567, to_date('02-03-2008', 'dd-mm-yyyy'), 395);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (419213, 331728622, 'Elizabeth Patrick AirBase', 97, to_date('09-03-1987', 'dd-mm-yyyy'), 126);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (212386, 309820797, 'Rick Burrows AirBase', 627, to_date('27-04-1998', 'dd-mm-yyyy'), 438);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (513236, 380683529, 'Rachel Mollard AirBase', 396, to_date('20-01-1989', 'dd-mm-yyyy'), 170);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (631635, 314326191, 'Trick Fariq AirBase', 714, to_date('06-08-2000', 'dd-mm-yyyy'), 299);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (508441, 299034698, 'Randy DiCaprio AirBase', 298, to_date('03-11-2010', 'dd-mm-yyyy'), 160);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (200871, 379372552, 'Rick Burrows AirBase', 213, to_date('08-06-1989', 'dd-mm-yyyy'), 209);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (770779, 396272770, 'Kyle Eldard AirBase', 481, to_date('03-11-1986', 'dd-mm-yyyy'), 351);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (421418, 318205068, 'Sonny Idol AirBase', 432, to_date('26-12-1987', 'dd-mm-yyyy'), 74);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (270930, 393814153, 'Jeffrey Holbrook AirBase', 588, to_date('13-10-2006', 'dd-mm-yyyy'), 585);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (559887, 349029408, 'Pat Lizzy AirBase', 353, to_date('20-06-2014', 'dd-mm-yyyy'), 164);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (796951, 336124367, 'Toni McCain AirBase', 654, to_date('03-05-2009', 'dd-mm-yyyy'), 44);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (532363, 375812775, 'Ike Holm AirBase', 440, to_date('28-09-2004', 'dd-mm-yyyy'), 139);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (244764, 382226987, 'Temuera Ferrell AirBase', 148, to_date('02-06-1986', 'dd-mm-yyyy'), 430);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (214080, 304858692, 'Howard Reubens AirBase', 493, to_date('27-04-2016', 'dd-mm-yyyy'), 138);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (763032, 339436379, 'Jane McGregor AirBase', 314, to_date('05-09-2000', 'dd-mm-yyyy'), 141);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (363643, 315741002, 'Lea Palin AirBase', 84, to_date('25-05-2021', 'dd-mm-yyyy'), 148);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (153997, 381780312, 'Sylvester Bandy AirBase', 458, to_date('16-01-2001', 'dd-mm-yyyy'), 240);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (675871, 360294496, 'Loren Pacino AirBase', 760, to_date('26-02-1993', 'dd-mm-yyyy'), 493);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (856835, 310184020, 'Chad Daniels AirBase', 646, to_date('07-10-2019', 'dd-mm-yyyy'), 40);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (602304, 372998106, 'Olga Burke AirBase', 558, to_date('30-11-1991', 'dd-mm-yyyy'), 548);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (865094, 380419023, 'Will Hiatt AirBase', 285, to_date('06-11-2000', 'dd-mm-yyyy'), 428);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (703463, 338550984, 'Marc Levin AirBase', 406, to_date('21-04-2010', 'dd-mm-yyyy'), 589);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (454776, 397555975, 'Peter Sewell AirBase', 631, to_date('18-04-1990', 'dd-mm-yyyy'), 155);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (721897, 373075314, 'Nils Barry AirBase', 571, to_date('28-02-2019', 'dd-mm-yyyy'), 36);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (324629, 361952349, 'Marty Goodman AirBase', 312, to_date('10-01-2001', 'dd-mm-yyyy'), 549);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (690100, 386850983, 'Janice Curfman AirBase', 705, to_date('01-04-1994', 'dd-mm-yyyy'), 253);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (275200, 381339784, 'Colm Cruz AirBase', 301, to_date('12-12-2009', 'dd-mm-yyyy'), 28);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (812358, 362587786, 'David Schneider AirBase', 471, to_date('25-06-2008', 'dd-mm-yyyy'), 144);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (578231, 308107908, 'Donald Buffalo AirBase', 624, to_date('03-01-2009', 'dd-mm-yyyy'), 92);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (584574, 310184020, 'Temuera Ferrell AirBase', 296, to_date('23-10-1980', 'dd-mm-yyyy'), 93);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (312944, 312913960, 'Sylvester Bandy AirBase', 50, to_date('07-09-2000', 'dd-mm-yyyy'), 318);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (541149, 332627677, 'Aaron Peebles AirBase', 415, to_date('02-06-1985', 'dd-mm-yyyy'), 408);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (670779, 306597306, 'Lance Nunn AirBase', 638, to_date('29-10-2006', 'dd-mm-yyyy'), 196);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (342982, 328655557, 'Red Piven AirBase', 581, to_date('25-05-2019', 'dd-mm-yyyy'), 87);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (755161, 371877932, 'Ralph Kleinenberg AirBase', 790, to_date('06-03-2002', 'dd-mm-yyyy'), 402);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (645632, 393978612, 'Ron Azaria AirBase', 586, to_date('12-07-1985', 'dd-mm-yyyy'), 71);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (627844, 381339784, 'Earl Walker AirBase', 687, to_date('10-08-1988', 'dd-mm-yyyy'), 375);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (211735, 317899278, 'Annette Holland AirBase', 369, to_date('22-05-1985', 'dd-mm-yyyy'), 564);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (478393, 345298260, 'David Schneider AirBase', 159, to_date('07-05-2016', 'dd-mm-yyyy'), 435);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (656706, 364477521, 'Ron Azaria AirBase', 267, to_date('06-05-2020', 'dd-mm-yyyy'), 417);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (318388, 359540138, 'Lee Boone AirBase', 455, to_date('11-03-2011', 'dd-mm-yyyy'), 307);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (841817, 351051039, 'Leonardo Diddley AirBase', 571, to_date('06-09-2014', 'dd-mm-yyyy'), 273);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (326884, 384295384, 'Joan Salonga AirBase', 781, to_date('21-01-1991', 'dd-mm-yyyy'), 203);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (953690, 377208276, 'Rob Morales AirBase', 558, to_date('18-06-1993', 'dd-mm-yyyy'), 47);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (398710, 379158398, 'Alannah Gaines AirBase', 656, to_date('04-11-2005', 'dd-mm-yyyy'), 180);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (534289, 331236554, 'Marie Peet AirBase', 545, to_date('24-04-2006', 'dd-mm-yyyy'), 395);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (372158, 361952349, 'Rade Ness AirBase', 168, to_date('25-11-1984', 'dd-mm-yyyy'), 81);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (150454, 371702846, 'Jason Saucedo AirBase', 349, to_date('29-09-1986', 'dd-mm-yyyy'), 244);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (837637, 394195602, 'Cathy Loring AirBase', 767, to_date('25-02-1981', 'dd-mm-yyyy'), 195);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (417051, 377221779, 'Sara Mandrell AirBase', 494, to_date('27-03-1999', 'dd-mm-yyyy'), 320);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (153834, 325559062, 'Lance Hart AirBase', 684, to_date('19-02-2009', 'dd-mm-yyyy'), 547);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (412802, 352638775, 'Jarvis Navarro AirBase', 742, to_date('24-08-1992', 'dd-mm-yyyy'), 321);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (622973, 367850455, 'Spencer Pigott-Smith AirBase', 16, to_date('30-12-1986', 'dd-mm-yyyy'), 389);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (452847, 309640599, 'Salma Colon AirBase', 308, to_date('20-03-1995', 'dd-mm-yyyy'), 552);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (101700, 397555975, 'Rutger Diaz AirBase', 352, to_date('23-09-2008', 'dd-mm-yyyy'), 261);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (907109, 369064381, 'Jeffery Stanton AirBase', 315, to_date('09-09-2016', 'dd-mm-yyyy'), 104);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (449192, 336272706, 'Elisabeth Hannah AirBase', 7, to_date('30-08-2007', 'dd-mm-yyyy'), 212);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (678525, 338056009, 'Cathy Loring AirBase', 460, to_date('09-11-1983', 'dd-mm-yyyy'), 332);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (539028, 318491566, 'Angela Coburn AirBase', 507, to_date('12-07-1982', 'dd-mm-yyyy'), 381);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (980198, 336124367, 'Alice McDormand AirBase', 447, to_date('11-01-2004', 'dd-mm-yyyy'), 86);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (286388, 345556162, 'Daniel Moody AirBase', 210, to_date('28-01-1994', 'dd-mm-yyyy'), 202);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (475542, 347293499, 'Joseph Keeslar AirBase', 153, to_date('23-09-2001', 'dd-mm-yyyy'), 29);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (967153, 359072464, 'Rachid Bailey AirBase', 710, to_date('30-07-1990', 'dd-mm-yyyy'), 349);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (470474, 326747654, 'Alice Russo AirBase', 689, to_date('27-02-2010', 'dd-mm-yyyy'), 431);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (830462, 393814153, 'Lili Weaver AirBase', 690, to_date('09-03-1993', 'dd-mm-yyyy'), 449);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (371724, 307851623, 'Dan Fraser AirBase', 715, to_date('26-08-2015', 'dd-mm-yyyy'), 13);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (531283, 365255583, 'Embeth Tyson AirBase', 100, to_date('13-07-2006', 'dd-mm-yyyy'), 510);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (750312, 339436379, 'Ashley Rock AirBase', 181, to_date('02-10-1985', 'dd-mm-yyyy'), 26);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (734574, 318249490, 'David Aiken AirBase', 91, to_date('07-06-1996', 'dd-mm-yyyy'), 574);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (974273, 360828946, 'Mike Quinn AirBase', 642, to_date('31-01-2008', 'dd-mm-yyyy'), 170);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (567579, 307254506, 'Shawn Pressly AirBase', 407, to_date('15-03-1993', 'dd-mm-yyyy'), 336);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (199681, 369016068, 'Rebecca Biel AirBase', 324, to_date('17-08-2015', 'dd-mm-yyyy'), 286);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (421839, 392036198, 'Keith Beatty AirBase', 66, to_date('14-05-2011', 'dd-mm-yyyy'), 38);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (834027, 317262044, 'Leonardo Diddley AirBase', 695, to_date('22-08-2012', 'dd-mm-yyyy'), 31);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (231468, 369064381, 'Nickel Place AirBase', 207, to_date('04-04-1991', 'dd-mm-yyyy'), 529);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (311035, 389437960, 'Rade Ness AirBase', 702, to_date('20-10-2003', 'dd-mm-yyyy'), 139);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (779265, 320248553, 'Lennie Colman AirBase', 165, to_date('22-05-2020', 'dd-mm-yyyy'), 559);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (440962, 317899278, 'Tony Robinson AirBase', 646, to_date('02-10-2015', 'dd-mm-yyyy'), 129);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (507217, 368479535, 'Collin Cheadle AirBase', 430, to_date('27-12-2010', 'dd-mm-yyyy'), 133);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (825443, 327204421, 'Alfie Sayer AirBase', 248, to_date('23-09-1980', 'dd-mm-yyyy'), 500);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (332957, 373130046, 'Rascal McGovern AirBase', 763, to_date('12-08-1994', 'dd-mm-yyyy'), 587);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (650958, 325413907, 'Kate Gere AirBase', 473, to_date('29-05-2018', 'dd-mm-yyyy'), 433);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (398751, 317296920, 'Armin Day-Lewis AirBase', 319, to_date('06-04-2021', 'dd-mm-yyyy'), 486);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (999969, 379808603, 'Lynette Sheen AirBase', 470, to_date('11-08-1982', 'dd-mm-yyyy'), 511);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (804556, 361952349, 'Diane Getty AirBase', 447, to_date('10-11-2004', 'dd-mm-yyyy'), 155);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (943799, 351043069, 'Jena Loring AirBase', 403, to_date('25-01-2006', 'dd-mm-yyyy'), 596);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (601728, 363548957, 'Marty Goodman AirBase', 635, to_date('25-07-1993', 'dd-mm-yyyy'), 46);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (706308, 371877932, 'Jim Michael AirBase', 315, to_date('10-11-2006', 'dd-mm-yyyy'), 312);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (348938, 356938392, 'Jose Spears AirBase', 644, to_date('04-10-2009', 'dd-mm-yyyy'), 158);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (212435, 306476518, 'Katrin Pastore AirBase', 610, to_date('10-09-1994', 'dd-mm-yyyy'), 236);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (256853, 383146514, 'Mac Coburn AirBase', 519, to_date('02-03-2001', 'dd-mm-yyyy'), 181);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (460668, 311073451, 'Ron El-Saher AirBase', 295, to_date('09-09-2001', 'dd-mm-yyyy'), 317);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (573156, 386850983, 'Jane Bedelia AirBase', 709, to_date('27-12-1992', 'dd-mm-yyyy'), 188);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (983492, 388333169, 'Lea Crow AirBase', 561, to_date('08-11-1984', 'dd-mm-yyyy'), 438);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (284453, 305122832, 'Davis Redford AirBase', 796, to_date('11-06-1995', 'dd-mm-yyyy'), 77);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (384903, 384295384, 'Lili Weaver AirBase', 654, to_date('24-10-2015', 'dd-mm-yyyy'), 508);
insert into FLIGHT (flightid, id, name, serialid, flight_date, duration)
values (336640, 301522752, 'Millie Dunaway AirBase', 254, to_date('28-08-1987', 'dd-mm-yyyy'), 249);
commit;
prompt 400 records loaded
prompt Loading TECHNICAL_ENGINEER...
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (273317894, 'Associate''s Degree', 'adjust', 103370);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (220098572, 'Associate''s Degree', 'modify', 104760);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (267517965, 'Bachelor''s Degree', 'change', 101860);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (247097361, 'Master''s Degree', 'fix', 105560);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (221485074, 'Associate''s Degree', 'repair', 100820);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (261791763, 'HighSchool Diploma', 'repair', 102120);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (272384020, 'Master''s Degree', 'repair', 100550);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (276197396, 'Associate''s Degree', 'change', 101960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (282400795, 'PhD', 'change', 104310);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (274223134, 'Master''s Degree', 'modify', 115570);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (293363749, 'PhD', 'repair', 106180);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (243775536, 'Associate''s Degree', 'modify', 116910);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (263968821, 'HighSchool Diploma', 'modify', 101260);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (264970298, 'Master''s Degree', 'adjust', 101430);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (223346749, 'Master''s Degree', 'change', 100850);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266756172, 'PhD', 'change', 101070);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (224950365, 'PhD', 'repair', 103220);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281784417, 'Associate''s Degree', 'adjust', 100220);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266612834, 'Bachelor''s Degree', 'fix', 102060);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (272115809, 'HighSchool Diploma', 'fix', 107580);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (245559396, 'Master''s Degree', 'repair', 107590);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (263020646, 'Bachelor''s Degree', 'repair', 100960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (275791974, 'HighSchool Diploma', 'repair', 101690);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (240767084, 'Associate''s Degree', 'repair', 104270);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281612412, 'Master''s Degree', 'modify', 100710);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (262379648, 'Bachelor''s Degree', 'adjust', 100400);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (277426304, 'Associate''s Degree', 'adjust', 101520);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (210845827, 'HighSchool Diploma', 'fix', 100980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (279249032, 'Associate''s Degree', 'adjust', 116750);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (202506383, 'Associate''s Degree', 'modify', 107030);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (227414161, 'Bachelor''s Degree', 'adjust', 101810);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (232370337, 'HighSchool Diploma', 'repair', 100010);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (207710374, 'PhD', 'adjust', 104110);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250005671, 'Associate''s Degree', 'change', 102580);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (245647526, 'HighSchool Diploma', 'adjust', 104660);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (212367526, 'Associate''s Degree', 'repair', 105800);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (228198573, 'Associate''s Degree', 'modify', 101370);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285282479, 'HighSchool Diploma', 'adjust', 104070);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (215910601, 'Bachelor''s Degree', 'repair', 123660);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (255277263, 'Bachelor''s Degree', 'modify', 108600);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (231696592, 'Bachelor''s Degree', 'repair', 100690);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (255699157, 'Bachelor''s Degree', 'change', 107040);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (290011356, 'Bachelor''s Degree', 'change', 102930);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (219965661, 'Master''s Degree', 'fix', 106240);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (234815710, 'PhD', 'change', 101750);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (254316764, 'PhD', 'fix', 106720);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (236701923, 'Associate''s Degree', 'modify', 117330);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283336932, 'PhD', 'modify', 103000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (204642542, 'PhD', 'change', 100880);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (213342450, 'PhD', 'fix', 103280);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (270870772, 'Bachelor''s Degree', 'adjust', 100170);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (271292662, 'Master''s Degree', 'adjust', 100150);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (205236470, 'Master''s Degree', 'change', 104210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (296689914, 'PhD', 'change', 110740);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (242215174, 'Bachelor''s Degree', 'repair', 104670);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (237914383, 'Associate''s Degree', 'fix', 101510);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (230322450, 'Master''s Degree', 'repair', 101330);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (209002775, 'HighSchool Diploma', 'repair', 104790);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (241010968, 'PhD', 'change', 102450);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211679520, 'Bachelor''s Degree', 'modify', 101830);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (286781734, 'Bachelor''s Degree', 'change', 102520);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (226550059, 'HighSchool Diploma', 'change', 105570);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (202176818, 'Associate''s Degree', 'fix', 107620);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211370297, 'Master''s Degree', 'adjust', 100000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (239169856, 'Associate''s Degree', 'adjust', 101790);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (273381701, 'Master''s Degree', 'adjust', 105000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (265113936, 'Master''s Degree', 'modify', 112040);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266445149, 'Bachelor''s Degree', 'fix', 112130);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (225960286, 'PhD', 'fix', 100830);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (276949346, 'PhD', 'modify', 102000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (246155619, 'Bachelor''s Degree', 'change', 100680);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211974501, 'Associate''s Degree', 'repair', 106380);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (272748906, 'PhD', 'repair', 100180);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (246305138, 'HighSchool Diploma', 'adjust', 101610);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283740532, 'Associate''s Degree', 'fix', 115910);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211607938, 'Master''s Degree', 'fix', 100700);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (292237699, 'Associate''s Degree', 'adjust', 102240);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (212486535, 'Master''s Degree', 'modify', 100250);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (235698590, 'Bachelor''s Degree', 'fix', 102020);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (254663078, 'PhD', 'fix', 106860);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (241998248, 'HighSchool Diploma', 'fix', 109980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (222888385, 'PhD', 'fix', 106540);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (256485829, 'Associate''s Degree', 'repair', 101210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (291492297, 'Bachelor''s Degree', 'modify', 103600);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (217276877, 'PhD', 'repair', 101180);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (277799386, 'HighSchool Diploma', 'adjust', 100080);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (216754654, 'PhD', 'change', 105950);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (200387058, 'Associate''s Degree', 'repair', 115010);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (218040824, 'HighSchool Diploma', 'fix', 100840);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (218270200, 'Bachelor''s Degree', 'adjust', 100200);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (265392648, 'Bachelor''s Degree', 'fix', 102400);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281580042, 'Associate''s Degree', 'adjust', 101970);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (213113355, 'PhD', 'change', 100530);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (203674125, 'Bachelor''s Degree', 'change', 102380);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (255709716, 'Associate''s Degree', 'change', 103020);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (224256534, 'PhD', 'adjust', 100160);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (274254359, 'Associate''s Degree', 'modify', 101100);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (242717208, 'Bachelor''s Degree', 'modify', 103830);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (252867096, 'PhD', 'repair', 107930);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (230844972, 'Associate''s Degree', 'modify', 101020);
commit;
prompt 100 records committed...
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (280015404, 'Associate''s Degree', 'modify', 105040);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (248341037, 'HighSchool Diploma', 'modify', 105360);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (296407602, 'Master''s Degree', 'repair', 103300);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (258114104, 'PhD', 'fix', 104400);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (257366591, 'Master''s Degree', 'repair', 102960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (294015557, 'PhD', 'adjust', 101990);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (244732500, 'PhD', 'modify', 100270);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (262759003, 'Bachelor''s Degree', 'change', 103030);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (257876572, 'HighSchool Diploma', 'modify', 101360);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (284582496, 'Master''s Degree', 'repair', 101980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (293806695, 'Associate''s Degree', 'repair', 103960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (233073266, 'HighSchool Diploma', 'modify', 102550);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (262316659, 'Associate''s Degree', 'change', 101340);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (278514293, 'HighSchool Diploma', 'change', 100130);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (218886775, 'PhD', 'modify', 100520);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (294470263, 'Bachelor''s Degree', 'modify', 102420);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (203807353, 'PhD', 'change', 109460);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (295551610, 'HighSchool Diploma', 'repair', 107230);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (234984060, 'PhD', 'adjust', 101050);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (231348871, 'Bachelor''s Degree', 'adjust', 100140);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (233331336, 'HighSchool Diploma', 'repair', 100500);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (229384841, 'HighSchool Diploma', 'repair', 103860);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (257145485, 'Bachelor''s Degree', 'repair', 101630);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (203143823, 'PhD', 'modify', 108620);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (267631250, 'HighSchool Diploma', 'fix', 104880);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (287318682, 'Master''s Degree', 'adjust', 101190);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (228614816, 'Bachelor''s Degree', 'repair', 100540);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285293227, 'HighSchool Diploma', 'fix', 109680);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (241988269, 'Master''s Degree', 'repair', 100780);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (252431023, 'HighSchool Diploma', 'repair', 101280);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (290714294, 'PhD', 'adjust', 104380);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (247077560, 'Master''s Degree', 'adjust', 101320);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (258149052, 'Associate''s Degree', 'repair', 103800);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (212878020, 'Master''s Degree', 'fix', 102920);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208249542, 'Bachelor''s Degree', 'change', 100240);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (287062738, 'Associate''s Degree', 'adjust', 103540);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (225026778, 'PhD', 'adjust', 100910);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283259618, 'Bachelor''s Degree', 'adjust', 112000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283071208, 'Associate''s Degree', 'modify', 100040);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (279282410, 'Master''s Degree', 'fix', 102950);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (261685997, 'PhD', 'repair', 100330);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (270557935, 'HighSchool Diploma', 'modify', 103080);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (282561272, 'HighSchool Diploma', 'adjust', 100940);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (274567928, 'Associate''s Degree', 'adjust', 101390);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (221000440, 'Bachelor''s Degree', 'modify', 101400);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (240481019, 'PhD', 'repair', 102100);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (248603389, 'Master''s Degree', 'change', 103480);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (209040130, 'Bachelor''s Degree', 'modify', 100360);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (263023363, 'Master''s Degree', 'repair', 104570);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (276830981, 'Bachelor''s Degree', 'modify', 111970);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (218102535, 'Master''s Degree', 'fix', 110470);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208280328, 'PhD', 'fix', 102780);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283130641, 'PhD', 'adjust', 100790);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (241625873, 'PhD', 'modify', 104060);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (242703125, 'HighSchool Diploma', 'adjust', 100990);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (256514846, 'PhD', 'modify', 101800);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (245768993, 'Master''s Degree', 'repair', 104120);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (286391083, 'Associate''s Degree', 'change', 102350);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (296538924, 'HighSchool Diploma', 'repair', 101900);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285866795, 'HighSchool Diploma', 'modify', 109500);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281350965, 'Master''s Degree', 'change', 118650);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (251953975, 'HighSchool Diploma', 'adjust', 103180);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (213504836, 'Associate''s Degree', 'change', 106110);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (290929479, 'HighSchool Diploma', 'adjust', 102510);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (207039313, 'HighSchool Diploma', 'fix', 102980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (269988693, 'Master''s Degree', 'fix', 102500);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (246457178, 'Associate''s Degree', 'modify', 101200);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (206361434, 'HighSchool Diploma', 'modify', 114560);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250913628, 'PhD', 'modify', 110250);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250344291, 'Associate''s Degree', 'repair', 100620);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283761508, 'Master''s Degree', 'repair', 101350);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (290472808, 'Bachelor''s Degree', 'modify', 100050);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (239379314, 'Master''s Degree', 'change', 109350);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (286841717, 'Associate''s Degree', 'repair', 102870);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (227146613, 'Master''s Degree', 'modify', 105960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (217219961, 'PhD', 'modify', 106060);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (244257658, 'Bachelor''s Degree', 'change', 103270);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (223099775, 'HighSchool Diploma', 'change', 103630);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (236452747, 'Bachelor''s Degree', 'adjust', 103400);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (293249932, 'PhD', 'modify', 103640);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (282602391, 'Bachelor''s Degree', 'change', 105110);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (228952988, 'Bachelor''s Degree', 'adjust', 102700);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (228594598, 'Bachelor''s Degree', 'adjust', 106210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (230198185, 'HighSchool Diploma', 'fix', 104720);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (228115379, 'Master''s Degree', 'repair', 100110);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281928641, 'Bachelor''s Degree', 'adjust', 102230);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (261514186, 'PhD', 'repair', 105290);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (200313811, 'HighSchool Diploma', 'change', 105670);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283956186, 'Associate''s Degree', 'modify', 102830);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (219833309, 'Bachelor''s Degree', 'adjust', 100030);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (295623646, 'Master''s Degree', 'modify', 103260);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (265540575, 'Bachelor''s Degree', 'fix', 106270);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (232037345, 'Bachelor''s Degree', 'fix', 107970);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (249121769, 'Associate''s Degree', 'repair', 101660);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (203924458, 'Master''s Degree', 'modify', 100510);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (269675504, 'HighSchool Diploma', 'fix', 103690);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (259474417, 'PhD', 'adjust', 102190);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (244857843, 'PhD', 'repair', 100100);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (262179843, 'HighSchool Diploma', 'repair', 101850);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (259169287, 'Associate''s Degree', 'fix', 100720);
commit;
prompt 200 records committed...
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (236682255, 'Associate''s Degree', 'adjust', 100460);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (246602769, 'Master''s Degree', 'change', 104630);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281254938, 'HighSchool Diploma', 'modify', 101460);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (259591196, 'Master''s Degree', 'modify', 107570);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (278811684, 'Master''s Degree', 'repair', 101470);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (284951591, 'PhD', 'modify', 101880);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (222831659, 'Master''s Degree', 'repair', 103590);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (213562417, 'HighSchool Diploma', 'repair', 109780);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (202761268, 'PhD', 'modify', 100660);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (242783287, 'HighSchool Diploma', 'adjust', 101040);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211190842, 'Master''s Degree', 'repair', 100430);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250276923, 'Associate''s Degree', 'fix', 100640);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (278864964, 'HighSchool Diploma', 'fix', 100670);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (263773252, 'Master''s Degree', 'change', 102050);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (201223241, 'Bachelor''s Degree', 'change', 102820);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (235557961, 'HighSchool Diploma', 'fix', 124900);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (221361227, 'Associate''s Degree', 'modify', 115710);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (247243857, 'Bachelor''s Degree', 'change', 104230);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (237960278, 'Associate''s Degree', 'change', 103430);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (271031383, 'Associate''s Degree', 'modify', 100190);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (249543773, 'Bachelor''s Degree', 'fix', 101670);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (237581407, 'PhD', 'adjust', 101680);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (244493407, 'Associate''s Degree', 'adjust', 103910);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285047907, 'Master''s Degree', 'modify', 104000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (200473707, 'HighSchool Diploma', 'modify', 101480);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208188533, 'Master''s Degree', 'change', 101300);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (260662391, 'Master''s Degree', 'repair', 100020);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (248169596, 'HighSchool Diploma', 'repair', 105850);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (263306372, 'HighSchool Diploma', 'change', 100800);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (251024518, 'HighSchool Diploma', 'modify', 101560);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285764748, 'HighSchool Diploma', 'fix', 115980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (206247058, 'Master''s Degree', 'adjust', 101720);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (275831961, 'HighSchool Diploma', 'adjust', 105460);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (257746076, 'PhD', 'modify', 106530);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (222825630, 'HighSchool Diploma', 'change', 103340);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (264228011, 'HighSchool Diploma', 'fix', 106260);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (289531061, 'Associate''s Degree', 'modify', 100290);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (239213755, 'Bachelor''s Degree', 'adjust', 100440);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208362687, 'Associate''s Degree', 'modify', 100750);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (237778114, 'Bachelor''s Degree', 'change', 100380);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (278222021, 'Bachelor''s Degree', 'fix', 113330);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (220738772, 'PhD', 'modify', 101490);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (218309845, 'Master''s Degree', 'fix', 100230);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208448726, 'Associate''s Degree', 'change', 101600);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281283799, 'Master''s Degree', 'modify', 102990);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (253867228, 'Master''s Degree', 'change', 105300);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (245765352, 'Bachelor''s Degree', 'repair', 100630);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (292244714, 'Bachelor''s Degree', 'adjust', 104450);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (284808427, 'Bachelor''s Degree', 'change', 109620);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (284542188, 'Master''s Degree', 'modify', 103410);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283434229, 'PhD', 'repair', 107940);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (274160886, 'Master''s Degree', 'repair', 100810);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (270454008, 'Associate''s Degree', 'change', 115350);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (258182394, 'HighSchool Diploma', 'adjust', 102670);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250858754, 'Associate''s Degree', 'change', 101650);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (225805571, 'HighSchool Diploma', 'fix', 108400);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (297035013, 'Master''s Degree', 'modify', 100060);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (288906503, 'Associate''s Degree', 'repair', 104640);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (243963149, 'Associate''s Degree', 'fix', 102220);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (238535952, 'Bachelor''s Degree', 'repair', 104460);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (232303898, 'Associate''s Degree', 'adjust', 100370);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (253517082, 'Associate''s Degree', 'repair', 103250);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208586019, 'PhD', 'adjust', 106920);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250500388, 'Bachelor''s Degree', 'change', 110630);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (242351401, 'PhD', 'change', 102490);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (237419822, 'PhD', 'repair', 102570);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (232158523, 'HighSchool Diploma', 'modify', 100730);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (254672187, 'Bachelor''s Degree', 'modify', 101000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (277622076, 'Bachelor''s Degree', 'change', 101700);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (238447934, 'Associate''s Degree', 'adjust', 100120);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (290846028, 'Bachelor''s Degree', 'change', 102280);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (228064589, 'HighSchool Diploma', 'change', 101150);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (202609997, 'PhD', 'adjust', 105540);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (208012624, 'Bachelor''s Degree', 'change', 104250);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (201602389, 'Associate''s Degree', 'modify', 104680);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (226311528, 'Bachelor''s Degree', 'modify', 103680);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (245818731, 'Master''s Degree', 'adjust', 108170);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (249451886, 'PhD', 'adjust', 100610);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (216132990, 'Bachelor''s Degree', 'modify', 100600);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (279524736, 'PhD', 'change', 100090);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (238531970, 'HighSchool Diploma', 'repair', 101770);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (288621954, 'Master''s Degree', 'adjust', 114980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (204248457, 'Master''s Degree', 'repair', 105420);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (261612941, 'Associate''s Degree', 'adjust', 101450);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (249562512, 'HighSchool Diploma', 'adjust', 104140);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (233262480, 'Associate''s Degree', 'modify', 105160);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (259673490, 'PhD', 'adjust', 114010);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (234751380, 'HighSchool Diploma', 'repair', 112080);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (239709592, 'HighSchool Diploma', 'adjust', 102160);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (288329113, 'Master''s Degree', 'fix', 104960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (274052509, 'Bachelor''s Degree', 'modify', 111510);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (281343404, 'PhD', 'adjust', 107380);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (201428401, 'Bachelor''s Degree', 'modify', 100390);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (245331396, 'Bachelor''s Degree', 'modify', 101710);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (251538887, 'Bachelor''s Degree', 'fix', 100490);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (225275338, 'Master''s Degree', 'fix', 100310);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (204697038, 'Bachelor''s Degree', 'adjust', 106460);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (272877011, 'Bachelor''s Degree', 'modify', 100280);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (235335126, 'HighSchool Diploma', 'fix', 100890);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (213315031, 'Bachelor''s Degree', 'fix', 101130);
commit;
prompt 300 records committed...
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250453465, 'PhD', 'repair', 100320);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (289957341, 'HighSchool Diploma', 'fix', 100210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (221019615, 'PhD', 'repair', 110790);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (284300779, 'Master''s Degree', 'change', 101840);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (234391026, 'HighSchool Diploma', 'adjust', 103980);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (209698295, 'Bachelor''s Degree', 'change', 102710);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (293735930, 'Bachelor''s Degree', 'change', 105310);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (272987663, 'Associate''s Degree', 'repair', 110000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (270779920, 'Associate''s Degree', 'repair', 102810);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285591057, 'Master''s Degree', 'adjust', 101550);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (218910229, 'HighSchool Diploma', 'adjust', 108880);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (231978518, 'Associate''s Degree', 'repair', 110070);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (231953943, 'Master''s Degree', 'repair', 109100);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283858458, 'Master''s Degree', 'repair', 111440);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (227460641, 'Master''s Degree', 'fix', 101590);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (265547298, 'Associate''s Degree', 'fix', 100760);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211357219, 'Master''s Degree', 'repair', 104480);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (205547055, 'Associate''s Degree', 'modify', 101940);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (204080690, 'Master''s Degree', 'modify', 103500);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266014264, 'PhD', 'adjust', 104390);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (248690235, 'HighSchool Diploma', 'modify', 102600);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (202262081, 'Master''s Degree', 'fix', 100340);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (216675905, 'HighSchool Diploma', 'repair', 103970);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (222932554, 'Bachelor''s Degree', 'repair', 100410);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (276332120, 'PhD', 'adjust', 106780);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (291253848, 'Master''s Degree', 'repair', 113630);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (210939483, 'Bachelor''s Degree', 'adjust', 102610);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (252018270, 'Bachelor''s Degree', 'change', 108210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (256155234, 'Master''s Degree', 'change', 105840);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211521123, 'Master''s Degree', 'fix', 103230);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (262973027, 'Master''s Degree', 'change', 104090);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (229582437, 'HighSchool Diploma', 'fix', 107000);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (290969200, 'HighSchool Diploma', 'repair', 102180);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (210445937, 'PhD', 'repair', 104920);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (278310514, 'Associate''s Degree', 'adjust', 110280);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (260900474, 'Bachelor''s Degree', 'modify', 101120);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (255399546, 'HighSchool Diploma', 'modify', 112990);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (220958338, 'PhD', 'change', 106660);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266747526, 'Master''s Degree', 'adjust', 103930);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (230645399, 'Associate''s Degree', 'fix', 100950);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (217732764, 'Master''s Degree', 'repair', 100070);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (252913310, 'PhD', 'fix', 102070);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (211015332, 'Associate''s Degree', 'repair', 100480);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (241196716, 'PhD', 'adjust', 103110);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (237409965, 'HighSchool Diploma', 'adjust', 100560);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (244569777, 'Master''s Degree', 'adjust', 103160);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (274349753, 'HighSchool Diploma', 'adjust', 113470);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (231096004, 'Associate''s Degree', 'change', 108650);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (231274183, 'PhD', 'adjust', 100650);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (205893325, 'PhD', 'repair', 109290);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (217409233, 'Bachelor''s Degree', 'adjust', 105750);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (220360403, 'Bachelor''s Degree', 'modify', 102010);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (225531610, 'Associate''s Degree', 'repair', 103810);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (255543002, 'Associate''s Degree', 'change', 109130);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (285269724, 'Bachelor''s Degree', 'repair', 112780);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (271073001, 'HighSchool Diploma', 'fix', 102940);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (217022192, 'Master''s Degree', 'repair', 100740);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (200257272, 'Bachelor''s Degree', 'fix', 103950);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (268173055, 'Bachelor''s Degree', 'fix', 106140);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (267161344, 'HighSchool Diploma', 'modify', 105270);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (242284292, 'HighSchool Diploma', 'fix', 104370);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (293961478, 'Master''s Degree', 'adjust', 103210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (246107920, 'Bachelor''s Degree', 'adjust', 104700);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (254992151, 'Master''s Degree', 'change', 106330);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (294348574, 'Associate''s Degree', 'adjust', 104030);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266739488, 'Associate''s Degree', 'adjust', 102170);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (233082662, 'Associate''s Degree', 'fix', 100260);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283492160, 'PhD', 'change', 106300);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (248641347, 'Bachelor''s Degree', 'adjust', 110260);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (296769348, 'PhD', 'modify', 103010);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (283658054, 'Bachelor''s Degree', 'adjust', 100450);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (212223814, 'Bachelor''s Degree', 'modify', 104710);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (224700233, 'Associate''s Degree', 'adjust', 107560);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (222947149, 'Associate''s Degree', 'change', 100920);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (225087331, 'Master''s Degree', 'fix', 106420);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (266346339, 'Bachelor''s Degree', 'modify', 126640);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (280016749, 'Master''s Degree', 'fix', 105060);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (232814448, 'HighSchool Diploma', 'modify', 107320);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (271165297, 'Bachelor''s Degree', 'adjust', 101310);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (252157813, 'HighSchool Diploma', 'change', 100930);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (212047739, 'PhD', 'modify', 101890);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (215783297, 'PhD', 'adjust', 109960);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (287653764, 'PhD', 'adjust', 103720);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (239892364, 'Master''s Degree', 'repair', 102040);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (204726159, 'HighSchool Diploma', 'adjust', 102720);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (250750869, 'Bachelor''s Degree', 'repair', 101290);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (258154389, 'PhD', 'fix', 108920);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (293109655, 'Associate''s Degree', 'change', 103330);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (269283221, 'Master''s Degree', 'repair', 111210);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (235130780, 'Bachelor''s Degree', 'modify', 106430);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (263040929, 'HighSchool Diploma', 'fix', 105810);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (206651299, 'PhD', 'change', 100300);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (235947953, 'PhD', 'change', 107250);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (294942657, 'HighSchool Diploma', 'repair', 104560);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (219574223, 'HighSchool Diploma', 'fix', 100870);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (286506962, 'Associate''s Degree', 'repair', 102370);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (255094739, 'PhD', 'modify', 102360);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (251473876, 'PhD', 'repair', 106050);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (271298547, 'Master''s Degree', 'change', 100590);
insert into TECHNICAL_ENGINEER (id, degree, speciality, licencenumber)
values (253206515, 'PhD', 'change', 104590);
commit;
prompt 400 records loaded
prompt Loading UAV...
insert into UAV (serialid, battry, communication, control_range)
values (400, 14, 'Laser', 76);
insert into UAV (serialid, battry, communication, control_range)
values (401, 94, 'Sattelite', 423);
insert into UAV (serialid, battry, communication, control_range)
values (402, 20, 'Radio', 296);
insert into UAV (serialid, battry, communication, control_range)
values (403, 34, 'Laser', 82);
insert into UAV (serialid, battry, communication, control_range)
values (404, 19, 'GPS', 328);
insert into UAV (serialid, battry, communication, control_range)
values (405, 62, 'GPS', 385);
insert into UAV (serialid, battry, communication, control_range)
values (406, 5, 'GPS', 235);
insert into UAV (serialid, battry, communication, control_range)
values (407, 61, 'Sattelite', 217);
insert into UAV (serialid, battry, communication, control_range)
values (408, 10, 'GPS', 480);
insert into UAV (serialid, battry, communication, control_range)
values (409, 95, 'Sattelite', 33);
insert into UAV (serialid, battry, communication, control_range)
values (410, 20, 'GPS', 435);
insert into UAV (serialid, battry, communication, control_range)
values (411, 92, 'Laser', 369);
insert into UAV (serialid, battry, communication, control_range)
values (412, 78, 'GPS', 392);
insert into UAV (serialid, battry, communication, control_range)
values (413, 6, 'Laser', 377);
insert into UAV (serialid, battry, communication, control_range)
values (414, 82, 'Laser', 482);
insert into UAV (serialid, battry, communication, control_range)
values (415, 37, 'Laser', 184);
insert into UAV (serialid, battry, communication, control_range)
values (416, 54, 'Laser', 182);
insert into UAV (serialid, battry, communication, control_range)
values (417, 72, 'Sattelite', 216);
insert into UAV (serialid, battry, communication, control_range)
values (418, 25, 'Sattelite', 117);
insert into UAV (serialid, battry, communication, control_range)
values (419, 14, 'Radio', 500);
insert into UAV (serialid, battry, communication, control_range)
values (420, 92, 'GPS', 50);
insert into UAV (serialid, battry, communication, control_range)
values (421, 73, 'GPS', 41);
insert into UAV (serialid, battry, communication, control_range)
values (422, 83, 'Laser', 26);
insert into UAV (serialid, battry, communication, control_range)
values (423, 29, 'Laser', 315);
insert into UAV (serialid, battry, communication, control_range)
values (424, 35, 'GPS', 55);
insert into UAV (serialid, battry, communication, control_range)
values (425, 2, 'Radio', 230);
insert into UAV (serialid, battry, communication, control_range)
values (426, 49, 'Sattelite', 416);
insert into UAV (serialid, battry, communication, control_range)
values (427, 14, 'Radio', 464);
insert into UAV (serialid, battry, communication, control_range)
values (428, 21, 'GPS', 199);
insert into UAV (serialid, battry, communication, control_range)
values (429, 86, 'Sattelite', 355);
insert into UAV (serialid, battry, communication, control_range)
values (430, 89, 'Radio', 487);
insert into UAV (serialid, battry, communication, control_range)
values (431, 60, 'GPS', 265);
insert into UAV (serialid, battry, communication, control_range)
values (432, 15, 'Laser', 298);
insert into UAV (serialid, battry, communication, control_range)
values (433, 79, 'Laser', 169);
insert into UAV (serialid, battry, communication, control_range)
values (434, 39, 'Laser', 47);
insert into UAV (serialid, battry, communication, control_range)
values (435, 56, 'GPS', 34);
insert into UAV (serialid, battry, communication, control_range)
values (436, 35, 'Sattelite', 238);
insert into UAV (serialid, battry, communication, control_range)
values (437, 56, 'Radio', 491);
insert into UAV (serialid, battry, communication, control_range)
values (438, 23, 'Laser', 267);
insert into UAV (serialid, battry, communication, control_range)
values (439, 29, 'Laser', 392);
insert into UAV (serialid, battry, communication, control_range)
values (440, 100, 'GPS', 338);
insert into UAV (serialid, battry, communication, control_range)
values (441, 16, 'Sattelite', 385);
insert into UAV (serialid, battry, communication, control_range)
values (442, 84, 'Sattelite', 155);
insert into UAV (serialid, battry, communication, control_range)
values (443, 40, 'Sattelite', 214);
insert into UAV (serialid, battry, communication, control_range)
values (444, 93, 'Laser', 205);
insert into UAV (serialid, battry, communication, control_range)
values (445, 47, 'Sattelite', 389);
insert into UAV (serialid, battry, communication, control_range)
values (446, 72, 'Radio', 214);
insert into UAV (serialid, battry, communication, control_range)
values (447, 85, 'Laser', 100);
insert into UAV (serialid, battry, communication, control_range)
values (448, 56, 'Radio', 486);
insert into UAV (serialid, battry, communication, control_range)
values (449, 36, 'Sattelite', 88);
insert into UAV (serialid, battry, communication, control_range)
values (450, 91, 'Sattelite', 307);
insert into UAV (serialid, battry, communication, control_range)
values (451, 8, 'GPS', 198);
insert into UAV (serialid, battry, communication, control_range)
values (452, 33, 'Sattelite', 233);
insert into UAV (serialid, battry, communication, control_range)
values (453, 25, 'GPS', 40);
insert into UAV (serialid, battry, communication, control_range)
values (454, 55, 'Laser', 484);
insert into UAV (serialid, battry, communication, control_range)
values (455, 23, 'Laser', 20);
insert into UAV (serialid, battry, communication, control_range)
values (456, 31, 'Laser', 433);
insert into UAV (serialid, battry, communication, control_range)
values (457, 32, 'Radio', 21);
insert into UAV (serialid, battry, communication, control_range)
values (458, 11, 'Sattelite', 392);
insert into UAV (serialid, battry, communication, control_range)
values (459, 92, 'Radio', 107);
insert into UAV (serialid, battry, communication, control_range)
values (460, 77, 'Laser', 287);
insert into UAV (serialid, battry, communication, control_range)
values (461, 95, 'GPS', 405);
insert into UAV (serialid, battry, communication, control_range)
values (462, 59, 'GPS', 371);
insert into UAV (serialid, battry, communication, control_range)
values (463, 23, 'Radio', 170);
insert into UAV (serialid, battry, communication, control_range)
values (464, 80, 'Radio', 467);
insert into UAV (serialid, battry, communication, control_range)
values (465, 16, 'Radio', 383);
insert into UAV (serialid, battry, communication, control_range)
values (466, 25, 'GPS', 106);
insert into UAV (serialid, battry, communication, control_range)
values (467, 83, 'Laser', 214);
insert into UAV (serialid, battry, communication, control_range)
values (468, 30, 'Laser', 176);
insert into UAV (serialid, battry, communication, control_range)
values (469, 6, 'Sattelite', 60);
insert into UAV (serialid, battry, communication, control_range)
values (470, 24, 'Laser', 145);
insert into UAV (serialid, battry, communication, control_range)
values (471, 13, 'Laser', 477);
insert into UAV (serialid, battry, communication, control_range)
values (472, 95, 'GPS', 37);
insert into UAV (serialid, battry, communication, control_range)
values (473, 49, 'Laser', 382);
insert into UAV (serialid, battry, communication, control_range)
values (474, 79, 'Laser', 434);
insert into UAV (serialid, battry, communication, control_range)
values (475, 36, 'Sattelite', 70);
insert into UAV (serialid, battry, communication, control_range)
values (476, 92, 'Sattelite', 335);
insert into UAV (serialid, battry, communication, control_range)
values (477, 52, 'GPS', 344);
insert into UAV (serialid, battry, communication, control_range)
values (478, 89, 'GPS', 453);
insert into UAV (serialid, battry, communication, control_range)
values (479, 61, 'Laser', 225);
insert into UAV (serialid, battry, communication, control_range)
values (480, 46, 'GPS', 13);
insert into UAV (serialid, battry, communication, control_range)
values (481, 47, 'Sattelite', 382);
insert into UAV (serialid, battry, communication, control_range)
values (482, 84, 'Laser', 243);
insert into UAV (serialid, battry, communication, control_range)
values (483, 13, 'Radio', 481);
insert into UAV (serialid, battry, communication, control_range)
values (484, 72, 'Sattelite', 423);
insert into UAV (serialid, battry, communication, control_range)
values (485, 43, 'Sattelite', 355);
insert into UAV (serialid, battry, communication, control_range)
values (486, 85, 'Sattelite', 287);
insert into UAV (serialid, battry, communication, control_range)
values (487, 2, 'Radio', 358);
insert into UAV (serialid, battry, communication, control_range)
values (488, 25, 'Sattelite', 327);
insert into UAV (serialid, battry, communication, control_range)
values (489, 74, 'Sattelite', 296);
insert into UAV (serialid, battry, communication, control_range)
values (490, 68, 'Sattelite', 279);
insert into UAV (serialid, battry, communication, control_range)
values (491, 41, 'Sattelite', 490);
insert into UAV (serialid, battry, communication, control_range)
values (492, 16, 'GPS', 164);
insert into UAV (serialid, battry, communication, control_range)
values (493, 64, 'Radio', 436);
insert into UAV (serialid, battry, communication, control_range)
values (494, 98, 'Sattelite', 377);
insert into UAV (serialid, battry, communication, control_range)
values (495, 5, 'Sattelite', 292);
insert into UAV (serialid, battry, communication, control_range)
values (496, 96, 'Radio', 333);
insert into UAV (serialid, battry, communication, control_range)
values (497, 15, 'Laser', 78);
insert into UAV (serialid, battry, communication, control_range)
values (498, 86, 'Sattelite', 318);
insert into UAV (serialid, battry, communication, control_range)
values (499, 14, 'Radio', 150);
commit;
prompt 100 records committed...
insert into UAV (serialid, battry, communication, control_range)
values (500, 32, 'Sattelite', 469);
insert into UAV (serialid, battry, communication, control_range)
values (501, 7, 'Sattelite', 424);
insert into UAV (serialid, battry, communication, control_range)
values (502, 77, 'Laser', 235);
insert into UAV (serialid, battry, communication, control_range)
values (503, 48, 'GPS', 26);
insert into UAV (serialid, battry, communication, control_range)
values (504, 54, 'Radio', 433);
insert into UAV (serialid, battry, communication, control_range)
values (505, 28, 'Sattelite', 378);
insert into UAV (serialid, battry, communication, control_range)
values (506, 81, 'GPS', 273);
insert into UAV (serialid, battry, communication, control_range)
values (507, 27, 'Sattelite', 270);
insert into UAV (serialid, battry, communication, control_range)
values (508, 26, 'GPS', 403);
insert into UAV (serialid, battry, communication, control_range)
values (509, 0, 'Sattelite', 496);
insert into UAV (serialid, battry, communication, control_range)
values (510, 0, 'Laser', 140);
insert into UAV (serialid, battry, communication, control_range)
values (511, 49, 'Sattelite', 215);
insert into UAV (serialid, battry, communication, control_range)
values (512, 86, 'Radio', 50);
insert into UAV (serialid, battry, communication, control_range)
values (513, 78, 'Radio', 406);
insert into UAV (serialid, battry, communication, control_range)
values (514, 10, 'Sattelite', 356);
insert into UAV (serialid, battry, communication, control_range)
values (515, 32, 'Radio', 98);
insert into UAV (serialid, battry, communication, control_range)
values (516, 45, 'Laser', 334);
insert into UAV (serialid, battry, communication, control_range)
values (517, 100, 'Radio', 221);
insert into UAV (serialid, battry, communication, control_range)
values (518, 5, 'GPS', 206);
insert into UAV (serialid, battry, communication, control_range)
values (519, 15, 'GPS', 167);
insert into UAV (serialid, battry, communication, control_range)
values (520, 44, 'GPS', 291);
insert into UAV (serialid, battry, communication, control_range)
values (521, 53, 'Sattelite', 358);
insert into UAV (serialid, battry, communication, control_range)
values (522, 19, 'Radio', 282);
insert into UAV (serialid, battry, communication, control_range)
values (523, 31, 'Sattelite', 308);
insert into UAV (serialid, battry, communication, control_range)
values (524, 23, 'Laser', 438);
insert into UAV (serialid, battry, communication, control_range)
values (525, 72, 'Laser', 199);
insert into UAV (serialid, battry, communication, control_range)
values (526, 66, 'GPS', 463);
insert into UAV (serialid, battry, communication, control_range)
values (527, 24, 'GPS', 182);
insert into UAV (serialid, battry, communication, control_range)
values (528, 19, 'GPS', 20);
insert into UAV (serialid, battry, communication, control_range)
values (529, 64, 'GPS', 82);
insert into UAV (serialid, battry, communication, control_range)
values (530, 78, 'Laser', 472);
insert into UAV (serialid, battry, communication, control_range)
values (531, 2, 'Laser', 18);
insert into UAV (serialid, battry, communication, control_range)
values (532, 36, 'Radio', 467);
insert into UAV (serialid, battry, communication, control_range)
values (533, 61, 'Sattelite', 437);
insert into UAV (serialid, battry, communication, control_range)
values (534, 28, 'Radio', 482);
insert into UAV (serialid, battry, communication, control_range)
values (535, 39, 'GPS', 351);
insert into UAV (serialid, battry, communication, control_range)
values (536, 23, 'Radio', 58);
insert into UAV (serialid, battry, communication, control_range)
values (537, 18, 'GPS', 340);
insert into UAV (serialid, battry, communication, control_range)
values (538, 67, 'Sattelite', 338);
insert into UAV (serialid, battry, communication, control_range)
values (539, 54, 'GPS', 82);
insert into UAV (serialid, battry, communication, control_range)
values (540, 64, 'Laser', 284);
insert into UAV (serialid, battry, communication, control_range)
values (541, 26, 'Laser', 338);
insert into UAV (serialid, battry, communication, control_range)
values (542, 5, 'Laser', 494);
insert into UAV (serialid, battry, communication, control_range)
values (543, 55, 'Radio', 255);
insert into UAV (serialid, battry, communication, control_range)
values (544, 77, 'Radio', 295);
insert into UAV (serialid, battry, communication, control_range)
values (545, 85, 'Laser', 301);
insert into UAV (serialid, battry, communication, control_range)
values (546, 29, 'Radio', 40);
insert into UAV (serialid, battry, communication, control_range)
values (547, 9, 'GPS', 410);
insert into UAV (serialid, battry, communication, control_range)
values (548, 54, 'Sattelite', 181);
insert into UAV (serialid, battry, communication, control_range)
values (549, 74, 'Laser', 321);
insert into UAV (serialid, battry, communication, control_range)
values (550, 28, 'Laser', 94);
insert into UAV (serialid, battry, communication, control_range)
values (551, 76, 'Radio', 40);
insert into UAV (serialid, battry, communication, control_range)
values (552, 6, 'GPS', 25);
insert into UAV (serialid, battry, communication, control_range)
values (553, 27, 'Sattelite', 97);
insert into UAV (serialid, battry, communication, control_range)
values (554, 68, 'GPS', 302);
insert into UAV (serialid, battry, communication, control_range)
values (555, 25, 'Radio', 138);
insert into UAV (serialid, battry, communication, control_range)
values (556, 96, 'Radio', 495);
insert into UAV (serialid, battry, communication, control_range)
values (557, 60, 'GPS', 157);
insert into UAV (serialid, battry, communication, control_range)
values (558, 48, 'Radio', 410);
insert into UAV (serialid, battry, communication, control_range)
values (559, 19, 'Radio', 412);
insert into UAV (serialid, battry, communication, control_range)
values (560, 46, 'Radio', 30);
insert into UAV (serialid, battry, communication, control_range)
values (561, 35, 'Sattelite', 97);
insert into UAV (serialid, battry, communication, control_range)
values (562, 9, 'Laser', 304);
insert into UAV (serialid, battry, communication, control_range)
values (563, 39, 'Sattelite', 158);
insert into UAV (serialid, battry, communication, control_range)
values (564, 100, 'GPS', 20);
insert into UAV (serialid, battry, communication, control_range)
values (565, 76, 'GPS', 406);
insert into UAV (serialid, battry, communication, control_range)
values (566, 1, 'Radio', 408);
insert into UAV (serialid, battry, communication, control_range)
values (567, 62, 'Radio', 98);
insert into UAV (serialid, battry, communication, control_range)
values (568, 39, 'Laser', 29);
insert into UAV (serialid, battry, communication, control_range)
values (569, 21, 'Radio', 330);
insert into UAV (serialid, battry, communication, control_range)
values (570, 13, 'Sattelite', 15);
insert into UAV (serialid, battry, communication, control_range)
values (571, 52, 'Laser', 160);
insert into UAV (serialid, battry, communication, control_range)
values (572, 84, 'GPS', 105);
insert into UAV (serialid, battry, communication, control_range)
values (573, 22, 'Sattelite', 78);
insert into UAV (serialid, battry, communication, control_range)
values (574, 26, 'Radio', 103);
insert into UAV (serialid, battry, communication, control_range)
values (575, 2, 'Laser', 77);
insert into UAV (serialid, battry, communication, control_range)
values (576, 57, 'Laser', 334);
insert into UAV (serialid, battry, communication, control_range)
values (577, 6, 'Laser', 65);
insert into UAV (serialid, battry, communication, control_range)
values (578, 49, 'Radio', 109);
insert into UAV (serialid, battry, communication, control_range)
values (579, 37, 'GPS', 488);
insert into UAV (serialid, battry, communication, control_range)
values (580, 62, 'Laser', 187);
insert into UAV (serialid, battry, communication, control_range)
values (581, 56, 'Laser', 337);
insert into UAV (serialid, battry, communication, control_range)
values (582, 37, 'Laser', 369);
insert into UAV (serialid, battry, communication, control_range)
values (583, 70, 'GPS', 362);
insert into UAV (serialid, battry, communication, control_range)
values (584, 17, 'GPS', 344);
insert into UAV (serialid, battry, communication, control_range)
values (585, 89, 'Radio', 487);
insert into UAV (serialid, battry, communication, control_range)
values (586, 17, 'Radio', 435);
insert into UAV (serialid, battry, communication, control_range)
values (587, 82, 'Radio', 469);
insert into UAV (serialid, battry, communication, control_range)
values (588, 45, 'Radio', 467);
insert into UAV (serialid, battry, communication, control_range)
values (589, 22, 'GPS', 16);
insert into UAV (serialid, battry, communication, control_range)
values (590, 55, 'Sattelite', 313);
insert into UAV (serialid, battry, communication, control_range)
values (591, 53, 'Laser', 120);
insert into UAV (serialid, battry, communication, control_range)
values (592, 9, 'GPS', 256);
insert into UAV (serialid, battry, communication, control_range)
values (593, 86, 'GPS', 171);
insert into UAV (serialid, battry, communication, control_range)
values (594, 42, 'Laser', 478);
insert into UAV (serialid, battry, communication, control_range)
values (595, 64, 'Sattelite', 88);
insert into UAV (serialid, battry, communication, control_range)
values (596, 44, 'GPS', 458);
insert into UAV (serialid, battry, communication, control_range)
values (597, 70, 'Laser', 122);
insert into UAV (serialid, battry, communication, control_range)
values (598, 97, 'Laser', 94);
insert into UAV (serialid, battry, communication, control_range)
values (599, 64, 'GPS', 165);
commit;
prompt 200 records committed...
insert into UAV (serialid, battry, communication, control_range)
values (600, 26, 'GPS', 118);
insert into UAV (serialid, battry, communication, control_range)
values (601, 68, 'Radio', 23);
insert into UAV (serialid, battry, communication, control_range)
values (602, 1, 'Radio', 353);
insert into UAV (serialid, battry, communication, control_range)
values (603, 53, 'Sattelite', 94);
insert into UAV (serialid, battry, communication, control_range)
values (604, 79, 'Sattelite', 248);
insert into UAV (serialid, battry, communication, control_range)
values (605, 38, 'Sattelite', 145);
insert into UAV (serialid, battry, communication, control_range)
values (606, 14, 'Radio', 326);
insert into UAV (serialid, battry, communication, control_range)
values (607, 38, 'Laser', 433);
insert into UAV (serialid, battry, communication, control_range)
values (608, 5, 'Radio', 126);
insert into UAV (serialid, battry, communication, control_range)
values (609, 66, 'Sattelite', 40);
insert into UAV (serialid, battry, communication, control_range)
values (610, 31, 'GPS', 342);
insert into UAV (serialid, battry, communication, control_range)
values (611, 51, 'Sattelite', 52);
insert into UAV (serialid, battry, communication, control_range)
values (612, 99, 'Sattelite', 88);
insert into UAV (serialid, battry, communication, control_range)
values (613, 40, 'Sattelite', 415);
insert into UAV (serialid, battry, communication, control_range)
values (614, 97, 'Sattelite', 42);
insert into UAV (serialid, battry, communication, control_range)
values (615, 55, 'GPS', 330);
insert into UAV (serialid, battry, communication, control_range)
values (616, 70, 'Sattelite', 226);
insert into UAV (serialid, battry, communication, control_range)
values (617, 59, 'Laser', 147);
insert into UAV (serialid, battry, communication, control_range)
values (618, 74, 'Laser', 476);
insert into UAV (serialid, battry, communication, control_range)
values (619, 56, 'GPS', 235);
insert into UAV (serialid, battry, communication, control_range)
values (620, 99, 'Laser', 249);
insert into UAV (serialid, battry, communication, control_range)
values (621, 15, 'GPS', 193);
insert into UAV (serialid, battry, communication, control_range)
values (622, 27, 'Sattelite', 92);
insert into UAV (serialid, battry, communication, control_range)
values (623, 2, 'Sattelite', 447);
insert into UAV (serialid, battry, communication, control_range)
values (624, 83, 'Sattelite', 480);
insert into UAV (serialid, battry, communication, control_range)
values (625, 52, 'Laser', 205);
insert into UAV (serialid, battry, communication, control_range)
values (626, 87, 'Sattelite', 133);
insert into UAV (serialid, battry, communication, control_range)
values (627, 60, 'Laser', 469);
insert into UAV (serialid, battry, communication, control_range)
values (628, 55, 'GPS', 173);
insert into UAV (serialid, battry, communication, control_range)
values (629, 68, 'Laser', 333);
insert into UAV (serialid, battry, communication, control_range)
values (630, 90, 'Radio', 184);
insert into UAV (serialid, battry, communication, control_range)
values (631, 61, 'Laser', 258);
insert into UAV (serialid, battry, communication, control_range)
values (632, 0, 'Sattelite', 231);
insert into UAV (serialid, battry, communication, control_range)
values (633, 24, 'GPS', 173);
insert into UAV (serialid, battry, communication, control_range)
values (634, 11, 'Laser', 139);
insert into UAV (serialid, battry, communication, control_range)
values (635, 85, 'Laser', 370);
insert into UAV (serialid, battry, communication, control_range)
values (636, 59, 'Laser', 365);
insert into UAV (serialid, battry, communication, control_range)
values (637, 83, 'Laser', 208);
insert into UAV (serialid, battry, communication, control_range)
values (638, 45, 'Laser', 380);
insert into UAV (serialid, battry, communication, control_range)
values (639, 25, 'Radio', 150);
insert into UAV (serialid, battry, communication, control_range)
values (640, 41, 'Radio', 498);
insert into UAV (serialid, battry, communication, control_range)
values (641, 66, 'Radio', 423);
insert into UAV (serialid, battry, communication, control_range)
values (642, 89, 'Radio', 463);
insert into UAV (serialid, battry, communication, control_range)
values (643, 35, 'Sattelite', 458);
insert into UAV (serialid, battry, communication, control_range)
values (644, 56, 'GPS', 123);
insert into UAV (serialid, battry, communication, control_range)
values (645, 32, 'Laser', 189);
insert into UAV (serialid, battry, communication, control_range)
values (646, 46, 'Radio', 159);
insert into UAV (serialid, battry, communication, control_range)
values (647, 58, 'Sattelite', 408);
insert into UAV (serialid, battry, communication, control_range)
values (648, 50, 'Radio', 256);
insert into UAV (serialid, battry, communication, control_range)
values (649, 97, 'Sattelite', 248);
insert into UAV (serialid, battry, communication, control_range)
values (650, 42, 'Laser', 411);
insert into UAV (serialid, battry, communication, control_range)
values (651, 97, 'Sattelite', 248);
insert into UAV (serialid, battry, communication, control_range)
values (652, 96, 'Radio', 477);
insert into UAV (serialid, battry, communication, control_range)
values (653, 51, 'Sattelite', 347);
insert into UAV (serialid, battry, communication, control_range)
values (654, 27, 'Radio', 472);
insert into UAV (serialid, battry, communication, control_range)
values (655, 71, 'GPS', 114);
insert into UAV (serialid, battry, communication, control_range)
values (656, 78, 'Sattelite', 365);
insert into UAV (serialid, battry, communication, control_range)
values (657, 56, 'Radio', 444);
insert into UAV (serialid, battry, communication, control_range)
values (658, 8, 'Laser', 316);
insert into UAV (serialid, battry, communication, control_range)
values (659, 59, 'Radio', 160);
insert into UAV (serialid, battry, communication, control_range)
values (660, 84, 'Laser', 21);
insert into UAV (serialid, battry, communication, control_range)
values (661, 2, 'Radio', 294);
insert into UAV (serialid, battry, communication, control_range)
values (662, 34, 'GPS', 407);
insert into UAV (serialid, battry, communication, control_range)
values (663, 40, 'Laser', 368);
insert into UAV (serialid, battry, communication, control_range)
values (664, 63, 'Laser', 402);
insert into UAV (serialid, battry, communication, control_range)
values (665, 87, 'Sattelite', 161);
insert into UAV (serialid, battry, communication, control_range)
values (666, 26, 'Radio', 316);
insert into UAV (serialid, battry, communication, control_range)
values (667, 69, 'Laser', 409);
insert into UAV (serialid, battry, communication, control_range)
values (668, 46, 'Laser', 360);
insert into UAV (serialid, battry, communication, control_range)
values (669, 23, 'Laser', 162);
insert into UAV (serialid, battry, communication, control_range)
values (670, 21, 'Sattelite', 286);
insert into UAV (serialid, battry, communication, control_range)
values (671, 51, 'Radio', 56);
insert into UAV (serialid, battry, communication, control_range)
values (672, 19, 'GPS', 198);
insert into UAV (serialid, battry, communication, control_range)
values (673, 96, 'Laser', 284);
insert into UAV (serialid, battry, communication, control_range)
values (674, 87, 'Radio', 144);
insert into UAV (serialid, battry, communication, control_range)
values (675, 14, 'Radio', 278);
insert into UAV (serialid, battry, communication, control_range)
values (676, 93, 'Radio', 45);
insert into UAV (serialid, battry, communication, control_range)
values (677, 43, 'GPS', 253);
insert into UAV (serialid, battry, communication, control_range)
values (678, 1, 'Radio', 361);
insert into UAV (serialid, battry, communication, control_range)
values (679, 75, 'Radio', 359);
insert into UAV (serialid, battry, communication, control_range)
values (680, 28, 'GPS', 165);
insert into UAV (serialid, battry, communication, control_range)
values (681, 90, 'Sattelite', 101);
insert into UAV (serialid, battry, communication, control_range)
values (682, 33, 'Laser', 422);
insert into UAV (serialid, battry, communication, control_range)
values (683, 50, 'GPS', 255);
insert into UAV (serialid, battry, communication, control_range)
values (684, 91, 'Laser', 80);
insert into UAV (serialid, battry, communication, control_range)
values (685, 99, 'Radio', 359);
insert into UAV (serialid, battry, communication, control_range)
values (686, 47, 'Laser', 36);
insert into UAV (serialid, battry, communication, control_range)
values (687, 78, 'GPS', 339);
insert into UAV (serialid, battry, communication, control_range)
values (688, 47, 'Sattelite', 443);
insert into UAV (serialid, battry, communication, control_range)
values (689, 0, 'Radio', 500);
insert into UAV (serialid, battry, communication, control_range)
values (690, 20, 'Laser', 58);
insert into UAV (serialid, battry, communication, control_range)
values (691, 35, 'Radio', 144);
insert into UAV (serialid, battry, communication, control_range)
values (692, 43, 'Radio', 373);
insert into UAV (serialid, battry, communication, control_range)
values (693, 16, 'Radio', 219);
insert into UAV (serialid, battry, communication, control_range)
values (694, 58, 'Radio', 70);
insert into UAV (serialid, battry, communication, control_range)
values (695, 59, 'GPS', 280);
insert into UAV (serialid, battry, communication, control_range)
values (696, 7, 'Radio', 306);
insert into UAV (serialid, battry, communication, control_range)
values (697, 88, 'GPS', 450);
insert into UAV (serialid, battry, communication, control_range)
values (698, 29, 'GPS', 53);
insert into UAV (serialid, battry, communication, control_range)
values (699, 22, 'GPS', 38);
commit;
prompt 300 records committed...
insert into UAV (serialid, battry, communication, control_range)
values (700, 77, 'GPS', 394);
insert into UAV (serialid, battry, communication, control_range)
values (701, 82, 'Laser', 121);
insert into UAV (serialid, battry, communication, control_range)
values (702, 75, 'GPS', 384);
insert into UAV (serialid, battry, communication, control_range)
values (703, 21, 'GPS', 38);
insert into UAV (serialid, battry, communication, control_range)
values (704, 36, 'Laser', 313);
insert into UAV (serialid, battry, communication, control_range)
values (705, 24, 'Laser', 17);
insert into UAV (serialid, battry, communication, control_range)
values (706, 40, 'Sattelite', 473);
insert into UAV (serialid, battry, communication, control_range)
values (707, 64, 'Sattelite', 207);
insert into UAV (serialid, battry, communication, control_range)
values (708, 29, 'Radio', 108);
insert into UAV (serialid, battry, communication, control_range)
values (709, 93, 'Laser', 193);
insert into UAV (serialid, battry, communication, control_range)
values (710, 55, 'Radio', 358);
insert into UAV (serialid, battry, communication, control_range)
values (711, 74, 'Radio', 233);
insert into UAV (serialid, battry, communication, control_range)
values (712, 69, 'Laser', 307);
insert into UAV (serialid, battry, communication, control_range)
values (713, 61, 'Radio', 94);
insert into UAV (serialid, battry, communication, control_range)
values (714, 56, 'Radio', 387);
insert into UAV (serialid, battry, communication, control_range)
values (715, 55, 'Radio', 408);
insert into UAV (serialid, battry, communication, control_range)
values (716, 52, 'Laser', 202);
insert into UAV (serialid, battry, communication, control_range)
values (717, 86, 'Sattelite', 334);
insert into UAV (serialid, battry, communication, control_range)
values (718, 5, 'GPS', 140);
insert into UAV (serialid, battry, communication, control_range)
values (719, 65, 'Radio', 412);
insert into UAV (serialid, battry, communication, control_range)
values (720, 81, 'Radio', 149);
insert into UAV (serialid, battry, communication, control_range)
values (721, 73, 'Sattelite', 326);
insert into UAV (serialid, battry, communication, control_range)
values (722, 91, 'GPS', 298);
insert into UAV (serialid, battry, communication, control_range)
values (723, 8, 'GPS', 93);
insert into UAV (serialid, battry, communication, control_range)
values (724, 12, 'GPS', 134);
insert into UAV (serialid, battry, communication, control_range)
values (725, 55, 'Sattelite', 297);
insert into UAV (serialid, battry, communication, control_range)
values (726, 68, 'Laser', 23);
insert into UAV (serialid, battry, communication, control_range)
values (727, 45, 'Radio', 61);
insert into UAV (serialid, battry, communication, control_range)
values (728, 15, 'Sattelite', 238);
insert into UAV (serialid, battry, communication, control_range)
values (729, 91, 'Radio', 132);
insert into UAV (serialid, battry, communication, control_range)
values (730, 7, 'GPS', 187);
insert into UAV (serialid, battry, communication, control_range)
values (731, 60, 'Radio', 473);
insert into UAV (serialid, battry, communication, control_range)
values (732, 100, 'Laser', 385);
insert into UAV (serialid, battry, communication, control_range)
values (733, 41, 'GPS', 423);
insert into UAV (serialid, battry, communication, control_range)
values (734, 59, 'Radio', 343);
insert into UAV (serialid, battry, communication, control_range)
values (735, 63, 'GPS', 19);
insert into UAV (serialid, battry, communication, control_range)
values (736, 27, 'Laser', 344);
insert into UAV (serialid, battry, communication, control_range)
values (737, 5, 'Sattelite', 365);
insert into UAV (serialid, battry, communication, control_range)
values (738, 15, 'Sattelite', 33);
insert into UAV (serialid, battry, communication, control_range)
values (739, 100, 'GPS', 119);
insert into UAV (serialid, battry, communication, control_range)
values (740, 50, 'Radio', 79);
insert into UAV (serialid, battry, communication, control_range)
values (741, 7, 'GPS', 66);
insert into UAV (serialid, battry, communication, control_range)
values (742, 77, 'Laser', 420);
insert into UAV (serialid, battry, communication, control_range)
values (743, 93, 'Sattelite', 361);
insert into UAV (serialid, battry, communication, control_range)
values (744, 21, 'Laser', 182);
insert into UAV (serialid, battry, communication, control_range)
values (745, 66, 'Radio', 227);
insert into UAV (serialid, battry, communication, control_range)
values (746, 21, 'Laser', 378);
insert into UAV (serialid, battry, communication, control_range)
values (747, 48, 'Sattelite', 287);
insert into UAV (serialid, battry, communication, control_range)
values (748, 63, 'GPS', 276);
insert into UAV (serialid, battry, communication, control_range)
values (749, 100, 'Sattelite', 105);
insert into UAV (serialid, battry, communication, control_range)
values (750, 47, 'Laser', 486);
insert into UAV (serialid, battry, communication, control_range)
values (751, 94, 'GPS', 153);
insert into UAV (serialid, battry, communication, control_range)
values (752, 7, 'Laser', 274);
insert into UAV (serialid, battry, communication, control_range)
values (753, 43, 'Sattelite', 224);
insert into UAV (serialid, battry, communication, control_range)
values (754, 37, 'Radio', 452);
insert into UAV (serialid, battry, communication, control_range)
values (755, 45, 'GPS', 331);
insert into UAV (serialid, battry, communication, control_range)
values (756, 32, 'Sattelite', 183);
insert into UAV (serialid, battry, communication, control_range)
values (757, 78, 'Radio', 203);
insert into UAV (serialid, battry, communication, control_range)
values (758, 46, 'Radio', 202);
insert into UAV (serialid, battry, communication, control_range)
values (759, 96, 'Laser', 62);
insert into UAV (serialid, battry, communication, control_range)
values (760, 57, 'GPS', 134);
insert into UAV (serialid, battry, communication, control_range)
values (761, 91, 'Radio', 358);
insert into UAV (serialid, battry, communication, control_range)
values (762, 48, 'Sattelite', 270);
insert into UAV (serialid, battry, communication, control_range)
values (763, 88, 'Radio', 389);
insert into UAV (serialid, battry, communication, control_range)
values (764, 81, 'Radio', 18);
insert into UAV (serialid, battry, communication, control_range)
values (765, 41, 'Radio', 154);
insert into UAV (serialid, battry, communication, control_range)
values (766, 60, 'Laser', 146);
insert into UAV (serialid, battry, communication, control_range)
values (767, 21, 'Radio', 453);
insert into UAV (serialid, battry, communication, control_range)
values (768, 66, 'Radio', 166);
insert into UAV (serialid, battry, communication, control_range)
values (769, 75, 'GPS', 449);
insert into UAV (serialid, battry, communication, control_range)
values (770, 34, 'GPS', 298);
insert into UAV (serialid, battry, communication, control_range)
values (771, 87, 'GPS', 51);
insert into UAV (serialid, battry, communication, control_range)
values (772, 5, 'Sattelite', 227);
insert into UAV (serialid, battry, communication, control_range)
values (773, 24, 'Sattelite', 395);
insert into UAV (serialid, battry, communication, control_range)
values (774, 11, 'Sattelite', 395);
insert into UAV (serialid, battry, communication, control_range)
values (775, 39, 'GPS', 379);
insert into UAV (serialid, battry, communication, control_range)
values (776, 25, 'Radio', 406);
insert into UAV (serialid, battry, communication, control_range)
values (777, 92, 'GPS', 109);
insert into UAV (serialid, battry, communication, control_range)
values (778, 43, 'Sattelite', 168);
insert into UAV (serialid, battry, communication, control_range)
values (779, 59, 'GPS', 365);
insert into UAV (serialid, battry, communication, control_range)
values (780, 18, 'Radio', 480);
insert into UAV (serialid, battry, communication, control_range)
values (781, 82, 'Radio', 222);
insert into UAV (serialid, battry, communication, control_range)
values (782, 43, 'Sattelite', 113);
insert into UAV (serialid, battry, communication, control_range)
values (783, 46, 'Sattelite', 404);
insert into UAV (serialid, battry, communication, control_range)
values (784, 97, 'Sattelite', 24);
insert into UAV (serialid, battry, communication, control_range)
values (785, 63, 'Radio', 347);
insert into UAV (serialid, battry, communication, control_range)
values (786, 29, 'GPS', 369);
insert into UAV (serialid, battry, communication, control_range)
values (787, 56, 'Laser', 360);
insert into UAV (serialid, battry, communication, control_range)
values (788, 9, 'Radio', 423);
insert into UAV (serialid, battry, communication, control_range)
values (789, 47, 'GPS', 83);
insert into UAV (serialid, battry, communication, control_range)
values (790, 52, 'Radio', 122);
insert into UAV (serialid, battry, communication, control_range)
values (791, 79, 'Laser', 428);
insert into UAV (serialid, battry, communication, control_range)
values (792, 92, 'Radio', 58);
insert into UAV (serialid, battry, communication, control_range)
values (793, 18, 'Laser', 420);
insert into UAV (serialid, battry, communication, control_range)
values (794, 40, 'GPS', 49);
insert into UAV (serialid, battry, communication, control_range)
values (795, 10, 'Laser', 343);
insert into UAV (serialid, battry, communication, control_range)
values (796, 99, 'GPS', 211);
insert into UAV (serialid, battry, communication, control_range)
values (797, 78, 'Radio', 98);
insert into UAV (serialid, battry, communication, control_range)
values (798, 85, 'Radio', 94);
insert into UAV (serialid, battry, communication, control_range)
values (799, 64, 'Sattelite', 357);
commit;
prompt 400 records loaded

set feedback on
set define on
prompt Done
