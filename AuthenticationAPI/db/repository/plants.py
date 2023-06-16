# db > repository > plants.py
from db.models.plants import Plants
from sqlalchemy.orm import Session

def retreive_plant(id: str, db: Session):
    item = db.query(Plants).filter(Plants.id == id).first()
    # It is equivalent to sql command: select * from plant where plant_id = {plant_id};
    return item


def list_plants(db: Session):
    plants = db.query(Plants).all()
    return plants
