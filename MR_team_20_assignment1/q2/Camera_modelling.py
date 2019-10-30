import numpy as np
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
import math
from PIL import Image,ImageDraw 
from numpy import linalg as LA
import cv2
img = Image.open('image.png')

l = 4.10
h = 1.38 
w = 1.51
x = [838,957,838,957,751,751]
y = [309,309,190,190,263,184]
#x = [955,955,837,837,751,751]
#y=[301,188,301,188,262,186]

X = [0,w,0,w,0,0,w,w]
Y = [0,0,h,h,0,h,0,h]
Z = [0,0,0,0,-l,-l,-l,-l]
#t = [[0.996,0,0.087],[0,1,0],[-0.087,0,0.996]]
#t=np.array(t)
#X = [0,0,0,0,w,w,w,w]
#Y = [0,0,h,h,h,h,0,0]
#Z = [0,l,0,l,0,l,0,l]
tm= []
tm.append(X)
tm.append(Y)
tm.append(Z)
#tm = np.dot(t,tm)
R = []
R.append(tm[0])
R.append(tm[1])
R.append(tm[2])
R.append([1]*8)
R = np.array(R)
#print(R.shape)
a =  []
for i in range(6):
    temp_x = []
    temp_y = []
    temp_x.append(-R[0][i])
    temp_x.append(-R[1][i])
    temp_x.append(-R[2][i])
    temp_x.append(-1)
    temp_x.append(0)
    temp_x.append(0)
    temp_x.append(0)
    temp_x.append(0)
    temp_x.append(x[i]*R[0][i])
    temp_x.append(x[i]*R[1][i])
    temp_x.append(x[i]*R[2][i])
    temp_x.append(x[i])

    temp_y.append(0)
    temp_y.append(0)
    temp_y.append(0)
    temp_y.append(0)
    temp_y.append(-R[0][i])
    temp_y.append(-R[1][i])
    temp_y.append(-R[2][i])
    temp_y.append(-1)
    temp_y.append(y[i]*R[0][i])
    temp_y.append(y[i]*R[1][i])
    temp_y.append(y[i]*R[2][i])
    temp_y.append(y[i])

    a.append(temp_x)
    a.append(temp_y)
a = np.array(a)
print(a)
u, s, vh = LA.svd(a)
p = vh[11,:]
p = np.array(p)
p = np.reshape(p,(3,4))
print(p)
r = np.dot(p,R)
for i in range(3):
    for j in range(8):
        r[i][j] = r[i][j]/r[2][j]
#r = np.divide(r,0.00101246)
#r = np.floor(r)

r = np.round(r)
r = r.astype(int)
print(r)
#px = img.load()
#print(px[0,0])

img = np.array(img)
print(img.shape)
#for i in range(8):
 #   img[r[1][i]][r[0][i]] = (21,255,8)
cv2.line(img,(r[0][0],r[1][0]),(r[0][1],r[1][1]),(21,255,8),3)
cv2.line(img,(r[0][3],r[1][3]),(r[0][1],r[1][1]),(21,255,8),3)
cv2.line(img,(r[0][2],r[1][2]),(r[0][3],r[1][3]),(21,255,8),3)
cv2.line(img,(r[0][0],r[1][0]),(r[0][2],r[1][2]),(21,255,8),3)
cv2.line(img,(r[0][4],r[1][4]),(r[0][5],r[1][5]),(21,255,8),3)
cv2.line(img,(r[0][7],r[1][7]),(r[0][5],r[1][5]),(21,255,8),3)
cv2.line(img,(r[0][6],r[1][6]),(r[0][7],r[1][7]),(21,255,8),3)
cv2.line(img,(r[0][6],r[1][6]),(r[0][4],r[1][4]),(21,255,8),3)
cv2.line(img,(r[0][0],r[1][0]),(r[0][4],r[1][4]),(21,255,8),3)
cv2.line(img,(r[0][2],r[1][2]),(r[0][5],r[1][5]),(21,255,8),3)
cv2.line(img,(r[0][6],r[1][6]),(r[0][1],r[1][1]),(21,255,8),3)
cv2.line(img,(r[0][7],r[1][7]),(r[0][3],r[1][3]),(21,255,8),3)
img = img.astype('uint8')
plt.imshow(img)
plt.show()
print(r)
