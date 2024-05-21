
[General]
Version=1

[Preferences]
Username=
Password=2351
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=AIRBASE
Count=400..450

[Record]
Name=NAME
Type=VARCHAR2
Size=50
Data=FirstName +' '+ LastName +' '+ 'AirBase'
Master=

[Record]
Name=CAPACITY
Type=NUMBER
Size=
Data=Random(10, 100)
Master=

[Record]
Name=LOCATION
Type=VARCHAR2
Size=30
Data=City
Master=

[Record]
Name=SQUADRON_NUMBER
Type=NUMBER
Size=
Data=List(select squadron_number from squadron)
Master=

[Record]
Name=RUNWAY_NUMBER
Type=NUMBER
Size=
Data=Random(1, 20)
Master=

