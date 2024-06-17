# This is a sample Python script.
import random
from datetime import date

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import cx_Oracle
from faker import Faker


def gencast(branch_id_list: list[int]):
    # Generate fake data
    custumers_list = []
    cast_id_list = []
    for id in range(400):
        cust_dict = {}
        cust_dict['customerID'] = 100000 + id
        cast_id_list.append(100000 + id)
        cust_dict['customerName'] = fake.first_name()
        cust_dict['accountID'] = 108000 + id
        start_date = date(2005, 1, 1)
        end_date = date(2009, 12, 12)
        cust_dict['joinDate'] = fake.date_between_dates(start_date, end_date)
        cust_dict['brancheID'] = branch_id_list[id]
        custumers_list.append(cust_dict)
    return custumers_list, cast_id_list


def genBRANCH(reporter_id_list: list[int]):
    # Generate fake data
    branchs_list = []
    branch_id_list = []
    locations = ["tel aviv", "jerusalem", "new york", "chicago", "berlin", "paris", "denver", "madrid", "london"]
    locCounter = 0
    for id in range(400):
        branch_dict = {}
        branch_dict['brancheID'] = 103000 + id
        branch_id_list.append(103000 + id)
        branch_dict['brancheLocation'] = locations[locCounter]
        branch_dict['reporterID'] = reporter_id_list[id]
        start_date = date(1999, 1, 1)
        end_date = date(2004, 12, 12)
        branch_dict['openedDate'] = fake.date_between_dates(start_date, end_date)
        branchs_list.append(branch_dict)
        locCounter += 1
        if locCounter == 8:
            locCounter = 0
    return branchs_list, branch_id_list


def gen_reporters():
    # Generate fake data
    reporters_list = []
    reporter_id_list = []
    for id in range(400):
        reporter_dict = {}
        reporter_dict['reporterID'] = 102000 + id
        reporter_id_list.append(102000 + id)
        reporter_dict['reporterName'] = fake.first_name()
        reporters_list.append(reporter_dict)
    return reporters_list, reporter_id_list


def gen_loans(cast_id_list: list[int]):
    # Generate fake data
    loans_list = []
    for id in range(400):
        loan_dict = {}
        start_date = date(2010, 1, 1)
        end_date = date(2015, 12, 12)
        loan_dict['loanDate'] = fake.date_between_dates(start_date, end_date)
        loan_dict['loanID'] = 101000 + id
        loan_dict['loanAmount'] = random.randint(1000, 100000)
        loan_dict['customerID'] = cast_id_list[id]
        loans_list.append(loan_dict)
    return loans_list


def gen_workers(branch_id_list: list[int], team_id_list: list[int]):
    # Generate fake data
    workers_list = []
    banking_roles = [
        "Manager",
        "Officer",
        "Credit Analyst",
        "Loan Closer"
    ]
    rol_index = 0
    team_idx = 0
    for id in range(1600):
        worker_dict = {}
        worker_dict['workerID'] = 105000 + id
        worker_dict['workerName'] = fake.first_name()
        worker_dict['workerRole'] = banking_roles[rol_index]
        worker_dict['brancheID'] = branch_id_list[id % 400]
        worker_dict['teamID'] = team_id_list[team_idx]
        worker_dict['workerAge'] = random.randint(18, 90)
        rol_index += 1
        if rol_index == 4:
            rol_index = 0
            team_idx += 1
        workers_list.append(worker_dict)
    return workers_list


def gen_teams():
    # Generate fake data
    days_of_week = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    ]
    team_id_list = []
    teams_list = []
    for id in range(400):
        team_dict = {}
        team_dict['teamID'] = 104000 + id
        team_id_list.append(104000 + id)
        team_dict['workDay'] = days_of_week[id % 7]
        teams_list.append(team_dict)
    return teams_list, team_id_list


