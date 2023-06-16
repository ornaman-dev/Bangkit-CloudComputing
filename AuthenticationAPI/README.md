# Ornaman Backend
> Just Another Ornaman Web Service (Backend)

Please feel free to [submit issues](https://github.com/ornaman-dev/Bangkit-CloudComputing-Backend/issues/new) if you find bugs, want to add features, or anything else related to Ornaman Web Service (Backend).

## Capstone Project by C23-PS369
[Ornaman](https://ornaman.com/) by C23-PS369 Bangkit Academy 2023


![](backend/static/images/lite.gif)

## Technology Stack:
* FastAPI [Check Here](https://fastapi.tiangolo.com/tutorial/sql-databases/)
* Uvicorn (server) [Check Here](https://www.uvicorn.org/)
* Pytest [Check Here](https://docs.pytest.org/en/7.3.x/index.html)
* Sqlalchemy [Check Here](https://www.sqlalchemy.org/)
* [SQLite ](https://www.sqlite.org/index.html) or [PostgreSQL](https://www.postgresql.org/)


## How to start the app ?
```
git clone https://github.com/ornaman-dev/Bangkit-CloudComputing-Backend.git
cd .\Bangkit-CloudComputing-Backend\
python -m venv env   #create a virtual environment
.\env\Scripts\activate  #activate virtual environment
cd .\backend\
pip install -r .\requirements.txt
uvicorn main:app --reload     #start server
visit  127.0.0.1:8000/
```

## TODO
- [ ] Keep updating until the capstone period is over
- [x] Connect to GCP Cloud SQL Instances
- [x] Deploy to Cloud
- [ ] Acquisition and integration with other Ornaman Rest API, such as [Classification API](https://github.com/ornaman-dev/Bangkit-CloudComputing/tree/main/ClassificationAPI) and [Recommendation API](https://github.com/ornaman-dev/Bangkit-CloudComputing/tree/main/RecommendationAPI)
- [ ] Create a comprehensive Documentation

## Live Preview & Test
[Click Here](https://ornamanbackend-1-j5052767.deta.app/) for Preview & Test | Powered by: [Deta Space Builder](https://deta.space/)
