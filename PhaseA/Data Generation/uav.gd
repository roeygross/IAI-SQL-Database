
[General]
Version=1

[Preferences]
Username=
Password=2508
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=UAV
Count=400

[Record]
Name=SERIALID
Type=NUMBER
Size=
Data=Sequence(400)
Master=

[Record]
Name=BATTRY
Type=NUMBER
Size=
Data=Random(0,100)
Master=

[Record]
Name=COMMUNICATION
Type=VARCHAR2
Size=10
Data=List('Radio', 'Laser', 'GPS', 'Sattelite')
Master=

[Record]
Name=CONTROL_RANGE
Type=NUMBER
Size=
Data=Random(10, 500)
Master=

