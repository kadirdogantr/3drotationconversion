function axis=  euler2quatern(roll, pitch, yaw)
%Euler angle(degree) to quaternion
    roll= roll*pi/180; %deg to rad
    pitch=pitch*pi/180; %deg to rad
    yaw=yaw*pi/180; %deg to rad
    cosPsi = cos(yaw * 0.5);
    sinPsi = sin(yaw * 0.5);

    cosTheta = cos(pitch * 0.5);
    sinTheta = sin(pitch * 0.5);

    cosPhi = cos(roll * 0.5);
    sinPhi = sin(roll * 0.5);
    
q0= (cosPsi * cosTheta * cosPhi + sinPsi * sinTheta * sinPhi); %skalar unit

q1= -(cosPsi * cosTheta * sinPhi - sinPsi * sinTheta * cosPhi);

q2= -(cosPsi * sinTheta * cosPhi + sinPsi * cosTheta * sinPhi);

q3= -(sinPsi * cosTheta * cosPhi - cosPsi * sinTheta * sinPhi);

q=[q0 q1 q2 q3];     %quaternions


angle = (2 * acos(q0))*180/pi; %angle(degree)
s = sqrt(1-q0*q0);
x = q1 / s; %x axis
y = q2/s; %y axis
z = q3/s; %z axis
axis = [angle x y z]; %axis angle
end
