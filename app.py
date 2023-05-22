# %%
"""Module providingFunction printing python version."""
import pyodbc
#import requests
#from bs4 import BeautifulSoup
import json
import pandas as pd

from flask import Flask
#from flask_mysqldb import MySQL
#from flask import Flask
from flask_cors import CORS
app = Flask(__name__)
CORS(app)

def connection():
    server = 'yc2304server.database.windows.net'
    database = 'YC2304pythonDB'
    username = 'adminYC2304'
    password = '{ABCD12#$}'   
    driver= '{ODBC Driver 17 for SQL Server}'
    cstr = 'DRIVER='+driver+';SERVER=tcp:'+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password
    conn = pyodbc.connect(cstr)
    return conn
    
@app.route("/recipes", methods = ["GET","POST"])
def recipe():
    conn = connection()
    cursor = conn.cursor()
    cursor.execute("select * from recipe")
    recipes = cursor.fetchall()
    df = pd.DataFrame.from_records(recipes)
    result = df.to_json(orient="records")
    parsed = json.loads(result)
    recjson = json.dumps(parsed, indent=4, default=str)
    print("MySQL connection is closed")
    cursor.close()
    return recjson

@app.route("/ingredients", methods = ["GET","POST"])
def ingredient():
    conn = connection()
    cursor = conn.cursor()
    cursor.execute("select * from ingredient")
    ingredient = cursor.fetchall()
#    df = pd.DataFrame.from_records(ingredient, columns=['IngredientID', 'Name'])
    df = pd.DataFrame.from_records(ingredient, columns=['IngredientID', 'Name'])
    result = df.to_json(orient="records")
    parsed = json.loads(result)
    ingjson = json.dumps(parsed, indent=4, default=str)
    cursor.close()
    return ingjson

@app.route("/ingrec", methods = ["GET","POST"])
def ingredients():
    conn = connection()
    cursor = conn.cursor()
    cursor.execute("select * from ingrec")
    ingrec = cursor.fetchall()
    df = pd.DataFrame.from_records(ingrec)
    result = df.to_json(orient="records")
    parsed = json.loads(result)
    ingrecjson = json.dumps(parsed, indent=4, default=str)
    cursor.close()
    return ingrecjson

#@app.route("/dump")
#def dump():
#    with open('griller.json') as f:
#        q = json.loads(f.read())
#    return json.dumps(q, indent = 4)
