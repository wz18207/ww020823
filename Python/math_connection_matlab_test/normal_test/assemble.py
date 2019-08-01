#测试线性代数表达以及常规线性参数表示。
import numpy as np
import math
def test_1():
    print(np.float32(1.0))
    print(np.int_([1, 2, 4]))
    print(np.arange(3, dtype=np.uint8))
    print(np.array([1, 2, 3], dtype='f'))
    print(np.arange(3, dtype=np.uint8).astype(float))
    print(np.int8())
if __name__=='__main__':
    test_1()