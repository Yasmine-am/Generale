# %% Extracting data from a website like allrecipes.
import re
import json
import requests
from bs4 import BeautifulSoup
import pyodbc
from nltk.stem import WordNetLemmatizer
from nltk.tokenize import word_tokenize
import nltk
#%%
def getallurl(zoekterm):
    page = requests.get('https://www.allrecipes.com/search?q='+zoekterm)
    dehtml = BeautifulSoup(page.content, 'html.parser')
    delijst = dehtml.find(id='search-results__content_1-0')
    lijsteen = []
    cardurl = ''
    for card in delijst.find_all('a'):
        cardurl = card['href']
        lijsteen.append(cardurl)
    return lijsteen

def checkrecipe(url):
    recpage = requests.get(url)
    rechtml = BeautifulSoup(recpage.content, 'html.parser')
    reclijst = rechtml.find(id="allrecipes-schema_1-0", attrs={'type':'application/ld+json'})
    return reclijst

def readrecipecontent(url):
    #for loop
    reclijst = checkrecipe(url)
    for data in reclijst:
        recipecontent = json.loads(data.string)
    return recipecontent 

def checkurl(url):
    substr = 'recipes.com/recipes/'
    substr2 = 'recipes.com/article/'
    print(url)
    if substr in url:
        print(True)
        pass
    elif substr2 in url:
        print(True)
        pass
    else:
        print(False)
        return url
# %%
urllist = getallurl('beef')
urlrec = []
count = 0

for url in urllist:
    if checkurl(url) != None:
        urlrec.append(checkurl(url))
    else:
        pass
    
#%% Writing data to DataBase in SQL.
instructions = ""
instruction = ""
description = ""
server = 'yc2304server.database.windows.net'
database = 'YC2304pythonDB'
username = 'adminYC2304'
password = '{ABCD12#$}'   
driver= '{ODBC Driver 17 for SQL Server}'

connection = pyodbc.connect('DRIVER='+driver+
                                ';SERVER=tcp:'+server+
                                ';PORT=1433;DATABASE='+database+
                                ';UID='+username+';PWD='+ password)
