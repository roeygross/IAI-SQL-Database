PL/SQL Developer Test script 3.0
31
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
