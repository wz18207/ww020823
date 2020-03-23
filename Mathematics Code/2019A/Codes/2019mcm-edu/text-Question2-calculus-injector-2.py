import sys
import pymysql.cursors
import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
ms_list=[];mm_list=[]
def check_data():
    db = pymysql.connect(host = "localhost",port = 3306,user = "root",password = "",db="text-elastic-modulus")
    cur = db.cursor()
    sql_ms = "select 2_ms from sheet1_injector_2;"
    cur.execute(sql_ms)
    results_ms = cur.fetchall()
    global ms_list
    for row in results_ms:
        ms_list.append(float(row[0]))
    print(ms_list)
    sql_mm= "select 2_mm from sheet1_injector_2;"
    cur.execute(sql_mm)
    results_mm=cur.fetchall()
    global mm_list
    for datas in results_mm:
        mm_list.append(float(datas[0]))
    print(mm_list)
    plt.figure()
    plt.plot(ms_list,mm_list,'g')
    plt.show()
    db.commit()
    db.close()
if __name__=="__main__":
    check_data()