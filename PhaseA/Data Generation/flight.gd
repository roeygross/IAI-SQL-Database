
[General]
Version=1

[Preferences]
Username=
Password=2854
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=FLIGHT
Count=400

[Record]
Name=FLIGHTID
Type=NUMBER
Size=
Data=Random(100000, 999999)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select id from pilot)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=50
Data=List(select name from airbase)
Master=

[Record]
Name=SERIALID
Type=NUMBER
Size=
Data=List(select serialid from aircraft)
Master=

[Record]
Name=FLIGHT_DATE
Type=DATE
Size=
Data=Random(01/01/1980, 01/01/2022)
Master=

[Record]
Name=DURATION
Type=NUMBER
Size=
Data=Random(10, 600)
Master=

