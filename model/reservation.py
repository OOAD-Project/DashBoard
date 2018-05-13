from sqlalchemy import Column, Integer, DateTime, String, JSON, create_engine, ForeignKey
import datetime
from model import base

class Reservation(base.Base):
    __tablename__ = "Reservation"
    reserve_id = Column(Integer, primary_key = True)
    reserve_datetime = Column(DateTime, default = datetime.datetime.now())
    pay_datetime = Column(DateTime, default = datetime.datetime.now())
    table_num = Column(Integer, nullable = False)
    food_list = Column(JSON)
