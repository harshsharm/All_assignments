import sys
import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import cv2 as cv 
from numpy import linalg as LA

#mapping the World points and image coordinates

tg = 0.1315 #tag_side_distance 
td = 0.0790#tag_to_tag_distance

World_coordinates=[[0,0],[tg,0],[tg,tg],[0,tg],
					 [td+tg,0],[td+2*tg,0],[td+2*tg,tg],
					 [td+tg,tg]]

image_coordinates=[[284.56243896, 149.2925415],[373.93179321, 128.26719666],
				   [387.53588867, 220.2270813],[281.29962158, 241.72782898],
				   [428.86453247, 114.50731659],[524.76373291, 92.09218597],
				   [568.3659668, 180.55757141],[453.60995483, 205.22370911]]

World_coordinates=np.array(World_coordinates)
image_coordinates=np.array(image_coordinates)
x=np.zeros(8)
y=np.zeros(8)
u=np.zeros(8)
v=np.zeros(8)

x=World_coordinates[:,0]
y=World_coordinates[:,1]
u=image_coordinates[:,0]
v=image_coordinates[:,1]
#print(x.shape)

svdMat=np.zeros((16,9))
for i in range(0,8):
	svdMat[2*i][0]=-1*x[i];svdMat[2*i][1]=-1*y[i]
	svdMat[2*i][2]=-1;svdMat[2*i][3]=0
	svdMat[2*i][4]=0;svdMat[2*i][5]=0
	svdMat[2*i][6]=x[i]*u[i];svdMat[2*i][7]=y[i]*u[i]
	svdMat[2*i][8]=u[i]

	svdMat[2*i+1][0]=0;svdMat[2*i+1][1]=0
	svdMat[2*i+1][2]=0;svdMat[2*i+1][3]=-1*x[i]
	svdMat[2*i+1][4]=-1*y[i];svdMat[2*i+1][5]=-1
	svdMat[2*i+1][6]=x[i]*v[i];svdMat[2*i+1][7]=y[i]*v[i]
	svdMat[2*i+1][8]=v[i]

u, s, vh =LA.svd(svdMat)

HomoMat=vh[8,:]
HomoMat=HomoMat.reshape(3,3)
print("HOMOGRAPHY MATRIX:-")
print(HomoMat)

img=Image.open('./image.png')
img=np.array(img)
z=np.ones((8,1))
World_coordinates=np.hstack([World_coordinates,z])

image2dPoints=np.dot(HomoMat,World_coordinates.T)
image2dPoints=image2dPoints.T
x=image2dPoints[:,0]
y=image2dPoints[:,1]
z=image2dPoints[:,2]
x=x/z
y=y/z
#print(y)
plt.imshow(img)
plt.scatter(x,y)

k=[[406.952636, 0.000000, 366.184147],
   [0.000000, 405.671292, 244.705127],
   [0.000000, 0.000000, 1.000000]]

kInverse=np.linalg.inv(k)
temp=np.dot(kInverse,HomoMat)
temp=temp.T
r1=temp[:,0]
r2=temp[:,1]
translationalMatrix=temp[:,2]
r3=np.cross(r1,r2)
rotationalMatrix=np.vstack((r1,r2))
rotationalMatrix=np.vstack((rotationalMatrix,r3))
u, s, vh =LA.svd(rotationalMatrix)
vh=vh.T
rotationalMatrix=np.dot(u,vh)
print("ROTATIONAL MATRIX:-")
print(rotationalMatrix)
print("TRANSLATIONAL MATRIX:-")
print(translationalMatrix)
plt.show()
