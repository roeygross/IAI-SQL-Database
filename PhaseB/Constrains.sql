--restrict the runway amount to be between 1 and 20
ALTER TABLE Airbase
ADD CONSTRAINT chk_runway_number CHECK (runway_number BETWEEN 0 and 21);

--change the default battery life to 100
ALTER TABLE UAV
MODIFY BATTRY DEFAULT 100;

--check the fuel precentage is between 1 and 100
ALTER TABLE Airplane
ADD CONSTRAINT chk_fuel CHECK (fuel BETWEEN 0 AND 101);

