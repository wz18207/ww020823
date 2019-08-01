import numpy as np
from scipy import optimize

def line_progress():

    # max Z=x+y
    # subject to :
    #       （1）2y+x<=6
    #       （2）y+2x<=6
    #       （3）x>=0,y>=0
    #       最大值是（1）和（2）的交点，max：Z=2+2=4

    # Z=x+y : 最大化系数max_coe_z=[1,1]转化成最小化系数min_coe_z=-[1,1]，添加负值
    min_coe_z = - np.array([1, 1])
    # 不等式中的系数（The coefficient of subject to in the inequality）
    coe_st_ub = np.array([[2, 1], [1, 2]])
    # 不等式中约束值（The value of subject to in the inequality）
    value_st_ub = np.array([6, 6])
    # 不等式中的变量（Constrained variables of inequality）
    var1_st, var2_st = (0, None), (0, None)
    # 优化的结果（The result of optimize）
    line_result = optimize.linprog(min_coe_z, A_ub=coe_st_ub, b_ub=value_st_ub, bounds=(var1_st, var2_st))

    # 如果找到最小值输出最小值，返回True
    if line_result.success:
        # 最小值的变量
        print("线性规划最小值的变量：")
        print(line_result.x)
        # 最小值
        print("线性规划最小值：")
        print(line_result.fun)
        # 最大值
        print("线性规划最大值：")
        print(-line_result.fun)
    else:
        print("找不到线性规划最小值。")


if __name__ == '__main__':
    line_progress()