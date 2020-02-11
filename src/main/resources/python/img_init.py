# -*- coding: utf-8 -*-
"""
Created on Sun Feb  2 21:17:08 2020

@author: SV
"""
import cv2 as cv
import numpy as np 


def narrowResizeImg(img_file,proportion):
    img = cv_imread(img_file)
    height,width=img.shape[:2] 
    res=cv.resize(img,(int(height/proportion),int(width/proportion)),interpolation=cv.INTER_AREA)
    return res

#用于中文路径的文件使用cv2读取
def cv_imread(file_path):
    q=np.fromfile(file_path,dtype=np.uint8)
    cv_img = cv.imdecode(np.fromfile(file_path,dtype=np.uint8),-1)
    return cv_img
    
def img_pretreatment(np_img):
     #归一化图像
    if len(np.shape(np_img)) != 2:
        np_img = cv.cvtColor(np_img, cv.COLOR_RGB2GRAY)
    result = np.zeros(np_img.shape, dtype=np.float32)
    cv.normalize(np_img, result, alpha=0, beta=1, norm_type=cv.NORM_MINMAX, dtype=cv.CV_32F)
    
    return result