![image](https://github.com/roeygross/IAF-Database/assets/128812767/c3c1cc8a-baa4-4198-aedd-f765ff8d2ecc)
שלב א- תיאור המערכת 
תיאור מילולי של הארגון:
חיל האויר הוא מרכיב משמעותי בעוצמתו של צה"ל ונחשב לחזק ביותר במזרח התיכון.
מערכת מסדי הנתונים של חיל האוויר הישראלי מנהלת בקפדנות את כל הדרישות המבצעיות, היבט מהותי המכריע לאפקטיביות הארגון.
במסד הנתונים שמורים נתונים על טיסות המתוכננות בחיל האוויר הישראלי. טיסה מורכבת מהתאמה של מטוס, טייס, ובסיס חיל אוויר. במסד שמורים גם נתונים על החיילים המשרתים בחייל - טייסים, ואנשי המערך הטכני.

תרשים ERD של חיל האוויר הישראלי:

![image (1)](https://github.com/roeygross/IAF-Database/assets/128812767/8713fddb-5a31-4e1a-9c99-2390be2cd82b)



תרשים DSD:


![dsd](https://github.com/roeygross/IAF-Database/assets/128812767/deb98401-7097-4e0a-aae8-f4cf55a18809)

קוד SQL לייצירת הטבלאות בהתאם
~~~sql
--
-- Target: Oracle 
-- Syntax: sqlplus user@tnsnames_entry/password @filename.sql
-- 
-- Date  : May 19 2024 23:30
-- Script Generated by Database Design Studio 2.21.3 
--



--
-- Create Table    : 'Soldier'   
-- First_Name      :  
-- Last_Name       :  
-- Rank            :  
-- Brithdate       :  
-- ID              :  
--
CREATE TABLE Soldier (
    First_Name     VARCHAR2(20) NOT NULL,
    Last_Name      VARCHAR2(20) NOT NULL,
    Rank           VARCHAR2(10) NOT NULL,
    Brithdate      DATE NOT NULL,
    ID             NUMBER(38) NOT NULL,
CONSTRAINT pk_Soldier PRIMARY KEY (ID))
/


--
-- Create Table    : 'Aircraft'   
-- SerialID        :  
-- Production_Date :  
-- AmmunitionType  :  
-- Model           :  
--
CREATE TABLE Aircraft (
    SerialID       NUMBER(38) NOT NULL,
    Production_Date DATE NOT NULL,
    AmmunitionType VARCHAR2(15) NOT NULL,
    Model          VARCHAR2(15) NOT NULL,
CONSTRAINT pk_Aircraft PRIMARY KEY (SerialID))
/


--
-- Create Table    : 'Squadron'   
-- Squadron_Number :  
-- Suadron_Name    :  
-- Formation_Date  :  
--
CREATE TABLE Squadron (
    Squadron_Number NUMBER(38) NOT NULL,
    Suadron_Name   VARCHAR2(20) NOT NULL,
    Formation_Date DATE NOT NULL,
CONSTRAINT pk_Squadron PRIMARY KEY (Squadron_Number))
/


--
-- Create Table    : 'Pilot'   
-- ID              :  (references Soldier.ID)
-- Type            :  
-- Flight_Hours    :  
-- Call_Sign       :  
-- Squadron_Number :  (references Squadron.Squadron_Number)
--
CREATE TABLE Pilot (
    ID             NUMBER(38) NOT NULL,
    Type           VARCHAR2(10) NOT NULL,
    Flight_Hours   NUMBER(38) NOT NULL,
    Call_Sign      VARCHAR2(20) NOT NULL UNIQUE,
    Squadron_Number NUMBER(38) NOT NULL,
CONSTRAINT pk_Pilot PRIMARY KEY (ID),
CONSTRAINT fk_Pilot2 FOREIGN KEY (ID)
    REFERENCES Soldier (ID),
CONSTRAINT fk_Pilot FOREIGN KEY (Squadron_Number)
    REFERENCES Squadron (Squadron_Number)
    ON DELETE CASCADE)
/


--
-- Create Table    : 'Technical_Engineer'   
-- ID              :  (references Soldier.ID)
-- Degree          :  
-- Speciality      :  
-- LicenceNumber   :  
--
CREATE TABLE Technical_Engineer (
    ID             NUMBER(38) NOT NULL,
    Degree         VARCHAR2(20) NOT NULL,
    Speciality     VARCHAR2(20) NOT NULL,
    LicenceNumber  NUMBER(38) NOT NULL UNIQUE,
CONSTRAINT pk_Technical_Engineer PRIMARY KEY (ID),
CONSTRAINT fk_Technical_Engineer FOREIGN KEY (ID)
    REFERENCES Soldier (ID))
/


--
-- Create Table    : 'UAV'   
-- SerialID        :  (references Aircraft.SerialID)
-- Battry          :  
-- Communication   :  
-- Control_Range   :  
--
CREATE TABLE UAV (
    SerialID       NUMBER(38) NOT NULL,
    Battry         NUMBER(38) NOT NULL,
    Communication  VARCHAR2 NOT NULL,
    Control_Range  NUMBER(38) NOT NULL,
CONSTRAINT pk_UAV PRIMARY KEY (SerialID),
CONSTRAINT fk_UAV FOREIGN KEY (SerialID)
    REFERENCES Aircraft (SerialID))
/


--
-- Create Table    : 'Airplane'   
-- SerialID        :  (references Aircraft.SerialID)
-- Fuel            :  
-- Gforce_Limit    :  
-- Ejection_Seat_Capable :  
--
CREATE TABLE Airplane (
    SerialID       NUMBER(38) NOT NULL,
    Fuel           NUMBER(38) NOT NULL,
    Gforce_Limit   NUMBER(38) NOT NULL,
    Ejection_Seat_Capable CHAR(1) NOT NULL,
CONSTRAINT pk_Airplane PRIMARY KEY (SerialID),
CONSTRAINT fk_Airplane FOREIGN KEY (SerialID)
    REFERENCES Aircraft (SerialID))
/


--
-- Create Table    : 'Airbase'   
-- Name            :  
-- Capacity        :  
-- Location        :  
-- Squadron_Number :  (references Squadron.Squadron_Number)
-- Runway_Number   :  
--
CREATE TABLE Airbase (
    Name           VARCHAR2(20) NOT NULL,
    Capacity       NUMBER(38) NOT NULL,
    Location       VARCHAR2(30) NOT NULL,
    Squadron_Number NUMBER(38) NOT NULL,
    Runway_Number  NUMBER(38) NOT NULL,
CONSTRAINT pk_Airbase PRIMARY KEY (Name),
CONSTRAINT fk_Airbase FOREIGN KEY (Squadron_Number)
    REFERENCES Squadron (Squadron_Number))
/


--
-- Create Table    : 'Flight'   
-- FlightId        :  
-- ID              :  (references Pilot.ID)
-- Name            :  (references Airbase.Name)
-- SerialID        :  (references Aircraft.SerialID)
-- Flight_Date     :  
-- Duration        :  
--
CREATE TABLE Flight (
    FlightId       NUMBER(38) NOT NULL,
    ID             NUMBER(38) NOT NULL,
    Name           VARCHAR2(20) NOT NULL,
    SerialID       NUMBER(38) NOT NULL,
    Flight_Date    DATE NOT NULL,
    Duration       TIMESTAMP NOT NULL,
CONSTRAINT pk_Flight PRIMARY KEY (FlightId,ID,Name,SerialID),
CONSTRAINT fk_Flight FOREIGN KEY (ID)
    REFERENCES Pilot (ID)
    ON DELETE CASCADE,
CONSTRAINT fk_Flight2 FOREIGN KEY (Name)
    REFERENCES Airbase (Name)
    ON DELETE CASCADE,
CONSTRAINT fk_Flight3 FOREIGN KEY (SerialID)
    REFERENCES Aircraft (SerialID)
    ON DELETE CASCADE)
/


--
-- Permissions for: 'public'
--
GRANT ALL ON Soldier TO public
/
GRANT ALL ON Aircraft TO public
/
GRANT ALL ON Squadron TO public
/
GRANT ALL ON Pilot TO public
/
GRANT ALL ON Technical_Engineer TO public
/
GRANT ALL ON UAV TO public
/
GRANT ALL ON Airplane TO public
/
GRANT ALL ON Airbase TO public
/
GRANT ALL ON Flight TO public
/

exit;
~~~


פירוט ישויות של מסד הנתונים:
	
		
![image](https://github.com/roeygross/IAF-Database/assets/128812767/d22f834e-4c0c-4219-aa05-c5fa3f54ca5f)

תיאור מילולי של המערכת ופונקציונליותה:

במערכת יש מספר ישויות המייצגות אובייקטים פיזיים, כגון: 

חייל (עבורו יש שני סוגים - טייס, וטכנאי (מהנדס טכני)), 

כלי טיס (עבורו יש שני סוגים - מטוס, וכטמ"מ (כלי טייס מאויש מרחוק)),

ובסיס טיסה.


ישנם ישויות המוגדרות על בסיס הישויות הפיזיות, והן מייצגות יישויות רעיוניות, למשל:
טיסה - התאמה בין מטוס, טייס, ובסיס טיסה.

טייסת - קבוצת טייסים השייכת לבסיס מסויים


אכלוס נתונים:

באמצעות mockaroo:

![image](https://github.com/roeygross/IAF-Database/assets/128812767/12f57d9f-3b63-452b-9e5c-d211f5b58587)



![image](https://github.com/roeygross/IAF-Database/assets/128812767/019d2af1-e88f-478e-85c2-d4875d8800fd)


![image](https://github.com/roeygross/IAF-Database/assets/128812767/98cf4671-558f-4d96-8b67-61660a2a4f74)



