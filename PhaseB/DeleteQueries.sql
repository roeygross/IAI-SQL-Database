--delete all UAV which were produced before 1965 or had no flights since 1980
DELETE FROM UAV u
WHERE u.serialid IN (
    SELECT u.serialid
    FROM UAV u
    JOIN Aircraft a ON u.serialid = a.serialid
    LEFT JOIN Flight f ON u.serialid = f.serialid
    WHERE a.production_date < TO_DATE('1965-01-01', 'YYYY-MM-DD')
       OR u.serialid IN (
           SELECT u.serialid
           FROM UAV u
           LEFT JOIN Flight f ON u.serialid = f.serialid
           GROUP BY u.serialid
           HAVING MAX(f.flight_date) IS NULL OR MAX(f.flight_date) < TO_DATE('1980-01-01', 'YYYY-MM-DD')
       )
);



--delete all pilots ranked General who flew between 01.01.2001 to 11.09.2001
DELETE FROM Pilot p
WHERE p.id IN (
    SELECT p.id
    FROM Pilot p
    JOIN Soldier s ON p.id = s.id
    JOIN Flight f ON p.id = f.id
    WHERE s.rank = 'General'
      AND f.flight_date BETWEEN TO_DATE('1980-01-01', 'YYYY-MM-DD') AND TO_DATE('2001-09-11', 'YYYY-MM-DD')
);
