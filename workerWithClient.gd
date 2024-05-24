
[General]
Version=1

[Preferences]
Username=
Password=2226
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=WORKERWITHCLIENT
Count=10

[Record]
Name=LOANID
Type=NUMBER
Size=9
Data=Random(100000000, 999999999)
Master=

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
Name=ACCOUNTID
Type=NUMBER
Size=9
Data=Random(100000000, 999999999)
Master=

[Record]
Name=CLIENTNAME
Type=VARCHAR2
Size=15
Data=FirstName
Master=

