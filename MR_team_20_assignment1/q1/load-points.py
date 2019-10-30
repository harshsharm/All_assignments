import sys
import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import matplotlib.image as mpimg


def load_velodyne_points(points_path):
    points = np.fromfile(points_path, dtype=np.float32).reshape(-1, 4)
    points = points[:,:3]                # exclude reflectance values, becomes [X Y Z]
    points = points[0::5,:]              # remove every 5th point for display speed (optional)
    points = points[(points[:,0] > 5)]  # remove all points behind image plane (approximate)
    return points
    

if __name__ == '__main__':
    
    points = load_velodyne_points('lidar-points.bin')
    img=Image.open('./image.png')
    img=np.array(img)

    #print(points.shape)
    
    calibrationMatrix=[[721.53,0,609.55],[0,721.53,172.85],[0,0,1]]
    rotationMatrix=[[0,-1,0,0.06],[0,0,-1,-0.08],[1,0,0,-0.27]]
    
    calibrationMatrix=np.array(calibrationMatrix)
    rotationMatrix=np.array(rotationMatrix)
    
    points=points.T
    onePading=np.ones(6951)
    newPoints=np.vstack([points,onePading])
    #print(newPoints.shape)
    temp=np.dot(calibrationMatrix,rotationMatrix)
    finalPoints=np.dot(temp,newPoints)
    #print(finalPoints.shape)
    finalPoints=finalPoints.T    
    #print(finalPoints.shape)
    x=finalPoints[:,0]
    y=finalPoints[:,1]
    z=finalPoints[:,2]
    x=x/z
    y=y/z
    #print(np.max(z))
    plt.imshow(img)
    plt.scatter(x,y,s=2,c=100/z)
    plt.show()
