#-*- coding: utf-8 -*-
import numpy as np

from scipy import io as spio
from matplotlib import pyplot as plt
from scipy import optimize
from matplotlib.font_manager import FontProperties
font = FontProperties(fname=r"c:\windows\fonts\simsun.ttc", size=14)    
#Solve windows error codes situations.

from sklearn import datasets
from sklearn.preprocessing import StandardScaler
import time

def neuralNetwork(input_layer_size,hidden_layer_size,out_put_layer):
    data_img = loadmat_data("data_digits.mat")
    X = data_img['X']
    y = data_img['y']
    '''scaler = StandardScaler()
    scaler.fit(X)
    X = scaler.transform(X)'''  
    m,n = X.shape  
    """digits = datasets.load_digits()
    X = digits.data
    y = digits.target
    m,n = X.shape
    scaler = StandardScaler()
    scaler.fit(X)
    X = scaler.transform(X)"""
    rand_indices = [t for t in [np.random.randint(x-x, m) for x in range(100)]] 
    display_data(X[rand_indices,:])     
    #nn_params = np.vstack((Theta1.reshape(-1,1),Theta2.reshape(-1,1)))
    Lambda = 1
    initial_Theta1 = randInitializeWeights(input_layer_size,hidden_layer_size)
    initial_Theta2 = randInitializeWeights(hidden_layer_size,out_put_layer)
    initial_nn_params = np.vstack((initial_Theta1.reshape(-1,1),initial_Theta2.reshape(-1,1)))  
    #np.savetxt("testTheta.csv",initial_nn_params,delimiter=",")
    start = time.time()
    result = optimize.fmin_cg(nnCostFunction, initial_nn_params, fprime=nnGradient, args=(input_layer_size,hidden_layer_size,out_put_layer,X,y,Lambda), maxiter=100)
    print (u'loading time:',time.time()-start)
    print (result)
    '''visible parts'''
    length = result.shape[0]
    Theta1 = result[0:hidden_layer_size*(input_layer_size+1)].reshape(hidden_layer_size,input_layer_size+1)
    Theta2 = result[hidden_layer_size*(input_layer_size+1):length].reshape(out_put_layer,hidden_layer_size+1)    
    display_data(Theta1[:,1:length])
    display_data(Theta2[:,1:length])
    '''predition'''
    p = predict(Theta1,Theta2,X)
    print (u"The process of the prediction."%np.mean(np.float64(p == y.reshape(-1,1))*100))    
    res = np.hstack((p,y.reshape(-1,1)))
    np.savetxt("predict.csv", res, delimiter=',')

#Load .mat files
def loadmat_data(fileName):
    return spio.loadmat(fileName)
#Show 100 numbers
def display_data(imgData):
    sum = 0
    '''Show 100 numbers and put them into a second demension plannets
    and let them into a visible palntforms.'''
    m,n = imgData.shape
    width = np.int32(np.round(np.sqrt(n)))
    height = np.int32(n/width)
    rows_count = np.int32(np.floor(np.sqrt(m)))
    cols_count = np.int32(np.ceil(m/rows_count))
    pad = 1
    display_array = -np.ones((pad+rows_count*(height+pad),pad+cols_count*(width+pad)))
    for i in range(rows_count):
        for j in range(cols_count):
            if sum >= m: 
                #Outside the rage and stop the cycles.
                break
            display_array[pad+i*(height+pad):pad+i*(height+pad)+height,pad+j*(width+pad):pad+j*(width+pad)+width] = imgData[sum,:].reshape(height,width,order="F")    
            # oreer-F to show which coding in the ist lines.
            sum += 1
        if sum >= m:  
            #Outside the rage and stop the cycles.
            break
    plt.imshow(display_array,cmap='gray')  #Show the graddy graph.
    plt.axis('off')
    plt.show()
