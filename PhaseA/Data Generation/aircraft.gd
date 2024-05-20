
[General]
Version=1

[Preferences]
Username=
Password=2750
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=AIRCRAFT
Count=800

[Record]
Name=SERIALID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=PRODUCTION_DATE
Type=DATE
Size=
Data=Random(01/01/1960, 01/01/2020)
Master=

[Record]
Name=AMMUNITIONTYPE
Type=VARCHAR2
Size=15
Data=List('Misssiles', 'Bombs', 'Empty')
Master=

[Record]
Name=MODEL
Type=VARCHAR2
Size=15
Data=List('F-35', 'F-15', 'B2', 'Pigeon', 'EX1-120', 'DJI-Mossad')
Master=

