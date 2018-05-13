from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from model import base
from model import db_setting
from model import tag, food, comment, reservation

def init_database():
    Base = base.Base
    # 初始化数据库连接:
    engine = create_engine(db_setting.DB_URI)
    # 创建DBSession类型:
    DBSession = sessionmaker(bind = engine)
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
    # 创建session对象:
