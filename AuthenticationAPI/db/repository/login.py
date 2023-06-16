# db > repository > login.py
from db.models.users import Users
from sqlalchemy.orm import Session


def get_user(username: str, db: Session):
    user = db.query(Users).filter(Users.email == username).first()
    return user
