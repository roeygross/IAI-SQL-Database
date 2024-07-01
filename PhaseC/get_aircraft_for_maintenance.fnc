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
