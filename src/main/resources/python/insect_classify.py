# -*- coding: utf-8 -*-
"""
Created on Sat Feb  1 19:43:05 2020

@author: SV
"""
import os
import numpy as np
import ProCRC
import img_init as init
folder = "../../../insect"
def imgReader(file_dir):
   
    dir_list=[]
    file_list=[]
    for root,dirs,files in os.walk(file_dir):
        root=root.replace("\\","/")
        dir_list.append(root)
        if(dirs):
            file_list.append(dirs)
        else:
            file_list.append(files)
    
    order_list = file_list[0]
    file_list = [0]*len(order_list)
    for i in range(0, len(order_list)):
        file_list[i] = []
        for root, dirs, files in os.walk(f'{folder}/{order_list[i]}'):
            if(files):
                for file in files:
                    file = f'{root}/{file}'
                    file = file.replace("\\","/")
                    file_list[i].append(file)
    
    img_list=[]
    class_list=[]
    
    for i in order_list:
        class_list.append(i)
            
    for i in range(0,len(order_list)):
        img_temp=[]
        for j in range(len(file_list[i])):
            print(file_list[i][j])
            img_temp.append(init.img_pretreatment(init.narrowResizeImg(file_list[i][j],4)))
        img_list.append(img_temp)
        
    return img_list, order_list


imglist, order_list = imgReader(folder)

exDATA = []
tr_label = []
for i in range(len(imglist)):
    for j in range(len(imglist[i])):
        tr_label.append(i+1)
        temp1 = RLBP.rlbp(imglist[i][j], 1, 8)
        temp2 = RLBP.rlbp(imglist[i][j], 2, 8)
        temp3 = RLBP.rlbp(imglist[i][j], 3, 8)
        temp = np.concatenate((temp1,temp2),axis=0)
        temp = np.concatenate((temp,temp3),axis=0)
 #       temp=rlbp.rlbp(imglist[i][j],1,8)
        exDATA.append(temp)

DATA = np.array(exDATA)
tr_num = len(exDATA)
classnum = len(imglist)

(tr_descr,massimo,minimo)= ProCRC.mynormalize_TR(DATA)
T = ProCRC.OutPut_T(tr_descr, tr_label, classnum, tr_num)

np.save("massimo",massimo)
np.save("minimo",minimo)
np.save("T",T)
np.save("tr_descr",tr_descr)
np.save("tr_label",tr_label)
np.save("classnum",classnum)
np.save("order_list",order_list)














