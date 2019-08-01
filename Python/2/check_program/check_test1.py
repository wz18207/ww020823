import pymysql

db = pymysql.connect(host="localhost",port = 3306,user="root",password="as sysdba")
cursor= db.cursor()
a = str(input("The user you want to check:"))

sql = "select * from `voltages_2018.11.20`.test1 where users_test1 = %s;"%(a)

try:
    cursor.execute(sql)
    results = cursor.fetchall()
    print(results)
    for row in results:
        id_test1= row[0]
        format_test1 = row[1]
        time_test1 = row[2]

    print("id = %s \nuser = %s \ndata = %s\n " %(id_test1,format_test1,time_test1))
except:
    print("Error: unable to fetch data.")
finally:
    "show database;"
    db.close()
    
        