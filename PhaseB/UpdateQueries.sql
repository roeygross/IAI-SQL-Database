--decrease by 2 the capacity of an airbase if it had not flights from it and increase by 2 if it had more than 5
UPDATE Airbase ab
SET capacity = CASE
    WHEN (SELECT COUNT(*) FROM Flight f WHERE f.name = ab.name) > 5 THEN ab.capacity + 2
    WHEN NOT EXISTS (SELECT 1 FROM Flight f WHERE f.name = ab.name) THEN ab.capacity - 2
    ELSE ab.capacity
END;

--reduce by one the control range of all of the UAV whose pilots has been in more than 2 flights, from 2 different airbases, after 9.11.2001.
UPDATE UAV u
SET u.control_range = u.control_range - 1
WHERE u.serialid IN (
    SELECT DISTINCT a.serialid
    FROM Flight f
    JOIN UAV a ON f.serialid = a.serialid
    WHERE f.id IN (
        SELECT p.id
        FROM (
            SELECT
                f.id,
                COUNT(DISTINCT f.name) AS airbase_count,
                COUNT(f.flightid) AS flight_count
            FROM Flight f
            WHERE f.flight_date > TO_DATE('2001-09-11', 'YYYY-MM-DD')
            GROUP BY f.id
            HAVING COUNT(DISTINCT f.name) >= 2 AND COUNT(f.flightid) > 2
        ) p
    )
);