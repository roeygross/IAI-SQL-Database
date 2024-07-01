הדוח לשלב ג': תוכניות הקצאת טייסים לטיסות ותוכנית תחזוקה
תוכנית 1: הקצאת טייסים לטיסות
תיאור מילולי:
תוכנית זו מקצה טייסים זמינים לטיסות בתאריך מסוים. היא כוללת פונקציה לשליפת רשימת טייסים זמינים ופרוצדורה להקצאת טייס לטיסה. התוכנית הראשית קושרת את המרכיבים הללו יחד, מטפלת בשגיאות ומבטיחה הקצאת טייס נכונה.

פונקציה: get_available_pilots

תיאור: פונקציה זו מקבלת תאריך כקלט ומחזירה רשימת טייסים שאינם מתוכננים לטיסה בתאריך הנתון באמצעות Ref Cursor.
קוד:
```
CREATE OR REPLACE FUNCTION get_available_pilots(p_date DATE)
RETURN SYS_REFCURSOR IS
  v_cur SYS_REFCURSOR;
BEGIN
  OPEN v_cur FOR
    SELECT p.id, p.call_sign
    FROM Pilot p
    WHERE p.id NOT IN (
      SELECT f.id
      FROM Flight f
      WHERE f.flight_date = p_date
    );
  RETURN v_cur;
END get_available_pilots;
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
END assign_pilot_to_flight;
/
```
תוכנית ראשית:

תיאור: תוכנית זו מגדירה תאריך ומזהה טיסה, קוראת לפונקציה לשליפת טייסים זמינים, בוחרת את הטייס הראשון הזמין, ומקצה אותו לטיסה באמצעות הפרוצדורה.
קוד:

```
DECLARE
  v_date DATE := TO_DATE('01-JUL-2024', 'DD-MON-YYYY');
  v_flight_id NUMBER := 123;  -- Example flight ID
  v_pilot_id NUMBER;
  v_available_pilots SYS_REFCURSOR;

  -- Cursor to iterate over available pilots
  CURSOR available_pilots_cur IS
    SELECT id
    FROM Pilot
    WHERE id NOT IN (
      SELECT f.id
      FROM Flight f
      WHERE f.flight_date = v_date
    );
BEGIN
  -- Get the list of available pilots for the given date
  v_available_pilots := get_available_pilots(v_date);

  -- Open the cursor and fetch the first available pilot
  OPEN available_pilots_cur;
  FETCH available_pilots_cur INTO v_pilot_id;

  -- If no pilots are available, raise an error
  IF available_pilots_cur%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('No available pilots on the given date.');
    CLOSE available_pilots_cur;
    RETURN;
  END IF;

  -- Close the cursor
  CLOSE available_pilots_cur;

  -- Assign the first available pilot to the flight
  assign_pilot_to_flight(v_flight_id, v_pilot_id);
  
  DBMS_OUTPUT.PUT_LINE('Pilot assigned successfully.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```
הוכחת הפעלה:



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

  -- Cursor for counting Technical Engineers with specialty 'Repair'
  CURSOR tech_cursor IS
    SELECT COUNT(*) AS tech_count
    FROM Technical_Engineer
    WHERE speciality = 'Repair';
BEGIN
  -- Get the count of technical engineers with specialty 'Repair'
  OPEN tech_cursor;
  FETCH tech_cursor INTO v_tech_count;
  CLOSE tech_cursor;

  -- Count the number of aircrafts in the list
  DECLARE
    v_aircraft_count NUMBER := 0;
  BEGIN
    LOOP
      FETCH p_aircraft_list INTO v_serialid;
      EXIT WHEN p_aircraft_list%NOTFOUND;
      v_aircraft_count := v_aircraft_count + 1;
    END LOOP;
    CLOSE p_aircraft_list;

    IF v_aircraft_count > v_tech_count THEN
      RAISE_APPLICATION_ERROR(-20001, 'Cannot perform maintenance');
    END IF;
  END;

  -- Perform maintenance
  OPEN p_aircraft_list;
  LOOP
    FETCH p_aircraft_list INTO v_serialid;
    EXIT WHEN p_aircraft_list%NOTFOUND;

    -- Update battery and fuel levels
    UPDATE UAV
    SET battry = v_battery_max,
        control_range = control_range * 1.1
    WHERE serialid = v_serialid;

    UPDATE Airplane
    SET fuel = v_fuel_max
    WHERE serialid = v_serialid;

    COMMIT;
  END LOOP;
  CLOSE p_aircraft_list;
EXCEPTION
  WHEN OTHERS THEN
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
  v_min_date DATE := TO_DATE('01-JAN-2010', 'DD-MON-YYYY');
  v_min_flights NUMBER := 100;
  v_aircraft_list SYS_REFCURSOR;
BEGIN
  -- Call the function to get the list of aircrafts for maintenance
  v_aircraft_list := get_aircraft_for_maintenance(v_min_date, v_min_flights);

  -- Call the procedure to perform maintenance
  perform_maintenance(v_aircraft_list);
  
  DBMS_OUTPUT.PUT_LINE('Maintenance completed successfully.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```
הוכחת הפעלה:



סיכום:
לשתי התוכניות הפונקציה והפרוצדורה מוגדרות, והאינטראקציות ביניהן מתואמות על ידי התוכנית הראשית. כל תוכנית כוללת טיפול בשגיאות והודעות פלט לאישור ביצוע מוצלח או מתן פרטים במקרה של שגיאות. הוכחת הפעלה לכל תוכנית תכלול צילומי מסך או יומנים המראים שהתוכניות רצות ללא בעיות ומשיגות את מטרותיהן.





