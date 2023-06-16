# webapps > plants > route_plants.py
from db.repository.plants import list_plants
from db.repository.plants import retreive_plant
from db.session import get_db
from fastapi import APIRouter
from fastapi import Depends
from fastapi import Request
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session

templates = Jinja2Templates(directory="templates")
router = APIRouter(include_in_schema=False)


@router.get("/")
def home(request: Request, db: Session = Depends(get_db), msg: str = None):
    plants = list_plants(db=db)
    return templates.TemplateResponse(
        "plants/homepage.html", {"request": request, "plants": plants, "msg": msg}
    )


@router.get("/detail/{id}")
def plant_detail(id: str, request: Request, db: Session = Depends(get_db)):
    plant = retreive_plant(id=id, db=db)
    return templates.TemplateResponse(
        "plants/detail.html", {"request": request, "plant": plant}
    )
