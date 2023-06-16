# main.py
from apis.base import api_router  #
from core.config import settings
from db.base import Base
from db.session import engine
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from starlette.middleware.cors import CORSMiddleware
from webapps.base import api_router as webapp_router

# from fastapi.middleware.httpsredirect import HTTPSRedirectMiddleware # Handle https


def include_router(app):
    app.include_router(api_router)  #
    app.include_router(webapp_router)


def configure_static(app):
    app.mount("/static", StaticFiles(directory="static"), name="static")


# to create our database tables
def create_tables():
    print("create_tables")
    Base.metadata.create_all(bind=engine)


def start_application():
    app = FastAPI(
        title=settings.PROJECT_NAME,
        description=settings.PROJECT_DESC,
        version=settings.PROJECT_VERSION,
        servers=settings.PROJECT_SERVER,
    )
    app.add_middleware(
        CORSMiddleware,
        allow_origins=settings.ORIGIN_DOMAIN_ALLOWED,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
    # app.add_middleware(HTTPSRedirectMiddleware) #handle https
    include_router(app)
    configure_static(app)
    create_tables()
    return app


app = start_application()
