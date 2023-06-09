import pandas as pd
import mysql.connector
import random
import json
import uuid
import uvicorn

from sklearn.metrics.pairwise import cosine_similarity
from fastapi import FastAPI
from pydantic import BaseModel

class Item(BaseModel):
    user_id: str
    plant_id: str

dbAuth = json.load(open('db_auth.json'))
mydb = mysql.connector.connect(
        user=dbAuth['db_user'], 
        password=dbAuth['db_password'], 
        host=dbAuth['db_host_ip'], 
        database=dbAuth['db_name']
    )
cursor = mydb.cursor( dictionary=True )

app = FastAPI()

def create_favorite(user_id, plant_id):
    fav_id = 'fav-' + str(uuid.uuid4())[:6]
    query = (f"INSERT INTO `favorite` VALUES ('{fav_id}', '{user_id}', '{plant_id}');")

    cursor.execute(query)
    mydb.commit()

def delete_favorite(user_id, plant_id):
    query = (f"DELETE FROM favorite WHERE user_id = '{user_id}' AND plant_id = '{plant_id}';")

    cursor.execute(query)
    mydb.commit()

def recommend_plant(user_favorites):
    df = pd.read_csv('books/Clean_Dataset.csv')
    new_id = max(df['User_id']) + 1
    favorite = 1

    #Create New Dataframe
    df_new = pd.DataFrame({
        "User_id" : new_id,
        "Plant Name" : user_favorites,
        "Favorite" : favorite
    })


    #Concant new dataframe to old dataframe
    df = pd.concat([df,df_new],ignore_index=True)

    #Find Similarity between user using cosine similarity
    df_matrix = df.pivot_table(index='User_id',columns='Plant Name',values='Favorite')
    similarities = cosine_similarity(df_matrix.fillna(0))
    cosine_similarity_df = pd.DataFrame(similarities, index=df_matrix.index, columns=df_matrix.index)

    #Find the 5 most similar user
    cosine_similarity_df.drop(index=new_id, inplace=True)
    n = 5
    treshold = 0.3
    similar_user = cosine_similarity_df[cosine_similarity_df[new_id] > treshold][new_id].nlargest(n)

    #Narrow Down The user by removing all the plant that has been favorited by new user
    user_picked = df_matrix[df_matrix.index == new_id].dropna(axis=1,how='all')
    similar_user_plant = df_matrix[df_matrix.index.isin(similar_user.index)].dropna(axis=1,how='all')
    similar_user_plant.drop(user_picked.columns,axis=1,inplace=True,errors="ignore")


    #Recommend plant to new user
    item_score = {}
    for i in similar_user_plant.columns:
        plant_rating = similar_user_plant[i]
        total = 0
        count = 0
        
        for u in similar_user.index:
            if pd.isna(plant_rating[u]) == False:
                score = similar_user[u] * plant_rating[u]
                total += score
                count +=1
        
        item_score[i] = total / count
        
    
    #Check if recommend plant < 3
    if(len(item_score) < 3):
        plant_names = ['Agglonema', 'Alocasia', 'Gelombang Cinta', 'Janda Bolong', 'Lidah Mertua', 'Lili Paris', 'Pucuk Merah', 'Suplir']
        random.shuffle(plant_names)

        for i in plant_names:
            if i not in item_score:
                item_score[i] = 0.1
                plant_names.remove(i)
            
            if (len(item_score) >= 3):
                break

    item_score = pd.DataFrame(item_score.items(), columns=['Plant', 'Score'])
    ranked_item_score = item_score.sort_values(by='Score', ascending=False)

    
    return ranked_item_score['Plant'].values

def get_user_fav(user_id):
    query = (f"SELECT plants.name_alt AS tanaman FROM users INNER JOIN favorite ON users.id = favorite.user_id INNER JOIN plants ON favorite.plant_id = plants.id WHERE users.id = '{user_id}';")

    cursor.execute(query)
    frame = cursor.fetchall()

    fav_plants = []
    for item in frame:
        fav_plants.append(item['tanaman'])

    return fav_plants

def get_plants(recommendation):
    recom_t = tuple(recommendation)
    query = ("SELECT id, name_alt, image, plants.desc FROM plants WHERE name_alt IN {}".format(recom_t))

    cursor.execute(query)
    frame = cursor.fetchall()
    
    return frame


@app.post("/likes")
async def likes(item: Item):
    create_favorite(item.user_id, item.plant_id)
    myfav = get_user_fav(item.user_id)
    recommended = recommend_plant(myfav)
    result = get_plants(recommended)

    return result

@app.delete("/unlike")
async def unlike(item: Item):
    delete_favorite(item.user_id, item.plant_id)
    
    return {
        "message": "success"
    }

@app.get("/")
def home():
    return "Hello World! This belongs to the root path of Recommendation API by Ornaman Team."

@app.get("/plants")
def plants():
    query = ("SELECT id, name, name_alt, image, plants.desc FROM plants ORDER BY name_alt;")
    
    cursor.execute(query)
    frame = cursor.fetchall()
    
    return frame

@app.get("/plant")
def plant(id: str):
    query = ("SELECT * FROM plants WHERE id = '{}';".format(id))
    
    cursor.execute(query)
    frame = cursor.fetchall()
    
    return frame[0]

if __name__ == "__main__":
    uvicorn.run(app, host='0.0.0.0', port=8000)