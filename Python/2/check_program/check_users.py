import pymysql

db = pymysql.connect(host="localhost",port = 3306,user="root",password="as sysdba",db="voltages_2018.11.20")
cursor= db.cursor()
a = input("The user you want to check: ")

sql = "select * from users_id where id_users_id = %s" %(a)
 
try:
    cursor.execute(sql)
    results = cursor.fetchall()
    
    for row in results:
        id_users_id = row[0]
        name_users_id = row[1]
        passwords_users_data = row[2]

    print("id = %s \nuser = %s \ndata = %s\n" %(id_users_id,name_users_id,passwords_users_data))
except:
    print("Error: unable to fetch data.")
finally:
    db.close()
    
        