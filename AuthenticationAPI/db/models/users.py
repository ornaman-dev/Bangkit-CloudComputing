from db.base_class import Base
from sqlalchemy import Boolean
from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import VARCHAR
from sqlalchemy.orm import relationship


# class User(Base):
#     id = Column(Integer, primary_key=True, index=True)
#     username = Column(
#         String, unique=True, nullable=False
#     )  # TODO ganti jadi name atau full_name
#     email = Column(String, nullable=False, unique=True, index=True)
#     hashed_password = Column(String, nullable=False)
#     is_active = Column(Boolean(), default=True)
#     is_superuser = Column(Boolean(), default=False)
#     fav_plant = relationship("Plant", back_populates="fav_by")
#     id_rec = Column(String)

class Users(Base):
    id = Column(VARCHAR(15), primary_key=True, index=True)
    name = Column(
        VARCHAR(255), unique=False, nullable=False
    )  # TODO ganti jadi name atau full_name
    email = Column(VARCHAR(255), nullable=False, unique=True, index=True)
    password = Column(VARCHAR(255), nullable=False)