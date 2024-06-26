close all
clear all
clc

vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19998,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    
     joint_pos1 = [-2*pi/3,0,0,0,pi/4,0];
     joint_pos2 = [0,-pi/4,pi/2,0,0,0];
     joint_pos3 = [0,0,pi/4,pi/3,0,0];
     one = [0.90,0,0];
     two = [0.7750,0,0];
     three = [0.6550,0,0];
     four = [0.4750,0,0];
     five = [0.2250,0,0];
     six = [0.10,0,0];
     
     [r,random] = vrep.simxGetObjectHandle(clientID,'random',vrep.simx_opmode_blocking);
    
    [r,chair] = vrep.simxGetObjectHandle(clientID,'chair',vrep.simx_opmode_blocking);
    
    [r,bl_cy] = vrep.simxGetObjectHandle(clientID,'bl_cylinder',vrep.simx_opmode_blocking);
    [r,bl_cy0] = vrep.simxGetObjectHandle(clientID,'bl_cylinder0',vrep.simx_opmode_blocking);
    [r,bl_cy1] = vrep.simxGetObjectHandle(clientID,'bl_cylinder1',vrep.simx_opmode_blocking);
    [r,bl_cy2] = vrep.simxGetObjectHandle(clientID,'bl_cylinder2',vrep.simx_opmode_blocking);
    
    [r,ml_cy] = vrep.simxGetObjectHandle(clientID,'ml_cylinder',vrep.simx_opmode_blocking);
    [r,ml_cy0] = vrep.simxGetObjectHandle(clientID,'ml_cylinder0',vrep.simx_opmode_blocking);
    
    [r,bl_li] = vrep.simxGetObjectHandle(clientID,'bl_linear',vrep.simx_opmode_blocking);
    [r,bl_li0] = vrep.simxGetObjectHandle(clientID,'bl_linear0',vrep.simx_opmode_blocking);
    [r,bl_li1] = vrep.simxGetObjectHandle(clientID,'bl_linear1',vrep.simx_opmode_blocking);
    [r,bl_li2] = vrep.simxGetObjectHandle(clientID,'bl_linear2',vrep.simx_opmode_blocking);
    
    
    [r,ml_li] = vrep.simxGetObjectHandle(clientID,'ml_linear',vrep.simx_opmode_blocking);
    [r,ml_li0] = vrep.simxGetObjectHandle(clientID,'ml_linear0',vrep.simx_opmode_blocking);
    
    [r,dflj] = vrep.simxGetObjectHandle(clientID,'dflj',vrep.simx_opmode_blocking);
    [r,dflw] = vrep.simxGetObjectHandle(clientID,'dflw',vrep.simx_opmode_blocking);
    [r,dfrj] = vrep.simxGetObjectHandle(clientID,'dfrj',vrep.simx_opmode_blocking);
    [r,dfrw] = vrep.simxGetObjectHandle(clientID,'dfrw',vrep.simx_opmode_blocking);
    
    [r,drlj] = vrep.simxGetObjectHandle(clientID,'drlj',vrep.simx_opmode_blocking);
    [r,drlw] = vrep.simxGetObjectHandle(clientID,'drlw',vrep.simx_opmode_blocking);
    [r,drrj] = vrep.simxGetObjectHandle(clientID,'drrj',vrep.simx_opmode_blocking);
    [r,drrw] = vrep.simxGetObjectHandle(clientID,'drrw',vrep.simx_opmode_blocking);
    
    
    [r,dmlj] = vrep.simxGetObjectHandle(clientID,'dmlj',vrep.simx_opmode_blocking);
    [r,dmlw] = vrep.simxGetObjectHandle(clientID,'dmlw',vrep.simx_opmode_blocking);
    [r,dmrj] = vrep.simxGetObjectHandle(clientID,'dmrj',vrep.simx_opmode_blocking);
    [r,dmrw] = vrep.simxGetObjectHandle(clientID,'dmrw',vrep.simx_opmode_blocking);
    
    
    [r,dlmj] = vrep.simxGetObjectHandle(clientID,'dlmj',vrep.simx_opmode_blocking);
    [r,dlmw] = vrep.simxGetObjectHandle(clientID,'dlmw',vrep.simx_opmode_blocking);
    [r,drmj] = vrep.simxGetObjectHandle(clientID,'drmj',vrep.simx_opmode_blocking);
    [r,drmw] = vrep.simxGetObjectHandle(clientID,'drmw',vrep.simx_opmode_blocking);
    
    
    
    [r,om_pj] = vrep.simxGetObjectHandle(clientID,'om_pj',vrep.simx_opmode_blocking);
    [r,om] = vrep.simxGetObjectHandle(clientID,'om',vrep.simx_opmode_blocking);
    
    [r,seq1_pj] = vrep.simxGetObjectHandle(clientID,'seq1_pj',vrep.simx_opmode_blocking);
    [r,seq1] = vrep.simxGetObjectHandle(clientID,'seq1',vrep.simx_opmode_blocking);
    
    [r,seq2_pj] = vrep.simxGetObjectHandle(clientID,'seq2_pj',vrep.simx_opmode_blocking);
    [r,seq2] = vrep.simxGetObjectHandle(clientID,'seq2',vrep.simx_opmode_blocking);
    [r,dyn] = vrep.simxGetObjectHandle(clientID,'dyn',vrep.simx_opmode_blocking);
    
    [r,boom] = vrep.simxGetObjectHandle(clientID,'boom',vrep.simx_opmode_blocking);
    [r,prime] = vrep.simxGetObjectHandle(clientID,'prime',vrep.simx_opmode_blocking);
   
    [r,diamond] = vrep.simxGetObjectHandle(clientID,'diamond',vrep.simx_opmode_blocking);
       
