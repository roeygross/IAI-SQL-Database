הדוח לשלב ג':

תוכניות הקצאת טייסים לטיסות ותוכנית תחזוקה

תוכנית 1: הקצאת טייסים לטיסות


תיאור מילולי:
תוכנית זו מקצה טייסים זמינים לטיסות בתאריך מסוים. היא כוללת פונקציה לשליפת רשימת טייסים זמינים ופרוצדורה להקצאת טייס לטיסה. התוכנית הראשית משדכת את המרכיבים הללו יחד, מטפלת בשגיאות ומבטיחה הקצאה נכונה.

פונקציה: get_available_pilots

תיאור: פונקציה זו מקבלת תאריך כקלט ומחזירה רשימת טייסים שאינם מתוכננים לטיסה בתאריך הנתון באמצעות Ref Cursor.
קוד:
```
CREATE OR REPLACE FUNCTION get_available_pilots(p_date DATE)
RETURN SYS_REFCURSOR IS
  v_cur SYS_REFCURSOR;
BEGIN
  OPEN v_cur FOR
    SELECT *
    FROM Pilot p
    WHERE p.id NOT IN (
      SELECT f.id
      FROM Flight f
      WHERE f.flight_date = p_date
    );
  RETURN v_cur;
END;
/

```
פרוצדורה: assign_pilot_to_flight

תיאור: פרוצדורה זו מקבלת מזהה טיסה ומזהה טייס, בודקת אם הטייס זמין בתאריך הטיסה הנתון, ומקצה את הטייס לטיסה אם הוא זמין. אם הטייס אינו זמין, היא מעלה חריגה.
קוד:

```
CREATE OR REPLACE PROCEDURE assign_pilot_to_flight(p_flight_id NUMBER, p_pilot_id NUMBER) IS
  v_count NUMBER;
  v_flight_date DATE;
BEGIN
  -- Get the flight date
  SELECT flight_date
  INTO v_flight_date
  FROM Flight
  WHERE flightid = p_flight_id;

  -- Check if the pilot is available on the given flight date
  SELECT COUNT(*)
  INTO v_count
  FROM Flight
  WHERE id = p_pilot_id
    AND flight_date = v_flight_date;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Pilot is unavailable on the given date');
  END IF;

  -- Assign the pilot to the flight
  UPDATE Flight
  SET id = p_pilot_id
  WHERE flightid = p_flight_id;

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/

```
תוכנית ראשית:

תיאור: תוכנית זו מגדירה תאריך ומזהה טיסה, קוראת לפונקציה לשליפת טייסים זמינים, בוחרת את הטייס הראשון הזמין, ומקצה אותו לטיסה באמצעות הפרוצדורה.
קוד:

```
-- Main program to assign pilots to flights
DECLARE
  v_flightid NUMBER := 136564;
  v_chosen_date DATE;
  v_pilots SYS_REFCURSOR;
  v_pilot_record pilot%ROWTYPE;

BEGIN
  SELECT flight_date INTO v_chosen_date
  FROM Flight
  WHERE flightid = v_flightid;
  
  v_pilots := get_available_pilots(v_chosen_date);

  -- Fetch a pilot from the cursor and assign to flight
  FETCH v_pilots INTO v_pilot_record;
  CLOSE v_pilots;
  
  IF v_pilot_record.id IS NOT NULL THEN
    assign_pilot_to_flight(v_flightid, v_pilot_record.id);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No available pilots found for date ' || v_chosen_date);
  END IF;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    IF v_pilots%ISOPEN THEN
      CLOSE v_pilots;
    END IF;
END;
```
הוכחת הפעלה:



