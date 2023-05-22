# %% Extracting data from a website like allrecipes.
import requests, csv
from bs4 import BeautifulSoup
import json

def getInfoVanDetail(nwurl):
    pass#print("we gaan deze bezoeken", nwurl)

def getallurl(zoekterm):
    page = requests.get('https://www.allrecipes.com/search?q='+zoekterm)
    dehtml = BeautifulSoup(page.content, 'html.parser')
    delijst = dehtml.find(id='search-results__content_1-0')
    lijsteen = []
    cardurl = ''
    for card in delijst.find_all('a'):
        cardurl = card['href']
        getInfoVanDetail(cardurl)
        lijsteen.append(cardurl)
    return lijsteen
# %%
urllist = getallurl('bbq')
urlrec = []
count = 0
substr = 'recipes.com/recipes/'
for url in urllist:
    print(url)
    if substr in url:
        print(True)
    else:
        print(False)
        urlrec.append(url)
    
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
#%%
instructions = ""
instruction = ""
u = 0
with open('Recipe.csv', "w", encoding="utf-8") as f:
    writer = csv.writer(f,delimiter=',')
    writer.writerow(["Title", "UserID", "Cookingtime","Cookingdescription", "cookingutensilsID", "BbqID", "Rating", "Photo", "Intro", "diettype"])
    
    for url in urlrec: 
        recipecontent = readrecipecontent(url)
        print(json.dumps(recipecontent, indent=4)) 
        for i in range(0,len(recipecontent[0]['recipeInstructions'])):
            u = len(list(recipecontent[0]['recipeInstructions'][i].values())) - 1
            instruction = list(recipecontent[0]['recipeInstructions'][i].values())[u] 
            for char in instruction:
                char = char.replace('"', "'")
                char = char.replace(",", "@")
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
        #print(instructions)
        writer.writerow([recipeTitle, 0, recipecontent[0]['totalTime'],instructions, \
                        1, 1, list(recipecontent[0]['aggregateRating'].values())[1],\
                        image, description, 'vlees'])
        instructions = ""

