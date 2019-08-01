N = 1


def check_if_prime(N):
    for x in range(2, N):
        if N % x == 0:
            return False
        return True 
