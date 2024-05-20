
[General]
Version=1

[Preferences]
=
Username=
Password=2424
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PILOT
Count=3000

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select id from soldier where id >= 297200000)
Master=

[Record]
Name=TYPE
Type=VARCHAR2
Size=10
Data=List('UAV','Plane')
Master=

[Record]
Name=FLIGHT_HOURS
Type=NUMBER
Size=
Data=Random(0, 50000)
Master=

[Record]
Name=CALL_SIGN
Type=VARCHAR2
Size=20
Data=List('Bane', 'Raven', 'Grim', 'Vex', 'Hex')
Master=

[Record]
Name=SQUADRON_NUMBER
Type=NUMBER
Size=
Data=List(select squadron_number from squadron)
Master=

