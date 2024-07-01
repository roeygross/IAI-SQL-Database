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
