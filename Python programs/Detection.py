# -*- coding: utf-8 -*-
"""
Created on Mon Apr 26 09:40:36 2021

@author: Aadhithya
"""
import cv2
import numpy as np

def detection(image,resolution):
    weights_path = "yolov4-obj_best.weights"
    cfg_path = "yolov4-obj.cfg"
    net = cv2.dnn.readNet(weights_path,cfg_path)
    layer_names = net.getLayerNames()
    output_layers = [layer_names[i[0] - 1] for i in net.getUnconnectedOutLayers()]
    classes = ["Train","Train Door","Person"]
    img = np.array(image,dtype=np.uint8)
    img.resize([resolution[1],resolution[0],3])
    #print(resolution[0],resolution[1])
    img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
    img = cv2.rotate(img,cv2.ROTATE_180)
    img = cv2.flip(img,1)
    #cv2.imshow('image',img)
    image = cv2.resize(img, None, fx=0.4, fy=0.4)
    height, width, channels = img.shape
    blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
    colors = [(0,255,0), (0,0,255), (255,0,0)]
    
    net.setInput(blob)
    outs = net.forward(output_layers)
    class_ids = []
    confidences = []
    boxes = []
    center_coord = []
    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            if confidence > 0.5:
                # Object detected
                #print(class_id)
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2] * width)
                h = int(detection[3] * height)
    
                # Rectangle coordinates
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)
                
                # Center Coordinates
                center_coord.append([center_x,center_y])
               
                boxes.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)
                
    indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
    
    font = cv2.FONT_HERSHEY_COMPLEX
    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])+" {:.2f}%".format(confidences[i] * 100)
            color = colors[class_ids[i]]
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x + 20, y - 10), font,0.65 , color, 2)
            
    #cv2.imshow("Image", img)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = cv2.rotate(img,cv2.ROTATE_180)
    img = cv2.flip(img,1)
    
    return img, class_ids, indexes, boxes, center_coord