-- the orginizers want to see which volunteers are assigned to what shifts
CREATE OR REPLACE VIEW Volunteers_Shifts AS
SELECT v.volunteer_id, v.name AS volunteer_name, s.shift_id, s.start_date_time, s.end_date_time, b.location AS base_location
FROM Volunteers v
JOIN Signed_Up su ON v.volunteer_id = su.volunteer_id
JOIN Shifts s ON su.shift_id = s.shift_id
JOIN Base b ON s.base_id = b.base_id;

-- get an image of shifts to see how occupied they are.
SELECT shift_id, start_date_time, end_date_time, base_location, COUNT(volunteer_id) AS volunteer_count
FROM Volunteers_Shifts
GROUP BY shift_id, start_date_time, end_date_time, base_location;

-- get an image of shifts for every volunteer in the comming year
SELECT volunteer_id, volunteer_name, shift_id, start_date_time, end_date_time, base_location
FROM Volunteers_Shifts
WHERE start_date_time > to_date('01/01/2024', 'DD/MM/YYYY')
ORDER BY start_date_time ASC;



-- the engineering crew wants an image of which aircrafts need maintenece
CREATE OR REPLACE VIEW Maintenance_Aircraft_Check AS
SELECT a.serialid, a.production_date, a.ammunitiontype, a.model, f.flight_date, f.duration
FROM Aircraft a
LEFT JOIN Flight f ON a.serialid = f.serialid
WHERE f.flight_date >= SYSDATE - 10950 -- Aircrafts that have flown in the last 30 days
   OR f.serialid IS NULL;            -- or have not been flown at all

-- list the aircrafts which are older than 40, and thus need imidiate meintenence
SELECT serialid, production_date, ammunitiontype, model
FROM Maintenance_Aircraft_Check
WHERE production_date <= ADD_MONTHS(SYSDATE, -480);

-- list the most commonly used ammunition type
SELECT ammunitiontype, COUNT(*) AS usage_count
FROM Maintenance_Aircraft_Check
GROUP BY ammunitiontype
ORDER BY usage_count DESC;

