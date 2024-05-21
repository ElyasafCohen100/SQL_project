# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import cx_Oracle


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':

    # Define your connection parameters
    username = "SYS"
    password = "admin1"                 # TODO: pay attention to change this while running on different computers
    host = '10.100.102.28'
    port = 1521  # Default Oracle port
    service_name = 'xe'

    # Create the DSN (Data Source Name)
    dsn_tns = cx_Oracle.makedsn(host, port, service_name=service_name)

    try:
        # Establish the connection
        connection = cx_Oracle.connect(user=username, password=password, dsn=dsn_tns)
        print("Connected to the Oracle database")

        # Create a cursor
        cursor = connection.cursor()

        # Execute a query
        cursor.execute("SELECT * FROM your_table")

        # Fetch and print the results
        rows = cursor.fetchall()
        for row in rows:
            print(row)

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
