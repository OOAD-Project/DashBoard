from sqlalchemy import Column, Integer, String
from model import base


class Tag(base.Base):
    __tablename__ = "Tag"
    id = Column(Integer, primary_key = True)
    description = Column(String(50))
    picture = Column(String(50))

