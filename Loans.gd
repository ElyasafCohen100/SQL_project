
[General]
Version=1

[Preferences]
Username=
Password=2266
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=LOANS
Count=10

[Record]
Name=LOANID
Type=NUMBER
Size=9
Data=Random(100000000, 999999999)
Master=

[Record]
Name=CLIENTID
Type=NUMBER
Size=9
Data=Random(100000000, 999999999)
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

[Record]
Name=LOANAMOUNT
Type=NUMBER
Size=
Data=Random(10000, 100000)
Master=

[Record]
Name=RETURNAMOUNT
Type=NUMBER
Size=
Data=Random(10000, 100000)
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
Size=20
Data=FirstName
Master=

[Record]
Name=LOANDATE
Type=DATE
Size=
Data=SQL(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TO_DATE('2022-12-31', 'YYYY-MM-DD') - TO_DATE('2000-01-01', 'YYYY-MM-DD')) * DBMS_RANDOM.VALUE
=FROM dual)
Master=

[Record]
Name=REPAYMENT
Type=DATE
Size=
Data=SQL(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TO_DATE('2022-12-31', 'YYYY-MM-DD') - TO_DATE('2000-01-01', 'YYYY-MM-DD')) * DBMS_RANDOM.VALUE
=FROM dual)
Master=

