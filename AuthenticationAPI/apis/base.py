# apis > base.py
# from apis.version1 import route_general_pages    # tidak digunakan setelah implementasi webapps.base
from apis.version1 import route_login  # for login authentication
from apis.version1 import route_plants
from apis.version1 import route_users
from fastapi import APIRouter

api_router = APIRouter()
# api_router.include_router(
#     route_general_pages.general_pages_router, prefix="", tags=["general_pages"]
# )
api_router.include_router(route_users.router, prefix="/users", tags=["users"])
api_router.include_router(route_plants.router, prefix="/plants", tags=["plants"])
api_router.include_router(
    route_login.router, prefix="/login", tags=["login"]
)  # for login authentication
