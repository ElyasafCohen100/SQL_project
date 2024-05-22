
[General]
Version=1

[Preferences]
Username=
Password=2832
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=WORKERS
Count=10..20

[Record]
Name=WORKERID
Type=NUMBER
Size=9
Data=Random(100000000, 999999999)
Master=

[Record]
Name=WORKERNAME
Type=VARCHAR2
Size=15
Data=FirstName
Master=

[Record]
Name=WORKERPOSITION
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=NUMBEROFCLIENTS
Type=NUMBER
Size=4
Data=Random(1, 10)
Master=

