from fastapi import APIRouter
from webapps.auth import route_login
from webapps.plants import route_plants
from webapps.users import route_users

api_router = APIRouter()

api_router.include_router(route_plants.router, prefix="", tags=["homepage"])
api_router.include_router(route_users.router, prefix="", tags=["users"])
api_router.include_router(route_login.router, prefix="", tags=["auth"])
