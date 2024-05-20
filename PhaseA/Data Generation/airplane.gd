
[General]
Version=1

[Preferences]
Username=
Password=2848
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=AIRPLANE
Count=400

[Record]
Name=SERIALID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=FUEL
Type=NUMBER
Size=
Data=Random(0,100)
Master=

[Record]
Name=GFORCE_LIMIT
Type=NUMBER
Size=
Data=Random(2, 10)
Master=

[Record]
Name=EJECTION_SEAT_CAPABLE
Type=CHAR
Size=1
Data=List('T','F')
Master=

