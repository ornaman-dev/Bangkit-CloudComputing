from typing import Any

from sqlalchemy.orm import as_declarative
from sqlalchemy.orm import declared_attr

# from sqlalchemy.ext.declarative import as_declarative, declared_attr // MovedIn20Warning: The ``as_declarative()`` function is now available as sqlalchemy.orm.as_declarative() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)@as_declarative()


@as_declarative()
class Base:
    id: Any
    __name__: str

    # to generate table_name from class_name
    @declared_attr
    def __tablename__(cls) -> str:
        return cls.__name__.lower()
