
[General]
Version=1

[Preferences]
Username=
Password=2152
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=TECHNICAL_ENGINEER
Count=3000

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select id from soldier where id < 297200000)
Master=

[Record]
Name=DEGREE
Type=VARCHAR2
Size=20
Data=List('Bachelor's Degree', 'Master's Degree', 'PhD', 'Associate's Degree', 'HighSchool Diploma')
Master=

[Record]
Name=SPECIALITY
Type=VARCHAR2
Size=20
Data=List('fix', 'change', 'repair', 'adjust', 'modify')
Master=

[Record]
Name=LICENCENUMBER
Type=NUMBER
Size=
Data=Sequence(100000, 10)
Master=

