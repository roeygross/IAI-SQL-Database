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
