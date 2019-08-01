import sqlite3
import os
os.chdir("E:\\大学资料\\Databases\\sqlite\\huaweidb")
conn=sqlite3.connect('huawei.db')
cursor = conn.cursor()
#conn.execute("")
#c=cursor.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name; ")
cursor.execute("select * from sqlite_master;")
value=cursor.fetchall()