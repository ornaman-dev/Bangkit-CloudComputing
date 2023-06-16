from db.base_class import Base
from sqlalchemy import Boolean
from sqlalchemy import Column
from sqlalchemy import Date
from sqlalchemy import ForeignKey
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import VARCHAR
from sqlalchemy.orm import relationship


# class Plant(Base):
#     plant_id = Column(Integer, primary_key=True, index=True)  # plant_id
#     class_name = Column(String, nullable=False, index=True)  # name
#     family_name = Column(String, nullable=False, index=True)  # family_name
#     common_name = Column(String, nullable=False)  # common_name / name_alt
#     taxonomic_data_url = Column(String)  # taxonomic_data_url
#     location = Column(String, nullable=False)
#     description = Column(String, nullable=False)  # desc
#     date_posted = Column(Date)
#     is_active = Column(Boolean(), default=True)
#     fav_plant_id = Column(Integer, ForeignKey("user.id"))
#     fav_by = relationship("User", back_populates="fav_plant")
#     image_url = Column(String)  # sample_image_url
#     light = Column(String)  # new rombak
#     water = Column(String)  # new rombak
#     humidity = Column(String)  # new rombak
#     temperature = Column(String)  # new rombak
#     food = Column(String)  # new rombak
#     toxicity = Column(String)  # new rombak
#     cares = Column(String)  # new rombak
#     fact = Column(String)  # new rombak
#     rec_id = Column(String)  # plant_id in recomendation api

class Plants(Base):
    id = Column(VARCHAR(15), primary_key=True, index=True)  # plant_id
    name = Column(VARCHAR(255), nullable=False, index=True)  # name
    name_alt = Column(VARCHAR(255), nullable=False, index=True)  # name_alt
    image = Column(VARCHAR(255))  # sample_image_url
    desc = Column(VARCHAR(755), nullable=False)  # desc
    light = Column(VARCHAR(555))  # new rombak
    water = Column(VARCHAR(555))  # new rombak
    humidity = Column(VARCHAR(555))  # new rombak
    temperature = Column(VARCHAR(555))  # new rombak
    food = Column(VARCHAR(655))  # new rombak
    toxicity = Column(VARCHAR(555))  # new rombak
    cares = Column(VARCHAR(555))  # new rombak
    fact = Column(VARCHAR(555))  # new rombak
