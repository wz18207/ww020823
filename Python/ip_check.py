import socket
ip_list = []
def get_ip_list(domain):
            global ip_list
            try:
                addrs = socket.getaddrinfo(domain, None)
                for item in addrs:
                    if item[4][0] not in ip_list:
                        ip_list.append(item[4][0])
            except Exception as e:
                print(str(e))
                pass
            return ip_list
if __name__ == "__main__":
    get_ip_list('www.fromsoftware.jp')
    print(ip_list)