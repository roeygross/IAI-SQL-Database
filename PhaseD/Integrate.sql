prompt Creating BASE...
create table BASE
(
  base_id     NUMBER not null,
  location    VARCHAR2(1000) not null,
  description VARCHAR2(1000) not null
)
;
alter table BASE
  add primary key (BASE_ID);

prompt Creating GEAR...
create table GEAR
(
  armor_type NUMBER not null,
  gun_type   NUMBER not null,
  gear_id    NUMBER not null
)
;
alter table GEAR
  add primary key (GEAR_ID);
alter table GEAR
  add constraint CHK_GEAR_TYPE
  check (armor_type BETWEEN 1 AND 5);

prompt Creating PERSONAL_INFO...
create table PERSONAL_INFO
(
  address      VARCHAR2(1000) not null,
  phone_number VARCHAR2(20) not null,
  email        VARCHAR2(500) not null
)
;
alter table PERSONAL_INFO
  add primary key (PHONE_NUMBER);

prompt Creating POSITION...
create table POSITION
(
  role_id     NUMBER not null,
  role_name   VARCHAR2(100) not null,
  description VARCHAR2(1000) not null
)
;
alter table POSITION
  add primary key (ROLE_ID);

prompt Creating SHIFTS...
create table SHIFTS
(
  shift_id        NUMBER not null,
  start_date_time DATE not null,
  end_date_time   DATE not null,
  base_id         NUMBER not null
)
;
alter table SHIFTS
  add primary key (SHIFT_ID);
alter table SHIFTS
  add foreign key (BASE_ID)
  references BASE (BASE_ID);
alter table SHIFTS
  add constraint CHK_SHIFT_TIMES
  check (end_date_time > start_date_time);

prompt Creating VOLUNTEERS...
create table VOLUNTEERS
(
  volunteer_id NUMBER not null,
  join_date    DATE default SYSDATE not null,
  name         VARCHAR2(100) not null,
  role_id      NUMBER not null,
  gear_id      NUMBER not null,
  phone_number VARCHAR2(20) not null
)
;
alter table VOLUNTEERS
  add primary key (VOLUNTEER_ID);
alter table VOLUNTEERS
  add foreign key (ROLE_ID)
  references POSITION (ROLE_ID);
alter table VOLUNTEERS
  add foreign key (GEAR_ID)
  references GEAR (GEAR_ID);
alter table VOLUNTEERS
  add foreign key (PHONE_NUMBER)
  references PERSONAL_INFO (PHONE_NUMBER);

prompt Creating SIGNED_UP...
create table SIGNED_UP
(
  volunteer_id NUMBER not null,
  shift_id     NUMBER not null
)
;
alter table SIGNED_UP
  add primary key (VOLUNTEER_ID, SHIFT_ID);
alter table SIGNED_UP
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEERS (VOLUNTEER_ID);
alter table SIGNED_UP
  add foreign key (SHIFT_ID)
  references SHIFTS (SHIFT_ID);

ALTER TABLE aircraft ADD gear_id NUMBER;

ALTER TABLE AIRCRAFT
ADD CONSTRAINT FK_AIRCRAFT_GEAR FOREIGN KEY (gear_id) REFERENCES GEAR(gear_ID);

