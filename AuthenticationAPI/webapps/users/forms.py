# webapps > users > forms.py
from typing import List
from typing import Optional

from fastapi import Request


class UserCreateForm:
    def __init__(self, request: Request):
        self.request: Request = request
        self.errors: List = []
        self.name: Optional[str] = None
        self.email: Optional[str] = None
        self.password: Optional[str] = None

    async def load_data(self):
        form = await self.request.form()
        self.name = form.get("name")
        self.email = form.get("email")
        self.password = form.get("password")

    async def is_valid(self):
        if not self.name or not len(self.name) > 4:
            self.errors.append("Name must be > 4 chars")
        if not self.email or not (self.email.__contains__("@")):
            self.errors.append("Valid email is required")
        if not self.password or not len(self.password) > 5:
            self.errors.append("Password should be > 6 chars")
        if not self.errors:
            return True
        return False