# Press the green button in the gutter to run the script.
if __name__ == '__main__':

    # Define your connection parameters
    username = "SYSTEM"
    password = "admin1"
    dsn = '10.100.102.28:1521/xe'  # Updated DSN to use the correct IP and service name
    mode = cx_Oracle.SYSDBA
    fake = Faker()

    # Create the DSN (Data Source Name)
    try:
        # Establish the connection
        connection = cx_Oracle.connect(username, password, dsn, mode=mode)
        print("Connected to the Oracle database")

        # Create a cursor
        cursor = connection.cursor()
        # delete_statement = f"DELETE FROM Reporters"
        #
        # # Execute the DELETE statement
        # cursor.execute(delete_statement)
        # delete_statement = f"DELETE FROM teams"
        #
        # # Execute the DELETE statement
        # cursor.execute(delete_statement)

        # Example data to insert
        reporters, rep_id_list = gen_reporters()
        teams, team_id_list = gen_teams()
        branches, branch_id_list = genBRANCH(reporter_id_list=rep_id_list)
        customers, cast_id_list = gencast(branch_id_list=branch_id_list)
        loans = gen_loans(cast_id_list=cast_id_list)
        workers = gen_workers(branch_id_list=branch_id_list, team_id_list=team_id_list)

        for rep in reporters:
            data = (rep['reporterID'], rep['reporterName'])
            insert_rep = """
                            INSERT INTO Reporters (reporterID, reporterName)
                            VALUES (:1, :2)
                            """
            cursor.execute(insert_rep, data)

            # Commit the transaction
            connection.commit()

        for team in teams:
            data = (team['teamID'], team['workDay'])
            insert_rep = """
                            INSERT INTO Teams (teamID, workDay)
                            VALUES (:1, :2)
                            """
            cursor.execute(insert_rep, data)

            # Commit the transaction
            connection.commit()

        for branch in branches:
            data = (branch['brancheID'], branch['brancheLocation'], branch['reporterID'], branch['openedDate'])
            insert_rep = """ INSERT INTO Branche (brancheID, brancheLocation, reporterID, openedDate)
            VALUES (:1, :2, :3, :4)"""
            cursor.execute(insert_rep, data)

            # Commit the transaction
            connection.commit()
        for cust in customers:
            data = (cust['customerID'], cust['customerName'], cust['accountID'], cust['joinDate'], cust['brancheID'])
            insert_rep = """ INSERT INTO Customers (customerID, customerName, accountID, joinDate, brancheID)
                        VALUES (:1, :2, :3, :4, :5)"""
            cursor.execute(insert_rep, data)

            # Commit the transaction
            connection.commit()
        for loan in loans:
            data = (loan['loanID'], loan['loanAmount'], loan['customerID'], loan['loanDate'])
            insert_rep = """ INSERT INTO Loans (loanID, loanAmount, customerID,loanDate)
                                    VALUES (:1, :2, :3, :4)"""
            cursor.execute(insert_rep, data)

            # Commit the transaction
            connection.commit()
        for wor in workers:
            data = (wor['workerID'], wor['workerName'], wor['workerRole'], wor['brancheID'], wor['teamID'],
                    wor['workerAge'])
            insert_rep = """ INSERT INTO Workers (workerID, workerName, workerRole, brancheID, teamID,workerAge)
                                    VALUES (:1, :2, :3, :4, :5, :6)"""
            cursor.execute(insert_rep, data)

            # Commit the transaction
            connection.commit()

        # Execute a query to fetch and print the results
        cursor.execute("SELECT * FROM Reporters")
        rows = cursor.fetchall()
        print(len(rows))
        cursor.execute("SELECT * FROM Loans")
        rows = cursor.fetchall()
        print(len(rows))
        cursor.execute("SELECT * FROM Branche")
        rows = cursor.fetchall()
        print(len(rows))
        cursor.execute("SELECT * FROM Workers")
        rows = cursor.fetchall()
        print(len(rows))
        cursor.execute("SELECT * FROM Customers")
        rows = cursor.fetchall()
        print(len(rows))
        cursor.execute("SELECT * FROM Teams")
        rows = cursor.fetchall()
        print(len(rows))
        # for row in rows:
        #     print(row)

    except cx_Oracle.DatabaseError as e:
        # Handle database connection errors
        error, = e.args
        print(f"Error connecting to Oracle: {error.message}")

    finally:
        # Ensure the cursor and connection are closed properly
        if cursor:
            cursor.close()
        if connection:
            connection.close()
        print("Connection closed")

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
# loan_id = random.randint(100000000, 999999999)
#     loan_amount = random.randint(1000, 1000000)
#     borrower_name = fake.name()
#     city = fake.city()
#     loanDate = fake.date_this_decade()
#
#     data = (loan_id, loan_amount, borrower_name, city, loanDate)
