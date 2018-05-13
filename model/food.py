from sqlalchemy import Column, Integer, String, ForeignKey
from model import base

class Food(base.Base):
    __tablename__ = "Food"
    id = Column(Integer, primary_key = True)
    name = Column(String(50), unique = True, nullable = False)
    picture = Column(String(50))
    price = Column(Integer, nullable = False)
    description = Column(String(50))
    rating = Column(Integer)
    amount = Column(Integer, nullable = False)
    tag_id = Column(Integer, ForeignKey('Tag.id'), nullable = False)