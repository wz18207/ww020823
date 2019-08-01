import tensorflow as tf
a = tf.random_normal((100, 100))
b = tf.random_normal((100, 500))
c = tf.matmul(a, b)
sess = tf.InteractiveSession()
print(sess)
print(sess.run(c))

import os
from tensorflow.python.client import device_lib

os.environ["TF_CPP_MIN_LOG_LEVEL"] = "99"

if __name__ == "__main__":
    print(device_lib.list_local_devices())
