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
