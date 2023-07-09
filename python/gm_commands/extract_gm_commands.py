import mysql.connector


# Add in dotenv for vars

HOST = "0.0.0.0"
PORT = "3306"
USER = "mangos"
PASSWORD = "mangos"
DATABASE = "classicmangos"

# Connect to MSSQL Server
try:
    conn = mysql.connector.connect(host=HOST,
                                   user=USER,
                                   password=PASSWORD,
                                   database=DATABASE)
    print("[+] Connected...")
except:
    exit()

# Create a database cursor
cursor = conn.cursor()

# Query
query = """SELECT name, security, help FROM command"""

# Execute the query
cursor.execute(query)

for row in cursor:
    if not row:
        continue
    command = row[0]
    level = row[1]
    help_str = row[2]
    help_str = help_str.split("\r\n\r\n")
    # print("START")
    # print("%r" % help_str)
    if len(help_str) == 1:
        print("Line: %r" % help_str)

cursor.close()
conn.close()
