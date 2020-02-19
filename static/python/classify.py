# -*- coding: utf-8 -*-
"""
Created on Sun Feb  2 21:13:34 2020

@author: SV
"""
import numpy as np 
import img_init as init
import ProCRC
import sys
import RLBP

path = sys.argv[2]
print(path)
massimo = np.load(path+'massimo.npy') 
minimo = np.load(path+'minimo.npy') 
T = np.load(path+'T.npy')
tr_descr = np.load(path+"tr_descr.npy")
tr_label = np.load(path+"tr_label.npy")
classnum = np.load(path+"classnum.npy")
order_list = np.load(path+"order_list.npy")


test_file = sys.argv[1]
#test_file = "D:/eclipse-workspace/demo/insect/鳞翅目/尺蛾科/unKnowGenus/卫矛尺蠖/卫矛尺蠖003.jpg"
test_file = test_file.replace("\\","/")
test_file = init.img_pretreatment(init.narrowResizeImg(test_file,4))

temp1 = RLBP.rlbp(test_file, 1, 8)
temp2 = RLBP.rlbp(test_file, 2, 8)
temp3 = RLBP.rlbp(test_file, 3, 8)
temp = np.concatenate((temp1,temp2),axis=0)
tt_descr = np.concatenate((temp,temp3),axis=0)
tt_descr= ProCRC.mynormalize_TE(tt_descr, massimo, minimo);
Alpha = T.dot(tt_descr)
result= ProCRC.ProMax(Alpha, tr_descr, tr_label, classnum, 1);

print(order_list[result[0]])





