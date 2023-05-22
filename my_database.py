# %%
import mysql.connector
import pandas as pd

with open('Recipe.csv', encoding='utf-8') as csvfile:
    csvreader = pd.read_csv(csvfile, delimiter=",", quotechar='"')
    df = pd.DataFrame(csvreader)
    #df["Rating"] = [3, 4]
    #df["DateCreate"] = [date.today(), date.today()]
    new_df = df[["Title", "UserID",\
                "Cookingtime", "Cookingdescription",\
                "cookingutensilsID", "BbqID",\
                "Rating", "Photo",\
                "Intro", "diettype"]]
    new_df["Rating"] = new_df["Rating"].replace(".", ",")
#%%
try:
    connection = mysql.connector.connect(host='localhost',
                                         database='griller',
                                         user='root',
                                         password='')
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute("CREATE TABLE IF NOT EXISTS recipes (\
        RecipeID bigint NOT NULL AUTO_INCREMENT,\
        RecipeTitle varchar(255),\
        UserId bigint,\
        PrepTime varchar(255),\
        PrepText varchar(255),\
        CookAttireId bigint,\
        BBQId bigint,\
        Rating double,\
        Foto varchar(255),\
        Intro varchar(255),\
        Diet enum('Dessert', 'vis', 'vlees'),\
        DateCreate datetime default now(),\
        PRIMARY KEY(RecipeID));")
        cursor.execute("select * from recipes")
        record = cursor.fetchall()
        print("You're connected to database: ", record)
        rows = len(record)
        for x in range(0, len(new_df["Title"])):
            if rows != 0:
                cursor.execute("select * from recipes")
                record = cursor.fetchall()
                if new_df["Title"][x] not in [z[1] for z in record]: #mss geen dubbele loop nodig, aan csv vragem.
                    print('oke, nieuwe!')
                    lists = [new_df["Title"][x],new_df["UserID"][x],new_df["Cookingtime"][x],new_df["Cookingdescription"][x],new_df["cookingutensilsID"][x], new_df["BbqID"][x], new_df["Rating"][x], new_df["Photo"][x], new_df["Intro"][x], new_df["diettype"][x]]
                    sqlcode = "INSERT INTO `recipes` (`RecipeTitle`, `UserId`,\
                       `PrepTime`, `PrepText`, `CookAttireId`, `BBQId`,\
                       `Rating`, `Foto`, `Intro`, `Diet`, `DateCreate`)\
                        VALUES ('"+ lists[0] + "','"+ str(lists[1]) + "','"+ lists[2] + "','"+ lists[3] + "','"+ str(lists[4]) + "','"+ str(lists[5]) + "','"+ str(lists[6]) + "','"+ lists[7] + "','" + lists[8] + "','" +  lists[9] + "', now());"
                    print(sqlcode)
                    cursor.execute(sqlcode) 
                    rows +=1
                else:
                    print("HOHO, hetzelfde")
            else:
                print("lege lijst, voeg toe")
                lists = [new_df["Title"][x],new_df["UserID"][x],new_df["Cookingtime"][x],new_df["Cookingdescription"][x],new_df["cookingutensilsID"][x], new_df["BbqID"][x], new_df["Rating"][x], new_df["Photo"][x], new_df["Intro"][x], new_df["diettype"][x]]
                sqlcode = "INSERT INTO `recipes` (`RecipeTitle`, `UserId`,\
                       `PrepTime`, `PrepText`, `CookAttireId`, `BBQId`,\
                       `Rating`, `Foto`, `Intro`, `Diet`, `DateCreate`)\
                        VALUES ('"+ lists[0] + "','"+ str(lists[1]) + "','"+ lists[2] + "','"+ lists[3] + "','"+ str(lists[4]) + "','"+ str(lists[5]) + "','"+ str(lists[6]) + "','"+ lists[7] + "','" + lists[8] + "','" +  lists[9] + "', now());"
                print(sqlcode)
                cursor.execute(sqlcode)
                rows +=1
                # the connection is not autocommited by default. So we must commit to save our changes.
            connection.commit()              
            print(x)

except mysql.connector.Error as e:
    print("Error while connecting to MySQL", e)
finally:
    print("MySQL connection is closed")

cursor.close()
connection.close()
# %%
