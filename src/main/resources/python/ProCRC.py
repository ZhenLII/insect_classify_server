# -*- coding: utf-8 -*-
"""
Created on Sat Apr 20 14:52:49 2019

@author: SV
"""
import numpy as np
def mynormalize_TR(TR):
    massimo=TR.max(0)+0.00001
    minimo=TR.min(0)
    training=np.zeros(TR.shape)
    for i in range(0,TR.shape[1]):
        training[0:TR.shape[0],i]=(TR[0:TR.shape[0],i]-minimo[i])/(massimo[i]-minimo[i])
    TR = training
    training_data = TR.T
    return (training_data,massimo,minimo)


def mynormalize_TE(TE,massimo,minimo):
    TElength = 0
    testing=np.zeros(TE.shape)
    if(len(TE.shape)==1):
        TElength = TE.shape[0]
        for i in range(0,TElength):
            testing[i]=(TE[i]-minimo[i])/(massimo[i]-minimo[i])
    else:
        TElength = TE.shape[1]
        for i in range(0,TElength):
            testing[0:TE.shape[0],i]=(TE[0:TE.shape[0],i]-minimo[i])/(massimo[i]-minimo[i])
    
    TE = testing
    test_data = TE.T
    return (test_data)

def OutPut_T(tr_descr,tr_label,classnum,tr_num):
    param_gamma = 0.01    
    param_lambda =  1.0
    tr_label = np.array(tr_label)
    tr_block_diag_mat = np.zeros((tr_num,tr_num))    
    
    tr_blocks = [None]*classnum

    for ci in range(0,classnum):
        tr_blocks[ci] = ((tr_descr[:,tr_label == ci+1]).T).dot(tr_descr[:,tr_label == ci+1]);
   
    
    #tr_block_diag_mat = np.diag(tr_blocks[:]);
    temp = 0
    for i in range(0,classnum):
        tr_block_diag_mat [temp:temp+len(tr_blocks[i]),temp:temp+len(tr_blocks[i])] = tr_blocks[i]
        temp = temp+len(tr_blocks[i])
    
    tr_sym_mat = (param_gamma * (classnum - 2) + 1) * ((tr_descr.T).dot(tr_descr)) + param_gamma * tr_block_diag_mat + param_lambda * np.eye(tr_descr.shape[1]);

    T = np.linalg.solve( tr_sym_mat,tr_descr.T)
    
    return T
#    T = tr_sym_mat \ tr_descr';

def ProMax(Alpha,tr_descr,tr_label,classnum,ttnum):
    pre_matrix = np.zeros((classnum, ttnum));
    recon_tr_descr  =   tr_descr.dot(Alpha);
    tr_label = np.array(tr_label)
    
    for ci in range(0,classnum):
        if(len(Alpha.shape)==1):
            loss_ci = recon_tr_descr - (tr_descr[:, tr_label == ci+1]).dot(Alpha[tr_label == ci+1])
        else:
            loss_ci = recon_tr_descr - tr_descr[:, tr_label == ci+1].dot(Alpha[tr_label == ci+1,:])
        pci = np.sum(loss_ci ** 2)
        pre_matrix[ci,:] = pci;


    pred_ttls =  np.argmin(pre_matrix,axis=0)
    return pred_ttls
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    