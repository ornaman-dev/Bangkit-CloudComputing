# apis > version1 > route_plants.py
from typing import List  # for list view
from typing import Optional

from apis.version1.route_login import get_current_user_from_token
from db.models.users import Users
from db.repository.plants import list_plants
from db.repository.plants import retreive_plant
from db.session import get_db
from fastapi import APIRouter
from fastapi import Depends
from fastapi import HTTPException
from fastapi import status
from schemas.plants import ShowPlant
from sqlalchemy.orm import Session


router = APIRouter()

# function retreive plant dari database
@router.get("/get/{id}", response_model=ShowPlant)
def read_plant(id: str, db: Session = Depends(get_db)):
    plant = retreive_plant(id=id, db=db)
    if not plant:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Plant with this id {id} does not exist",
        )
    return plant


@router.get("/all", response_model=List[ShowPlant])  # for list view
def read_plants(db: Session = Depends(get_db)):
    plants = list_plants(db=db)
    return plants

