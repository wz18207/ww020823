import sys
def choose_task():
    while (True):
        print("0.Exit.")
        print("1. Input datas.")
        print("2. Output datas into cmd.")
        a = int(input("select_task:"))
        if a == 1: input_data()
        elif a == 2: output()
        elif a == 0:exit()
def input_data():
    import pymysql
    c = []
    a = input("put:")
    c = c.append(a)
    a = a.split(",")
    a = list(map(float,a))
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba")
    cur = db.cursor()
    cur.execute('use bp_test;')
    for i in range(0, len(a)):
        cur.execute("insert into bp_data (id_bp,data_bp) values(%s,%s);",(i+1,a[i]))
def output():
    import pymysql.cursors
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba")
    cur = db.cursor()
    cur.execute('use bp_test;')
    with cur as cursor:
        cd = input("The line you want to get:")
        cursor.execute("select * from bp_data where id_bp = %s;",(cd))
        result=cursor.fetchall()
        for k in result:
            print(str(k[0]) + "         " + str(k[1]))
    db.commit()
    db.close()
if __name__ == '__main__':
    choose_task()
