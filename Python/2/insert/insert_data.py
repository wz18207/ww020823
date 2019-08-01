import sys
def choose_task():
    while (True):
        print("0.Exit.")
        print("1. Input datas.")
        print("2. Output datas into cmd.")
        a = int(input("select_task:"))
        if a == 1:
            input_data()
        elif a == 2:
            output()
        elif a == 0:
            exit()
def input_data():
    import pymysql
    db = pymysql.connect(host="localhost",port = 3306,user="root",password="as sysdba")
    cur = db.cursor()
    a_a = input("The data:")
    sql_insert = "insert into `voltages_2018.11.20`.users_data values(null,now(6),'{%s}');"%(a_a)
    cur.execute(sql_insert)
    db.commit()
    print("The data we are correct input into the database.")
    db.close()
def output():
    import pymysql
    import pymysql.cursors
    db = pymysql.connect(host = "localhost",port = 3306,user = "root",password = "as sysdba")
    cur = db.cursor()      
    try:
        with cur as cursor:
            sql = "select * from `voltages_2018.11.20`.users_data;"
            cursor.execute(sql)
            result=cursor.fetchall() 
            for i in result:
                 print(str(i[0])+"      "+str(i[1]))
                 print(" ")
    finally:
        db.commit()
    db.close()
choose_task()