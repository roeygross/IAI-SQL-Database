PL/SQL Developer Test script 3.0
16
DECLARE
  CURSOR c_aircraft IS
    SELECT serialid FROM aircraft;
  v_gear_id GEAR.gear_id%TYPE;
BEGIN
  FOR r_aircraft IN c_aircraft LOOP
    SELECT gear_id
    INTO v_gear_id
    FROM (SELECT gear_id FROM GEAR ORDER BY DBMS_RANDOM.VALUE)
    WHERE ROWNUM = 1;

    UPDATE AIRCRAFT
    SET gear_id = v_gear_id
    WHERE serialid = r_aircraft.serialid;
  END LOOP;
END;
0
0
