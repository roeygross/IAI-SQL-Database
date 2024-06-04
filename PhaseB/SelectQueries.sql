--get for each pilot their most popular airplane model and their total flight hours

SELECT 
    s.first_name AS pilot_first_name,
    s.last_name AS pilot_last_name,
    a.model AS most_frequent_aircraft_model,
    SUM(f.duration) AS total_flight_hours
FROM 
    Pilot p
JOIN 
    Soldier s ON p.id = s.id
JOIN 
    Flight f ON p.id = f.id
JOIN 
    Aircraft a ON f.serialid = a.serialid
GROUP BY 
    s.first_name, 
    s.last_name, 
    a.model
ORDER BY 
    total_flight_hours DESC;

--get for each squadron the number of pilots in that squadron and their total flight hours
SELECT 
    sq.suadron_name,
    COUNT(p.id) AS number_of_pilots,
    SUM(f.duration) AS total_flight_hours
FROM 
    Squadron sq
JOIN 
    Pilot p ON sq.squadron_number = p.squadron_number
JOIN 
    Flight f ON p.id = f.id
GROUP BY 
    sq.suadron_name
ORDER BY 
    total_flight_hours DESC;

--the pilots that had the most flights between 1990 and 2000 and where born after 1990 ordered by age
SELECT p.id, s.first_name, s.last_name, s.birthdate, COUNT(*) AS num_flights
FROM Pilot p
JOIN Flight f ON p.id = f.id
JOIN Soldier s ON p.id = s.id
WHERE s.birthdate > DATE '1990-01-01' AND s.birthdate < DATE '2000-12-31'
    AND f.flight_date > DATE '1990-01-01'
GROUP BY p.id, s.first_name, s.last_name, s.birthdate
ORDER BY COUNT(*) DESC;

--for each airbase, giev me the total numbe rof airplanes and the total number of UAVs that flew from it
SELECT
    ab.name AS airbase_name,
    ab.location AS airbase_location,
    COALESCE(ap.total_airplanes, 0) AS total_airplanes,
    COALESCE(uv.total_uavs, 0) AS total_uavs
FROM
    Airbase ab
    LEFT JOIN (
        SELECT
            f.name AS airbase_name,
            COUNT(DISTINCT f.serialid) AS total_airplanes
        FROM
            Flight f
            JOIN Airplane a ON f.serialid = a.serialid
        GROUP BY
            f.name
    ) ap ON ab.name = ap.airbase_name
    LEFT JOIN (
        SELECT
            f.name AS airbase_name,
            COUNT(DISTINCT f.serialid) AS total_uavs
        FROM
            Flight f
            JOIN UAV u ON f.serialid = u.serialid
        GROUP BY
            f.name
    ) uv ON ab.name = uv.airbase_name
ORDER BY
    total_airplanes + total_uavs DESC;
