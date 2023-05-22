"""Module providingFunction printing python version."""
import pyodbc
server = 'yc2304server.database.windows.net'
database = 'YC2304pythonDB'
username = 'adminYC2304'
password = '{ABCD12#$}'   
driver= '{ODBC Driver 17 for SQL Server}'

with pyodbc.connect('DRIVER='+driver+';SERVER=tcp:'+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password) as conn:
    with conn.cursor() as cursor:

        #cursor.execute("DROP TABLE recipes")]
        cursor.execute('DROP TABLE ingrep')
        #cursor.execute('DROP TABLE recipes')
        #cursor.execute('DROP TABLE ingredients')