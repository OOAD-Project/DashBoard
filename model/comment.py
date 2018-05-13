from sqlalchemy import Column, Integer, DateTime, String, JSON, create_engine, ForeignKey
from model import base

class Comment(base.Base):
    __tablename__ = "Comment"
    comment_id = Column(Integer, primary_key = True)
    content = Column(String(50), nullable = False)
    food_id = Column(Integer, ForeignKey('Food.id'))