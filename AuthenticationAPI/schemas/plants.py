from datetime import date
from datetime import datetime
from typing import Optional

from pydantic import BaseModel


# shared properties
class PlantBase(BaseModel):
    id:Optional[str]
    name: Optional[str] 
    name_alt: Optional[str]
    image: Optional[str]
    desc: Optional[str] # desc
    light: Optional[str] # new rombak
    water: Optional[str] # new rombak
    humidity: Optional[str] # new rombak
    temperature: Optional[str] # new rombak
    food: Optional[str]  # new rombak
    toxicity: Optional[str] # new rombak
    cares: Optional[str] # new rombak
    fact: Optional[str] # new rombak


# this will be used to format the response to not to have id,fav_plant_id etc
class ShowPlant(PlantBase):
    id: str
    name: str
    name_alt: str
    image: Optional[str]
    desc: Optional[str] # desc
    light: Optional[str] # new rombak
    water: Optional[str] # new rombak
    humidity: Optional[str] # new rombak
    temperature: Optional[str] # new rombak
    food: Optional[str]  # new rombak
    toxicity: Optional[str] # new rombak
    cares: Optional[str] # new rombak
    fact: Optional[str] # new rombak

    class Config:  # to convert non dict obj to json
        orm_mode = True
