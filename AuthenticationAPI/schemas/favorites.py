from pydantic import BaseModel


class FavoriteBase(BaseModel):
    fav_id = str
    user_fav_id = str
    plant_fav_id = str


class AddFavoritePlant(FavoriteBase):
    fav_id = str
    user_fav_id = str
    plant_fav_id = str


class Config:  # to convert non dict obj to json
    orm_mode = True