![תמונה של WhatsApp‏ 2024-07-01 בשעה 23 32 58_74b84b52](https://github.com/roeygross/DBProject_328494091_214737728/assets/128812767/29a6ff2c-9e97-4aca-80bc-d8ee320e721c)





![תמונה של WhatsApp‏ 2024-07-01 בשעה 23 34 21_e37e3d12](https://github.com/roeygross/DBProject_328494091_214737728/assets/128812767/7955fdb1-3f06-4f02-96ac-67008c883aaa)


![תמונה של WhatsApp‏ 2024-07-01 בשעה 23 34 58_4865143d](https://github.com/roeygross/DBProject_328494091_214737728/assets/128812767/7dbca3ec-90d4-4fab-8949-4ba466668a40)

תוכנית 2: תוכנית תחזוקה

תיאור מילולי:
תוכנית זו מטפלת בתחזוקת כלי טיס. היא כוללת פונקציה לזיהוי כלי טיס הזקוקים לתחזוקה ופרוצדורה לביצוע תחזוקה על כלי טיס אלו. התוכנית הראשית מתאמת את הפעולות הללו ומטפלת בכל חריגה שתתרחש.

פונקציה: get_aircraft_for_maintenance

תיאור: פונקציה זו מקבלת תאריך מינימלי ומספר טיסות מינימלי ומחזירה רשימת SERIAL ID של כלי טיס שזקוקים לתחזוקה באמצעות Ref Cursor.
קוד:

```
CREATE OR REPLACE FUNCTION get_aircraft_for_maintenance(p_min_date DATE, p_min_flights NUMBER)
RETURN SYS_REFCURSOR IS
  v_cur SYS_REFCURSOR;
BEGIN
  OPEN v_cur FOR
    SELECT a.serialid
    FROM Aircraft a
    LEFT JOIN (
      SELECT f.serialid, COUNT(*) AS flight_count
      FROM Flight f
      GROUP BY f.serialid
    ) fl ON a.serialid = fl.serialid
    WHERE a.production_date < p_min_date
       OR NVL(fl.flight_count, 0) > p_min_flights;
  RETURN v_cur;
END get_aircraft_for_maintenance;
/
```
פרוצדורה: perform_maintenance

תיאור: פרוצדורה זו מקבלת רשימת כלי טיס, בודקת אם מספר כלי הטיס עולה על מספר מהנדסי התחזוקה בעלי ההתמחות בתיקון, ומבצעת תחזוקה אם אפשרי. אם לא, היא מעלה חריגה.
קוד:

```
CREATE OR REPLACE PROCEDURE perform_maintenance(p_aircraft_list SYS_REFCURSOR) IS
  v_serialid NUMBER;
  v_tech_count NUMBER;
  v_battery_max NUMBER := 100;  -- Assuming 100 is the max battery level
  v_fuel_max NUMBER := 100;     -- Assuming 100 is the max fuel level

  -- Cursor for counting Technical Engineers with specialty 'repair'
  CURSOR tech_cursor IS
    SELECT COUNT(*) AS tech_count
    FROM Technical_Engineer
    WHERE speciality = 'repair';

  -- Local cursor variable for the aircraft list
  v_aircraft_cursor SYS_REFCURSOR;

BEGIN
  -- Get the count of technical engineers with specialty 'repair'
  OPEN tech_cursor;
  FETCH tech_cursor INTO v_tech_count;
  CLOSE tech_cursor;

  -- Open the cursor for the aircraft list
  v_aircraft_cursor := p_aircraft_list;

  -- Count the number of aircrafts in the list
  DECLARE
    v_aircraft_count NUMBER := 0;
  BEGIN
    LOOP
      FETCH v_aircraft_cursor INTO v_serialid;
      EXIT WHEN v_aircraft_cursor%NOTFOUND;
      v_aircraft_count := v_aircraft_count + 1;
    END LOOP;
    CLOSE v_aircraft_cursor;

    -- Check if there are enough technical engineers for maintenance
    IF v_aircraft_count > v_tech_count THEN
      RAISE_APPLICATION_ERROR(-20001, 'Cannot perform maintenance: Insufficient technical engineers. engineers: ' || v_tech_count || ' planes: ' || v_aircraft_count);
    END IF;
  END;

  -- Perform maintenance on each aircraft in the list
  v_aircraft_cursor := p_aircraft_list;
  LOOP
    FETCH v_aircraft_cursor INTO v_serialid;
    EXIT WHEN v_aircraft_cursor%NOTFOUND;

    -- Update UAVs
    UPDATE UAV
    SET battry = v_battery_max,
        control_range = control_range * 1.1
    WHERE serialid = v_serialid;

    -- Update Airplanes
    UPDATE Airplane
    SET fuel = v_fuel_max
    WHERE serialid = v_serialid;

    -- Commit changes for each aircraft
    COMMIT;
  END LOOP;
  CLOSE v_aircraft_cursor;

EXCEPTION
  WHEN OTHERS THEN
    -- Rollback changes on error
    ROLLBACK;
    RAISE;
END perform_maintenance;
/

```
תוכנית ראשית:

תיאור: תוכנית זו קוראת לפונקציה לקבלת רשימת כלי הטיס הזקוקים לתחזוקה וקוראת לפרוצדורה לביצוע תחזוקה על כלי טיס אלו. היא מטפלת בחריגות ומדפיסה הודעות מתאימות.
קוד:

```
DECLARE
  v_min_date DATE := TO_DATE('01-01-1970', 'DD-MM-YYYY');
  v_min_flights NUMBER := 2;

  -- SYS_REFCURSOR for aircraft list
  v_aircraft_list SYS_REFCURSOR;

  -- Variables for fetching from cursor
  v_serialid aircraft.serialid%TYPE;
  v_production_date aircraft.production_date%TYPE;
  v_ammunitiontype aircraft.ammunitiontype%TYPE;
  v_model aircraft.model%TYPE;

BEGIN
  -- Fetch the aircraft list for maintenance
  v_aircraft_list := get_aircraft_for_maintenance(v_min_date, v_min_flights);
  
  -- Perform maintenance on the list of aircrafts
  perform_maintenance(v_aircraft_list);

  -- Print the aircraft details
  LOOP
    FETCH v_aircraft_list INTO v_serialid, v_production_date, v_ammunitiontype, v_model;
    EXIT WHEN v_aircraft_list%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('SerialID: ' || v_serialid || 
                         ', Production Date: ' || v_production_date ||
                         ', Ammunition Type: ' || v_ammunitiontype ||
                         ', Model: ' || v_model);
  END LOOP;
  CLOSE v_aircraft_list;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    IF v_aircraft_list%ISOPEN THEN
      CLOSE v_aircraft_list;
    END IF;
END;
```
הוכחת הפעלה:


![תמונה של WhatsApp‏ 2024-07-01 בשעה 23 42 48_41573e06](https://github.com/roeygross/DBProject_328494091_214737728/assets/128812767/9386d762-1449-4f39-ac63-9473c84b3d2b)

סיכום:
לשתי התוכניות הפונקציה והפרוצדורה מוגדרות, והאינטראקציות ביניהן מתואמות על ידי התוכנית הראשית. כל תוכנית כוללת טיפול בשגיאות והודעות פלט לאישור ביצוע מוצלח או מתן פרטים במקרה של שגיאות. הוכחת הפעלה לכל תוכנית תכלול צילומי מסך או יומנים המראים שהתוכניות רצות ללא בעיות ומשיגות את מטרותיהן.





