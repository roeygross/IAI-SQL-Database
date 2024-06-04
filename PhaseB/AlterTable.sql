--alter constrains for first DELETE command
ALTER TABLE airplane
DROP CONSTRAINT fk_Airplane;
ALTER TABLE Airplane
ADD CONSTRAINT fk_Airplane FOREIGN KEY (serialid)
REFERENCES Aircraft (serialid)
ON DELETE CASCADE;

ALTER TABLE UAV
DROP CONSTRAINT fk_UAV;
ALTER TABLE UAV
ADD CONSTRAINT fk_UAV FOREIGN KEY (serialid)
REFERENCES Aircraft (serialid)
ON DELETE CASCADE;

ALTER TABLE Flight
DROP CONSTRAINT fk_Flight3;
ALTER TABLE Flight
ADD CONSTRAINT fk_Flight3 FOREIGN KEY (serialid)
REFERENCES Aircraft (serialid)
ON DELETE CASCADE;