import sys
def choose_task():
    while (True): 
        print("0.Exit.")
        print("1. Input datas.")
        print("2. Output datas into cmd.")
        a = int(input("select_task:"))
        if a == 1: input_data()
        elif a == 2: output_cmd()
        elif a == 0:exit()

def input_data():
    import pymysql
    db = pymysql.connect(host="localhost",port = 3306,user="root",password="as sysdba")
    cur = db.cursor()
    a_a = input("The data:")
    cur.execute( "insert into `voltages_2018.11.20`.test1 values(null,now(6),'{%s}');"%(a_a))
    db.commit()
    print("The data we are correct input into the database.")
    db.close()
def output_cmd():
    import pymysql
    import pymysql.cursors
    db = pymysql.connect(host = "localhost",port = 3306,user = "root",password = "as sysdba")
    cur = db.cursor()      
    try:
        with cur as cursor:
            cursor.execute("select time_test1,data_test1 from `voltages_2018.11.20`.test1;")
            result=cursor.fetchall() 
            print('The infromation of the data.')
            print('         TimeStamp'+"                 "+"Datas")
            for i in result:
                print(str(i[0])+"      "+str(i[1]))
    finally:
        db.commit()
    db.close()

if __name__ == '__main__':
    choose_task()