#Function of showing functions.
def nnCostFunction(nn_params,input_layer_size,hidden_layer_size,num_labels,X,y,Lambda):
    length = nn_params.shape[0] 
    # Show the lenth of theta.
    # Return the length of theta1 and theta2.
    Theta1 = nn_params[0:hidden_layer_size*(input_layer_size+1)].reshape(hidden_layer_size,input_layer_size+1)
    Theta2 = nn_params[hidden_layer_size*(input_layer_size+1):length].reshape(num_labels,hidden_layer_size+1)
    # np.savetxt("Theta1.csv",Theta1,delimiter=',')
    m = X.shape[0]
    class_y = np.zeros((m,num_labels))      
    #To reflact the number of 0-9.
    # Y's reflections.
    for i in range(num_labels):
        class_y[:,i] = np.int32(y==i).reshape(1,-1)
        # reshapr(-1,1)could load the numbers.
    '''Get off the 1st line of theta1 and theta2 and do in the "+" part in the ist lines.'''    
    Theta1_colCount = Theta1.shape[1]    
    Theta1_x = Theta1[:,1:Theta1_colCount]
    Theta2_colCount = Theta2.shape[1]    
    Theta2_x = Theta2[:,1:Theta2_colCount]
    #if it is "+" then do theta^2
    term = np.dot(np.transpose(np.vstack((Theta1_x.reshape(-1,1),Theta2_x.reshape(-1,1)))),np.vstack((Theta1_x.reshape(-1,1),Theta2_x.reshape(-1,1)))) 
    '''Do in the right hand side. And we have to append into each line of "bias" in the side 1.'''
    a1 = np.hstack((np.ones((m,1)),X))      
    z2 = np.dot(a1,np.transpose(Theta1))    
    a2 = sigmoid(z2)
    a2 = np.hstack((np.ones((m,1)),a2))
    z3 = np.dot(a2,np.transpose(Theta2))
    h  = sigmoid(z3)    
    '''Reactions'''    
    J = -(np.dot(np.transpose(class_y.reshape(-1,1)),np.log(h.reshape(-1,1)))+np.dot(np.transpose(1-class_y.reshape(-1,1)),np.log(1-h.reshape(-1,1)))-Lambda*term/2)/m   
    #temp1 = (h.reshape(-1,1)-class_y.reshape(-1,1))
    #temp2 = (temp1**2).sum()
    #J = 1/(2*m)*temp2
    return np.ravel(J)
# Gradient.
def nnGradient(nn_params,input_layer_size,hidden_layer_size,num_labels,X,y,Lambda):
    length = nn_params.shape[0]
    Theta1 = nn_params[0:hidden_layer_size*(input_layer_size+1)].reshape(hidden_layer_size,input_layer_size+1).copy()   
    # We have to use copy functions in order not to change the word under the lines.
    Theta2 = nn_params[hidden_layer_size*(input_layer_size+1):length].reshape(num_labels,hidden_layer_size+1).copy()
    m = X.shape[0]
    class_y = np.zeros((m,num_labels))      
    #datas from 0-9 reflect into 0/1.    
    # Y's reflections.
    for i in range(num_labels):
        class_y[:,i] = np.int32(y==i).reshape(1,-1) # attention:reshaape must in (-1,1)ֵ
    '''Get out theta1 and theta2 from the 1st line. And the right line from 1.'''
    Theta1_colCount = Theta1.shape[1]    
    Theta1_x = Theta1[:,1:Theta1_colCount]
    Theta2_colCount = Theta2.shape[1]    
    Theta2_x = Theta2[:,1:Theta2_colCount]
    Theta1_grad = np.zeros((Theta1.shape))  #1st floor to 2nd floor of these weight.
    Theta2_grad = np.zeros((Theta2.shape))  #2nd floor to 3rd floor of their weight.
    '''Do in the right hand side. And we have to append into each line of "bias" in the side 1.'''
    a1 = np.hstack((np.ones((m,1)),X))
    z2 = np.dot(a1,np.transpose(Theta1))
    a2 = sigmoid(z2)
    a2 = np.hstack((np.ones((m,1)),a2))
    z3 = np.dot(a2,np.transpose(Theta2))
    h  = sigmoid(z3)
    '''Do in the left hand side.And detla will be a differentations.'''
    delta3 = np.zeros((m,num_labels))
    delta2 = np.zeros((m,hidden_layer_size))
    for i in range(m):
        #delta3[i,:] = (h[i,:]-class_y[i,:])*sigmoidGradient(z3[i,:])  
        # percents of the average differentations
        delta3[i,:] = h[i,:]-class_y[i,:]                              
        # The percents of the Cross Entropy
        Theta2_grad = Theta2_grad+np.dot(np.transpose(delta3[i,:].reshape(1,-1)),a2[i,:].reshape(1,-1))
        delta2[i,:] = np.dot(delta3[i,:].reshape(1,-1),Theta2_x)*sigmoidGradient(z2[i,:])
        Theta1_grad = Theta1_grad+np.dot(np.transpose(delta2[i,:].reshape(1,-1)),a1[i,:].reshape(1,-1))
    Theta1[:,0] = 0
    Theta2[:,0] = 0          
    '''Gradient'''
    grad = (np.vstack((Theta1_grad.reshape(-1,1),Theta2_grad.reshape(-1,1)))+Lambda*np.vstack((Theta1.reshape(-1,1),Theta2.reshape(-1,1))))/m
    return np.ravel(grad)