#%%
if connection != 'NULL':
    # Here we start with creating a recipe table
    #db_Info = connection.get_server_info()
    #print("Connected to MySQL Server version ", db_Info)
    cursor = connection.cursor()
    cursor.execute("""IF OBJECT_ID(N'recipe', N'U') IS NULL
    CREATE TABLE recipe (
                RecipeID int IDENTITY(1,1) PRIMARY KEY,
                RecipeTitle nvarchar(255),
                UserId bigint, 
                PrepTime nvarchar(255),
                PrepText nvarchar(2000),
                CookAttireId bigint,
                BBQId bigint,
                Rating float,
                Foto nvarchar(255),
                Intro nvarchar(1000),
                [Diet]  nvarchar (255) NOT NULL CHECK ([Diet] IN('vlees', 'vis', 'vega')) DEFAULT 'vlees',
                DateCreate datetime);
                """)
    cursor.execute("select * from recipe")
    record = cursor.fetchall()
    #print("You're connected to database: ", record)
    rows = len(record)

    for url in urlrec: 
        recipecontent = readrecipecontent(url)
        #print(json.dumps(recipecontent, indent=4))
        for i in range(0,len(recipecontent[0]['recipeInstructions'])):
            u = len(list(recipecontent[0]['recipeInstructions'][i].values())) - 1
            instruction = list(recipecontent[0]['recipeInstructions'][i].values())[u] 
            instructions += instruction
            instructions = instructions.replace(",", "@")
        instructions = '"{0}"'.format(instructions)
        description = recipecontent[0]['description']
        description = description.replace(",", "@")
        description = description.replace('"', "'")
        description = description.replace("&#39;", "$")
        description = '"{0}"'.format(description)
        image = '"{0}"'.format(list(recipecontent[0]['image'].values())[1])
        recipeTitle = recipecontent[0]['headline']
        recipeTitle = recipeTitle.replace("&#39;", "$")

        df = [recipeTitle, 0, recipecontent[0]['totalTime'],instructions, \
            1, 1, list(recipecontent[0]['aggregateRating'].values())[1],\
            image, description, 'vlees']
        if rows != 0:
            cursor.execute("select * from recipe")
            record = cursor.fetchall()
            if df[0] not in [z[1] for z in record]: #mss geen dubbele loop nodig, aan csv vragem.
                print('oke, nieuwe!')
                sqlcode = "INSERT INTO recipe ([RecipeTitle], [UserId],\
                [PrepTime], [PrepText], [CookAttireId], [BBQId],\
                [Rating], [Foto], [Intro], [Diet], [DateCreate])\
                    VALUES ('"+ df[0] + "','"+ str(df[1]) + "','"+ df[2] + "','"+ df[3] + "','"+ str(df[4]) + "','"+ str(df[5]) + "','"+ str(df[6]) + "','"+ df[7] + "','" + df[8] + "','" +  df[9] + "', getdate());"
                print(sqlcode)
                cursor.execute(sqlcode) 
                rows +=1
            else:
                pass
                #print("HOHO, hetzelfde")
        else:
            print("lege lijst, voeg toe")
            sqlcode = "INSERT INTO recipe ([RecipeTitle], [UserId],\
                [PrepTime], [PrepText], [CookAttireId], [BBQId],\
                [Rating], [Foto], [Intro], [Diet], [DateCreate])\
                    VALUES ('"+ df[0] + "','"+ str(df[1]) + "','"+ df[2] + "','"+ df[3] + "','"+ str(df[4]) + "','"+ str(df[5]) + "','"+ str(df[6]) + "','"+ df[7] + "','" + df[8] + "','" +  df[9] + "', getdate());"
            print(sqlcode)
            cursor.execute(sqlcode)
            rows +=1
            # the connection is not autocommited by default. So we must commit to save our changes.
        connection.commit()              
        description = ""
        instructions = ""
    
    #Here we start creatinge and filling an ingredient table
    cursor.execute("""IF OBJECT_ID(N'ingredient', N'U') IS NULL
    CREATE TABLE ingredient (
    IngredientID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255));""")
    cursor.execute("""IF OBJECT_ID(N'ingrec', N'U') IS NULL
    CREATE TABLE ingrec (
    ingrepID int IDENTITY(1,1) PRIMARY KEY,
    RecipeID int FOREIGN KEY REFERENCES recipe (RecipeID),
    IngredientID int FOREIGN KEY REFERENCES ingredient (IngredientID),
    Amount float,
    Unit varchar(255)
    );""")
    #int FOREIGN KEY REFERENCES recipes(RecipeID)
    #int FOREIGN KEY REFERENCES ingredients(IngredientID)
    cursor.execute("select * from ingredient")
    record2 = cursor.fetchall()
    rows2 = len(record2)
    total_ing_list = []
    total_amount = []
    for url in urlrec:
        recipecontent = readrecipecontent(url)                
        lemmatizer = WordNetLemmatizer()
        right_ing_list = []
        amount_data_list = []
        for ing in recipecontent[0]["recipeIngredient"]:
            ingredientlist = re.split(',', ing)
            words = word_tokenize(ingredientlist[0])
            lemmatized_words = [lemmatizer.lemmatize(word) for word in words]
            q = nltk.pos_tag(lemmatized_words)
            print(ingredientlist[0])
            right_ing_temp = []
            right_ing = []
            right_ing_name = [j[1] for j in q]
            amount_data = []
            ele = ')'
            if len(right_ing_name) == 1:
                words = ['1'] + words
                #right_ing.append('1')
                ingredient = words[1]
                amount_data.append(words[0])
                right_ing =words
            else:    
                for i in range(0, len(right_ing_name)-1):
                    if right_ing_name[i+1] == "NN" and right_ing_name[i]== "CD" and len(right_ing_name) == 2:
                        #right_ing_temp.append(words[i])
                        right_ing.append(words[i])
                        amount_data.append(words[i])
                    elif right_ing_name[i+1] == "NN" and right_ing_name[i]== "CD":
                        right_ing_temp.append(words[i])
                        right_ing_temp.append(words[i+1])
                        right_ing.append(right_ing_temp)
                        amount_data.append(words[i])
                        right_ing_temp = []
                    elif right_ing_name[i+1] == "JJ" and right_ing_name[i] == "CD":
                        right_ing_temp.append(words[i])
                        right_ing_temp.append(words[i+1])
                        right_ing.append(right_ing_temp)
                        amount_data.append(words[i])
                        right_ing_temp = []
                    elif right_ing_name[i] == "CD" and right_ing_name[i+2] == "CD":
                        temp_list = []
                        for char in words:
                            if char == ')':
                                temp_list.append(char)
                                right_ing.append(temp_list)
                                temp_list = []
                            else:
                                temp_list.append(char)
                        right_ing.append(temp_list)
                        amount_data.append(words[i])
                    elif right_ing_name[i] == "CD":
                        right_ing_temp.append(words[i])
                        right_ing.append(right_ing_temp)
                        right_ing_temp = []
                        amount_data.append(words[i])
                    else:
                        right_ing.append(words[1:])
                        amount_data.append('Null')
                        #right_ing_temp = []
            right_ing = " ".join(right_ing[0])
            if right_ing.find('( ') == 2:
                #print("nice one")
                right_ing = right_ing.replace(right_ing[2:4], '(')
                right_ing = right_ing.replace(right_ing[-2:], ')')
            elif right_ing.find(' .') == 1:
                right_ing = '0.5'
            print(right_ing)
            #print(right_ing)
            ingredient = ingredientlist[0].replace(right_ing, '')
            if rows2 != 0:
                cursor.execute("select * from ingredient")
                record2 = cursor.fetchall()
                if ingredient not in [z2[1] for z2 in record2]:
                    #print('nieuwe rij')
                    sqlcode = "INSERT INTO ingredient ([Name])\
                                VALUES ('" + ingredient + "');"
                    #print(sqlcode)
                    cursor.execute(sqlcode)
                    #sqlcode = "INSERT INTO ingrep ([RecipeID, IngredientID])\
                    #            VALUES ('" + right_ing + "');"
                    #print(sqlcode)
                    #cursor.execute(sqlcode)  
                    #rows2 +=1
                else:
                    pass
                    #print("HOHO, hetzelfde")
            else:
                #print("Lege lijst, voeg toe")
                sqlcode = "INSERT INTO ingredient ([Name])\
                                VALUES ('" + ingredient + "');"
                    #print(sqlcode)
                cursor.execute(sqlcode) 
                rows2 +=1
            right_ing_list.append(right_ing)
            amount_data_list.append(amount_data)
        total_ing_list.append(right_ing_list)
        total_amount.append(amount_data_list)
        connection.commit()
    #Now finally we will include an intermediate table.
    
    cursor.execute("select * from recipe")
    record3 = cursor.fetchall()
    rows2 = len(record2)
    ingrec_list = []
    ingrec_list_temp = []
    for url in urlrec:
        recipecontent = readrecipecontent(url)                
        cursor.execute("select * from ingredient")
        record4 = cursor.fetchall()
        recipe_list = []
        count = 0
        for ing_list in total_ing_list:
            for j in range(0, len(ing_list)):
                recipe_list.append(record4[count][0])
            count +=1
        
        for ing in recipecontent[0]["recipeIngredient"]:
            for z in record4:
                if z[1] in ing:
                    #print(True)
                    ingrec_list_temp.append(z[0])
                else:
                    pass
            ingrec_list.append(ingrec_list_temp[0])
            ingrec_list_temp = []
            print(ingrec_list)
            #ingrec_list.append(ingrec_list_temp[0])
            #ingrec_list_temp = []
    flat_list = [item for sublist in total_ing_list for item in sublist]
    flat_amount_list = [item[0] for sublist in total_amount for item in sublist]
    flat_unit_list = []
    for i in range(0, len(flat_list)):
        if 'pepper to taste' in flat_list[i]:
            flat_unit_list.append('')
        else:
            flat_unit_list.append(flat_list[i].replace(flat_amount_list[i], ''))
    
    for i in range(0, len(recipe_list)):
        cursor.execute("select * from ingrec")
        record5 = cursor.fetchall()
        rows5 = len(record5)
        if rows5 != 0:
            cursor.execute("select * from ingrec")
            record5 = cursor.fetchall()
            if [recipe_list[i], ingrec_list[i]] not in [[z5[1], z5[2]] for z5 in record5]:
                sqlcode = "INSERT INTO ingrec ([RecipeID], [IngredientID], [Amount], [Unit])\
                        VALUES ("+ str(recipe_list[i]) + ","+ str(ingrec_list[i]) + ","+ flat_amount_list[i] + ",'"+ flat_unit_list[i] +"');"
                cursor.execute(sqlcode)
                rows5 +=1
            else:
                pass
            connection.commit()
        else:  
            sqlcode = "INSERT INTO ingrec ([RecipeID], [IngredientID], [Amount], [Unit])\
                            VALUES ("+ str(recipe_list[i]) + ","+ str(ingrec_list[i]) + ","+ flat_amount_list[i] + ",'"+ flat_unit_list[i] +"');"
            cursor.execute(sqlcode)
            rows5 +=1
        connection.commit()
print("MySQL connection is closed")

cursor.close()
connection.close()
# %%
