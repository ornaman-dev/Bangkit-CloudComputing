# Bangkit-CloudComputing ☁ 

# Member
- Rausyanfikr Adi Karmayoga - C261DKX3957
- Ayi Sumarna - C361DSX4882

# Table of Contents
- [Classification API](#classification-api)
- [Recpmmendation API](#recommendation-api)
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
- Clone this repository by the below command. And go to the Classification directory.
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
- Deploy the API by running the command on your cloud shell.
```bash
  gcloud run deploy --source .
```
- Select your region the same as your bucket.
- Wait until it finish.
