# Bangkit-CloudComputing ☁ 
- Cloud Architecture<br>
![Untitled-2023-06-16-0810](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/b6fcec5c-fbcb-4554-a560-58c8567627d2)
# Member
- Rausyanfikr Adi Karmayoga - C261DKX3957
- Ayi Sumarna - C361DSX4882
# Table of Contents
Cloning Tutorial Documentation:
- [Classification API](#classification-api)
- [Recommendation API](#recommendation-api)
- [Authentication API](#authentication-api)
# Classification API
## Setup Cloud Storage
- Open [Google Cloud Console](https://console.cloud.google.com/) here.
- Go to Cloud Storage.
- Create a bucket by clicking CREATE button.
- Set your globally unique bucket name.
- Choose your region.
- Set a default class (Standard).
- Uncheck the <I>Enforce public access prevent ...</I>
- Select Access Control as `Fine-grained`.
- Then, hit CREATE.
- On your buckets, click the three dots at the right of your bucket.
- Click Edit Access and click Add Principal.
- In the new principal column type `allUsers`.
- In the role column select Cloud Storage > `Storage Object Viewer`.
- Click Save.

## Setup Service Account
- Go to IAM & Admin > Service Accounts or click [here](https://console.cloud.google.com/iam-admin/serviceaccounts).
- Select your project.
- Click Create Service Account
- Set your name, Select role Cloud Storage > `Storage Admin`
- Click your service account email > KEYS > Select ADD KEY and click Create new key.
- Select JSON and click CREATE.
- Save your credential account.

## Deploy to Cloud Run
- Open your Cloud Shell by clicking [here](https://shell.cloud.google.com/).
- Set your project.
```bash
  gcloud config set project [PROJECT_ID]
```
- Clone this repository by the below command and go to the ClassificationAPI directory.
```bash
  git clone https://github.com/ornaman-dev/Bangkit-CloudComputing.git
  cd Bangkit-CloudComputing/ClassificationAPI/
```
- Upload your Service Account Credentials to the directory.
- Rename the file as `credentials.json`.
- Edit the main.py file to change your cloud bucket name.
```bash
  nano main.py
```
- Save it by typing `CTRL`+`X`, `Y`, `Enter`.
- Deploy the API by running the command on your cloud shell.
```bash
  gcloud run deploy --source .
```
- Type `classification-api` as the service name and select your region the same as your bucket.
- Wait until it finishes.

# Recommendation API
## Setup Cloud SQL
- Open [Google Cloud Console](https://console.cloud.google.com/) here.
- Go to Cloud SQL.
- Choose MySQL as the database engine.
- Type your instance id and password.
- Choose a region and set your Zonal availability as Single Zone.
- On a Customize your instance, click `SHOW CONFIGURATION OPTIONS`.
- Click Connections and select Public IP as an Instance IP assignment.
- Click add a network in the network column type `0.0.0.0/0` and click done.
- Hit `CREATE INSTANCE` button.

## Deploy to App Engine
- Open your Cloud Shell by clicking [here](https://shell.cloud.google.com/).
- Set your project.
```bash
  gcloud config set project [PROJECT_ID]
```
- Clone this repository by the below command and go to the RecommendationAPI directory.
```bash
  git clone https://github.com/ornaman-dev/Bangkit-CloudComputing.git
  cd Bangkit-CloudComputing/RecommendationAPI/
```
- In the directory create a JSON file for the database authentication.
```bash
  nano db_auth.json
```
- Copy the below format and enter your instance auth.
```bash
  {
    "db_user": <user>,
    "db_password": <password>,
    "db_host_ip": <public_ip>,
    "db_name": "ornaman"
  }
```
- Check your <I>Public IP address</I> by going to your instance and looking up `Connect to this instance`.
- Download the database configuration by visiting this [file](https://github.com/ornaman-dev/Bangkit-CloudComputing/blob/main/RecommendationAPI/ornaman.sql).
- Upload the file to Google Cloud Storage.
- In the Cloud SQL import the database by hitting the `IMPORT` button.
- Browse your file and remain the file format as SQL then hits `IMPORT`.
- Deploy the API by running the command below on your cloud shell tab.
```bash
  gcloud app deploy
```
- Type `Y` hit Enter and select your region.
- Wait until it is deployed.
 
# Authentication API
## Setup Cloud SQL
<I>you can skip this (same as recommendation API)</I>
- Open [Google Cloud Console](https://console.cloud.google.com/) here.
- Go to Cloud SQL.
- Choose MySQL as the database engine.
- Type your instance id and password.
- Choose a region and set your Zonal availability as Single Zone.
- On a Customize your instance, click `SHOW CONFIGURATION OPTIONS`.
- Click Connections and select Public IP as an Instance IP assignment.
- Click add a network in the network column type `0.0.0.0/0` and click done.
- Hit `CREATE INSTANCE` button.

## Deploy to App Engine
- Open your Cloud Shell by clicking [here](https://shell.cloud.google.com/).
- Set your project.
```bash
  gcloud config set project [PROJECT_ID]
```
- Clone this repository by the below command and go to the AuthenticationAPI directory.
```bash
  git clone https://github.com/ornaman-dev/Bangkit-CloudComputing.git
  cd Bangkit-CloudComputing/AuthenticationAPI/
```
- In the directory open file `.env.example` and edit it.
```bash
  nano .env.example
```
- Insert your database instance auth.
- Rename the file from `.env.example` to `.env`.
- Check your <I>Public IP address</I> by going to your instance and looking up `Connect to this instance`.
- Download the database configuration by visiting this [file](https://github.com/ornaman-dev/Bangkit-CloudComputing/blob/main/RecommendationAPI/ornaman.sql).
- Upload the file to Google Cloud Storage.
- In the Cloud SQL import the database by hitting the `IMPORT` button.
- Browse your file and remain the file format as SQL then hits `IMPORT`.
- Deploy the API by running the command below on your cloud shell tab.
```bash
  gcloud app deploy
```
- Type `Y` hit Enter and select your region.
- Wait until it is deployed.
