# -*- coding: utf-8 -*-
"""
Created on Mon Apr  5 10:09:48 2021

@author: Aadhithya
"""

import cv2
#import numpy as np
import sim as vrep
import Detection as det
#import time

vrep.simxFinish(-1) #Close all the existing connections

classes = ["Train","Train Door","Person"]

clientID = vrep.simxStart('127.0.0.1', 19999, True, True, 5000, 5)
vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot)
#Checking when the image from the sensor is recieved
if clientID != -1:
    print("Connected to remote API server")
    res, v0 = vrep.simxGetObjectHandle(clientID, 'v0', vrep.simx_opmode_oneshot_wait)
    res, v1 = vrep.simxGetObjectHandle(clientID, 'v1', vrep.simx_opmode_oneshot_wait)
    print( 'Getting first image')
    err, resolution, image = vrep.simxGetVisionSensorImage(clientID, v0, 0, vrep.simx_opmode_streaming)
    while (vrep.simxGetConnectionId(clientID) != -1):
        err, resolution, image = vrep.simxGetVisionSensorImage(clientID, v0, 0, vrep.simx_opmode_buffer)
        if err == vrep.simx_return_ok:
            print("image OK!!!")
            break
        elif err == vrep.simx_return_novalue_flag:
            print("no image yet")
            pass
        else:
            print(err)
    
else:
    print("Failed to connect to remote API server")
    vrep.simxFinish(clientID)

emptyBuff = bytearray()
#Calling script to start the simulation i.e move the wheelchair
res, _, _, _, _= vrep.simxCallScriptFunction(clientID,'Dummy',vrep.sim_scripttype_childscript,'script_run',[],[],[],emptyBuff,vrep.simx_opmode_blocking)
print(res)

  
while (vrep.simxGetConnectionId(clientID) != -1):
    
    err, resolution, image = vrep.simxGetVisionSensorImage(clientID, v0, 0, vrep.simx_opmode_buffer)
    image, class_ids, indexes, boxes, center_coord = det.detection(image,resolution)
    image = image.ravel()
    vrep.simxSetVisionSensorImage(clientID, v1, image, 0, vrep.simx_opmode_oneshot)
    res, flag_2, _, _, _= vrep.simxCallScriptFunction(clientID,'Dummy',vrep.sim_scripttype_childscript,'script_init',[],[],[],emptyBuff,vrep.simx_opmode_blocking)
    print(res,flag_2)
    if flag_2[0]>0:
        for i in range(len(boxes)):
            if i in indexes:
                if classes[class_ids[i]] == 'Train Door':
                    print(center_coord[i])
                    res,_,_,_,_ = vrep.simxCallScriptFunction(clientID,'Dummy',vrep.sim_scripttype_childscript,'angle_det',center_coord[i],[],[],emptyBuff,vrep.simx_opmode_blocking)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()


