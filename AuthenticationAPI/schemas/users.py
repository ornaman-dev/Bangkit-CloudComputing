# > schemas > users.py
# from typing import Optional # modul ini belum digunakan
from pydantic import BaseModel
from pydantic import EmailStr
from typing import Optional

# shared properties
class UserBase(BaseModel):
    id: Optional[int] = None
    name: Optional[str] = None
    email: Optional[str] = None
    password: Optional[str] = None
    # id_rec: Optional[str] = None

# Properti yang diperlukan saat membuat User baru
class UserCreate(BaseModel):
    name: str  # TODO ganti jadi name atau full_name
    email: EmailStr
    password: str
    # id_rec: str  # TODO tidak disajikan, tapi diatur di db menjadi automatic fill


# Menyajikan detail response sesuai kebutuhan (penyaringan respons Pydantic)
class ShowUser(BaseModel):
    id: str
    name: str  # TODO ganti jadi name atau full_name
    email: EmailStr

    class Config:  # memberi tahu pydantic untuk mengonversi objek non-dictionary menjadi json
        orm_mode = True