%       1st seq
pause(4);
      vrep.simxSetObjectParent(clientID,bl_li,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li0,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li1,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li2,-1,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,dflj,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,-1,true,vrep.simx_opmode_blocking);
%        vrep.simxSetObjectParent(clientID,dmlj,-1,true,vrep.simx_opmode_blocking);
%       vrep.simxSetObjectParent(clientID,dmrj,-1,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,chair,seq1_pj,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,dflj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,random,true,vrep.simx_opmode_blocking);
%       vrep.simxSetObjectParent(clientID,dmlj,random,true,vrep.simx_opmode_blocking);
%       vrep.simxSetObjectParent(clientID,dmrj,random,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetJointTargetPosition(clientID,seq1_pj,-0.2,vrep.simx_opmode_blocking);
      
      pause(5);
      
      
%       try

% vrep.simxSetObjectOrientation(clientID,chair,-1,[0,5,0],vrep.simx_opmode_blocking);
 
 pause(5);

%  middle wheels come down
vrep.simxSetObjectParent(clientID,ml_li,dyn,true,vrep.simx_opmode_blocking);
vrep.simxSetObjectParent(clientID,ml_li0,dyn,true,vrep.simx_opmode_blocking);
% vrep.simxSetObjectParent(clientID,dmlj,dyn,true,vrep.simx_opmode_blocking);
% vrep.simxSetObjectParent(clientID,dmrj,dyn,true,vrep.simx_opmode_blocking);

vrep.simxSetJointTargetPosition(clientID,seq2_pj,+0.4,vrep.simx_opmode_blocking);

pause(6);

vrep.simxSetObjectParent(clientID,ml_li,ml_cy,true,vrep.simx_opmode_blocking);
vrep.simxSetObjectParent(clientID,ml_li0,ml_cy0,true,vrep.simx_opmode_blocking);

pause(2);
% run towards the step

      vrep.simxSetObjectParent(clientID,bl_li,bl_cy,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li0,bl_cy0,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li1,bl_cy1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li2,bl_cy2,true,vrep.simx_opmode_blocking);
      

      vrep.simxSetObjectParent(clientID,dflj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,chair,true,vrep.simx_opmode_blocking);
      
    
      vrep.simxSetObjectParent(clientID,chair,-1,true,vrep.simx_opmode_blocking);

      pause(1);
      
     vrep.simxSetJointTargetVelocity(clientID,dflj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,2,vrep.simx_opmode_blocking);
     
    pause(4);
     vrep.simxSetJointTargetVelocity(clientID,dflj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,0,vrep.simx_opmode_blocking);
     
     pause(1);
 %   first two wheels should lift

      vrep.simxSetObjectParent(clientID,bl_li,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li0,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li1,-1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li2,-1,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,chair,seq1_pj,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,dflj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,random,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetJointTargetPosition(clientID,seq1_pj,-0.2,vrep.simx_opmode_blocking);
      
      pause(3);


 vrep.simxSetObjectParent(clientID,drlj,bl_li,true,vrep.simx_opmode_blocking);
 vrep.simxSetObjectParent(clientID,drrj,bl_li2,true,vrep.simx_opmode_blocking);
 
 vrep.simxSetObjectParent(clientID,bl_li,dyn,true,vrep.simx_opmode_blocking);
 vrep.simxSetObjectParent(clientID,bl_li2,dyn,true,vrep.simx_opmode_blocking);
 
  vrep.simxSetJointTargetPosition(clientID,seq2_pj,-0.2,vrep.simx_opmode_blocking);
  
  pause(5); 
  
%   entrain first two wheels

      vrep.simxSetObjectParent(clientID,dflj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,chair,true,vrep.simx_opmode_blocking);
       vrep.simxSetObjectParent(clientID,dmlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,chair,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,bl_li,bl_cy,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li0,bl_cy0,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li1,bl_cy1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li2,bl_cy2,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,chair,-1,true,vrep.simx_opmode_blocking);
      
     vrep.simxSetJointTargetVelocity(clientID,dflj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,2,vrep.simx_opmode_blocking);
     
    pause(1.6);
     vrep.simxSetJointTargetVelocity(clientID,dflj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,0,vrep.simx_opmode_blocking);
    
       vrep.simxSetObjectParent(clientID,chair,seq1_pj,true,vrep.simx_opmode_blocking);
       
      vrep.simxSetObjectParent(clientID,dflj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,random,true,vrep.simx_opmode_blocking);
      
     
%    lift middle wheels 
  pause(2);
   vrep.simxSetObjectParent(clientID,dmlj,ml_li,true,vrep.simx_opmode_blocking);
   vrep.simxSetObjectParent(clientID,dmrj,ml_li0,true,vrep.simx_opmode_blocking);
  
   vrep.simxSetObjectParent(clientID,ml_li,dyn,true,vrep.simx_opmode_blocking);
   vrep.simxSetObjectParent(clientID,ml_li0,dyn,true,vrep.simx_opmode_blocking);

vrep.simxSetJointTargetPosition(clientID,seq2_pj,-0.4,vrep.simx_opmode_blocking); %Here 0.2 is changed to 0.3 and then to 0.4

pause(7);


vrep.simxSetObjectParent(clientID,ml_li,ml_cy,true,vrep.simx_opmode_blocking);
vrep.simxSetObjectParent(clientID,ml_li0,ml_cy0,true,vrep.simx_opmode_blocking);

% entrain
      vrep.simxSetObjectParent(clientID,dflj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,chair,true,vrep.simx_opmode_blocking);
       vrep.simxSetObjectParent(clientID,dmlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,chair,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,bl_li,bl_cy,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li0,bl_cy0,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li1,bl_cy1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li2,bl_cy2,true,vrep.simx_opmode_blocking);
      
      vrep.simxSetObjectParent(clientID,chair,-1,true,vrep.simx_opmode_blocking);
      
     vrep.simxSetJointTargetVelocity(clientID,dflj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,2,vrep.simx_opmode_blocking);
     
    pause(1.6);
     vrep.simxSetJointTargetVelocity(clientID,dflj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,0,vrep.simx_opmode_blocking);
    
       vrep.simxSetObjectParent(clientID,chair,seq1_pj,true,vrep.simx_opmode_blocking);
       
      vrep.simxSetObjectParent(clientID,dflj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,random,true,vrep.simx_opmode_blocking);
      
        
      
       
    pause(2);
     
%      lift rear wheels

      vrep.simxSetObjectParent(clientID,dflj,bl_li0,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,bl_li1,true,vrep.simx_opmode_blocking);
 pause(2);
 
 
 vrep.simxSetObjectParent(clientID,bl_li0,dyn,true,vrep.simx_opmode_blocking);
 vrep.simxSetObjectParent(clientID,bl_li1,dyn,true,vrep.simx_opmode_blocking);
 vrep.simxSetObjectParent(clientID,diamond,dyn,true,vrep.simx_opmode_blocking);
 
  vrep.simxSetJointTargetPosition(clientID,seq2_pj,-0.55,vrep.simx_opmode_blocking); %Here 0.4 is changed to 0.3 but 0.4 is the best value
  
  pause(10);
  
%   entrain

      vrep.simxSetObjectParent(clientID,bl_li,bl_cy,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li0,bl_cy0,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li1,bl_cy1,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,bl_li2,bl_cy2,true,vrep.simx_opmode_blocking);

      vrep.simxSetObjectParent(clientID,dflj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmlj,chair,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,chair,true,vrep.simx_opmode_blocking);
      
     
      
      vrep.simxSetObjectParent(clientID,chair,-1,true,vrep.simx_opmode_blocking);

      pause(2);
      
     vrep.simxSetJointTargetVelocity(clientID,dflj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,2,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,2,vrep.simx_opmode_blocking);
     
    pause(5);
     vrep.simxSetJointTargetVelocity(clientID,dflj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dfrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,drrj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmlj,0,vrep.simx_opmode_blocking);
     vrep.simxSetJointTargetVelocity(clientID,dmrj,0,vrep.simx_opmode_blocking);
     
    
    
       vrep.simxSetObjectParent(clientID,chair,seq1_pj,true,vrep.simx_opmode_blocking);
       
      vrep.simxSetObjectParent(clientID,dflj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dfrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,drrj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmlj,random,true,vrep.simx_opmode_blocking);
      vrep.simxSetObjectParent(clientID,dmrj,random,true,vrep.simx_opmode_blocking);
 

else
     disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!

disp('Program ended');