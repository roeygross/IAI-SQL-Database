PL/SQL Developer Test script 3.0
38
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
