import pymysql

db = pymysql.connect(host="localhost",port = 3306,user="root",password="as sysdba",db="voltages_2018.11.20")
cursor= db.cursor()
a = input("The user you want to check: ")

sql = "select * from users_data where users_data_data = %s;"%(a)

try:
    cursor.execute(sql)
    results = cursor.fetchall()
    
    for row in results:
        id_users_data = row[0]
        users_users_data = row[1]
        datas_users_data = row[2]

    print("id = %s \nuser = %s \ndata = %s \n" %(id_users_data,users_users_data,datas_users_data))
except:
    print("Error: unable to fetch data.")
finally:
    db.close()