# function of "S"  
def sigmoid(z):
    h = np.zeros((len(z),1))    # Get it in the same line-lengths of "Z"
    h = 1.0/(1.0+np.exp(-z))
    return h
# defferentations in function "S"
def sigmoidGradient(z):
    g = sigmoid(z)*(1-sigmoid(z))
    return g
# Randomly restart the weight of theta.
def randInitializeWeights(L_in,L_out):
    W = np.zeros((L_out,1+L_in))    
    # Incheck into the weight of theta.
    epsilon_init = (6.0/(L_out+L_in))**0.5
    W = np.random.rand(L_out,1+L_in)*2*epsilon_init-epsilon_init 
    # np.random.rand(L_out,1+L_in)
    return W
# Check the correct of the gardient in calculations.
def checkGradient(Lambda = 0):
    '''To make BP nerve-net'''
    input_layer_size = 3
    hidden_layer_size = 5
    num_labels = 3
    m = 5
    initial_Theta1 = debugInitializeWeights(input_layer_size,hidden_layer_size)
    initial_Theta2 = debugInitializeWeights(hidden_layer_size,num_labels)
    X = debugInitializeWeights(input_layer_size-1,m)
    y = np.transpose(np.mod(np.arange(1,m+1), num_labels))
    y = y.reshape(-1,1)
    nn_params = np.vstack((initial_Theta1.reshape(-1,1),initial_Theta2.reshape(-1,1)))  
    #Shows the theta.
    '''Use BP to solve gasrdient.'''
    grad = nnGradient(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, Lambda)  
    '''Use number-calculations to solve gardient.'''
    num_grad = np.zeros((nn_params.shape[0]))
    step = np.zeros((nn_params.shape[0]))
    e = 1e-4
    for i in range(nn_params.shape[0]):
        step[i] = e
        loss1 = nnCostFunction(nn_params-step.reshape(-1,1), input_layer_size, hidden_layer_size, num_labels, X, y, Lambda)
        loss2 = nnCostFunction(nn_params+step.reshape(-1,1), input_layer_size, hidden_layer_size, num_labels, X, y, Lambda)
        num_grad[i] = (loss2-loss1)/(2*e)
        step[i]=0
    # Shows the differentations of two functions.
    res = np.hstack((num_grad.reshape(-1,1),grad.reshape(-1,1)))
    print("Check these two results.")
    print (res)
# Restart the weight of theta.
def debugInitializeWeights(fan_in,fan_out):
    W = np.zeros((fan_out,fan_in+1))
    x = np.arange(1,fan_out*(fan_in+1)+1)
    W = np.sin(x).reshape(W.shape)/10
    return W
# Predictions.
def predict(Theta1,Theta2,X):
    m = X.shape[0]
    num_labels = Theta2.shape[0]
    #p = np.zeros((m,1))
    '''Result perdictions in right hand sides.'''
    X = np.hstack((np.ones((m,1)),X))
    h1 = sigmoid(np.dot(X,np.transpose(Theta1)))
    h1 = np.hstack((np.ones((m,1)),h1))
    h2 = sigmoid(np.dot(h1,np.transpose(Theta2)))
    '''Return the maximum h in every line.
        - np.max(h, axis=1) is to return the max_wave of the h numbers.
        - Lately we find the most-percent of number "h" in which lines.
    '''
    #np.savetxt("h2.csv",h2,delimiter=',')
    p = np.array(np.where(h2[0,:] == np.max(h2, axis=1)[0]))  
    for i in np.arange(1, m):
        t = np.array(np.where(h2[i,:] == np.max(h2, axis=1)[i]))
        p = np.vstack((p,t))
    return p    

if __name__ == "__main__":
    checkGradient()
    neuralNetwork(400, 25, 10)