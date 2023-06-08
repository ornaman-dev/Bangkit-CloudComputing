import streamlit as st
import pandas as pd
import random
import numpy as np

from sklearn.metrics.pairwise import cosine_similarity

def recommend_plant(user_favorites):
    df = pd.read_csv('Clean_Dataset.csv')
    new_id = max(df['User_id']) + 1
    favorite = 1

    #Create New Dataframe
    df_new = pd.DataFrame(
        {"User_id" : new_id,
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
        plant_names = ['Sri Rezeki', 'Alocasia', 'Gelombang Cinta', 'Janda Bolong', 'Lidah Mertua', 'Lili Paris', 'Pucuk Merah', 'Suplir']
        random.shuffle(plant_names)

        for i in plant_names:
            if i not in item_score:
                item_score[i] = 0.1
                plant_names.remove(i)
            
            if (len(item_score) >= 3):
                break

    item_score = pd.DataFrame(item_score.items(), columns=['Plant', 'Score'])
    ranked_item_score = item_score.sort_values(by='Score', ascending=False)

    
    return ranked_item_score


st.markdown("<h1 style='text-align: center;'>Free-Recommend</h1>", unsafe_allow_html=True)
st.markdown("<h3 style='text-align: center;'>🎍Recommend Ornamental Plant🎍 </h3>", unsafe_allow_html=True)
st.text("")
st.divider()

options = st.multiselect(
    'What are your favorite plants',
    ['Sri Rezeki', 'Alocasia', 'Gelombang Cinta', 'Janda Bolong', 'Lidah Mertua', 'Lili Paris', 'Pucuk Merah', 'Suplir'])

if st.button('Recommend Me'):
    st.divider()
    recommend_plant_df = recommend_plant(options)
    st.markdown("<h4 style='text-align: center;'>Maybe you like these plants </h4>", unsafe_allow_html=True)
    st.divider()
    for index, row in recommend_plant_df.iterrows():
        st.text(row['Plant'])
        st.progress(row['Score'], text=f'Score : {str(np.round(row.Score,2))}')

