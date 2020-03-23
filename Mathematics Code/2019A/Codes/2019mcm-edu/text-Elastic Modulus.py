import sys
import pymysql.cursors
import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
F_list=[];E_list=[]
def check_data():
    db = pymysql.connect(host = "localhost",port = 3306,user = "root",password = "",db="text-elastic-modulus")
    cur = db.cursor()
    sql_F = "select F from sheet1;"
    cur.execute(sql_F)
    results_F = cur.fetchall()
    global F_list
    for row in results_F:
        F_list.append(float(row[0]))
    print(F_list)
    sql_E= "select E from sheet1;"
    cur.execute(sql_E)
    results_E=cur.fetchall()
    global E_list
    for datas in results_E:
        E_list.append(float(datas[0]))
    print(E_list)
    plt.figure()
    plt.plot(F_list,E_list,'g')
    plt.show()
    db.commit()
    db.close()
if __name__=="__main__":
    check_data()