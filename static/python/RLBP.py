# -*- coding: utf-8 -*-
"""
Created on Fri Apr  5 22:12:44 2019

@author: SV
"""
import math
import numpy as np 
import cv2 as cv


def submatrix(matr,arr1,arr2):
   
    t = matr[arr1]
    t = t[:,arr2]
    return t


def rlbp(np_img,radius,neighbors):
    d_image = np_img.astype(np.float64)
    spoints=np.zeros((neighbors,2))

    # Angle step.
    a = (2*math.pi)/neighbors #角度步长，360度/邻点个数=每一点所占角度
    
    #圆上每一个点的坐标
    
    for i in range(0,neighbors):
        spoints[i][0] = -radius*math.sin(i*a)
        spoints[i][1] = radius*math.cos(i*a)
        
    (ysize,xsize) = np.shape(np_img)
#    print(f'ysize:{ysize},xsize:{xsize}')


    miny=spoints[:,0].min(axis=0)
    maxy=spoints[:,0].max(axis=0)
    minx=spoints[:,1].min(axis=0)
    maxx=spoints[:,1].max(axis=0)
    
    
    # Block size, each LBP code is computed within a block of size bsizey*bsizex
    #块大小，每个lbp码在大小为bsize*bsizex的块中计算
    
    bsizey=math.ceil(max(maxy,0))-math.floor(min(miny,0))+1 #半径为 1 时 bsizey = 3
    bsizex=math.ceil(max(maxx,0))-math.floor(min(minx,0))+1 #半径为 1 时 bsizex = 3
    
    
    
    # Coordinates of origin (0,0) in the block
    #块中的原点坐标（0,0）
    origy=1-math.floor(min(miny,0))
    origx=1-math.floor(min(minx,0))
    
#    print(f'origy:{origy},origx:{origx}')
    # Minimum allowed size for the input image depends
    # on the radius of the used LBP operator.
    #输入图像的最小允许大小取决于使用的lbp运算符的半径。
# =============================================================================
#     半径为 1 由公式可得 1-(-1)+1 = 3 图像至少需要为3*3
# =============================================================================
    if xsize < bsizex or ysize < bsizey :
      print('Too small input image. Should be at least (2*radius+1) x (2*radius+1)')
    
    
    # Calculate dx and dy;
    #差值 图像需要从满足半径大小位置处开始计算 
    dx = xsize - bsizex
    dy = ysize - bsizey
#    print(f'dx:{dx},dy:{dy}')
    # Fill the center pixel matrix C.
    #填充中心像素矩阵c。即我们计算开始的矩阵，因为需要满足半径大小，所以要把边缘去掉
    C=submatrix(np_img,range(origy,origy+dy),range(origx,origx+dx))
    
    
 #     C = image(origy:origy+dy,origx:origx+dx) 这是在matlab中的相同操作
    

    
    d_C = C.astype(np.float64)
    
    bins = 2**neighbors
    valMax = np.zeros(np.shape(C),dtype='float64')
    # Initialize the result matrix with zeros.
    RLBP=np.zeros((dy,dx))
    maxIdx = np.zeros(np.shape(C),dtype='float64')
    
    #Compute the LBP code image
    D=[]
    for i in range(0,neighbors):
      y = spoints[i,0]+origy
      x = spoints[i,1]+origx
      # Calculate floors, ceils and rounds for the x and y.
      fy = int(math.floor(y))
      cy = int(math.ceil(y))
      ry = int(round(y))
      fx = int(math.floor(x))
      cx = int(math.ceil(x))
      rx = int(round(x))
      # Check if interpolation is needed.
      #检查是否需要插值。
      if abs(x - rx) < 1e-6 and abs(y - ry) < 1e-6:
        # Interpolation is not needed, use original datatypes
        #N = d_image(ry:ry+dy,rx:rx+dx);
        N = submatrix(d_image,list(range(ry,ry+dy)),list(range(rx,rx+dx)))
        D.append(N >= d_C)   
        cDif= (N - d_C) 
      else:
        # Interpolation needed, use double type images 
        ty = y - fy
        tx = x - fx
    
        # Calculate the interpolation weights.
        w1 = (1 - tx) * (1 - ty)
        w2 =      tx  * (1 - ty)
        w3 = (1 - tx) *      ty 
        w4 =      tx  *      ty 
        # Compute interpolated pixel values
        N = w1*submatrix(d_image,range(fy,fy+dy),range(fx,fx+dx))+w2*submatrix(d_image,range(fy,fy+dy),range(cx,cx+dx))+w3*submatrix(d_image,range(cy,cy+dy),range(fx,fx+dx))+w4*submatrix(d_image,range(cy,cy+dy),range(cx,cx+dx))
        
        
    
        
        cDif= (N - d_C)
        D.append(N >= d_C)
    # Update the dominant direction index is the absolute difference is 
    # larger than the previous maximum
      absDif = abs(cDif);
      curIds = absDif > valMax;
      maxIdx[curIds] = i; 
      valMax[curIds] = absDif[curIds];  
      # Compute the rotated features with respect to the index of dominant
      # direction
    for i in range(0,neighbors):
      # Update the result matrix
      v = 2**(((i-maxIdx)+neighbors) % neighbors);
      RLBP = RLBP + v*D[i];
 #   tempRLPB=RLBP.astype(np.uint8)  
 #   cv.imshow("RLBPimg",tempRLPB)
 #   cv.waitKey(0)
 #   cv.destroyAllWindows() 
    RLBP=np.histogram(RLBP.flatten(),list(range(0,bins+1)));
    RLBP=RLBP[0]/np.sum(RLBP[0])
    return RLBP

