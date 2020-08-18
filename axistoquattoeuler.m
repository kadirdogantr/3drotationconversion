function euler = axisAngle2quatern(angle)
    % axis angle to quaternion
angle=angle*pi/180; %deg to rad
axis=[0 1 0 ]; %Axis selection. ie [1 0 0] for roll, [0 1 0] pitch, [0 0 1] yaw
q0 = cos(angle./2); %scalar unit
q1 = -axis(:,1)*sin(angle./2);
q2 = -axis(:,2)*sin(angle./2);
q3 = -axis(:,3)*sin(angle./2);
q = [q0 q1 q2 q3]; %quaternion form
    % quaternion to euler

    R= zeros(3,3)
R(1,1,:) = 2.*q(:,1).^2-1+2.*q(:,2).^2;
R(2,1,:) = 2.*(q(:,2).*q(:,3)-q(:,1).*q(:,4));
R(3,1,:) = 2.*(q(:,2).*q(:,4)+q(:,1).*q(:,3));
R(3,2,:) = 2.*(q(:,3).*q(:,4)-q(:,1).*q(:,2));
R(3,3,:) = 2.*q(:,1).^2-1+2.*q(:,4).^2;

phi = ((atan2(R(3,2,:), R(3,3,:)))*180/pi); %roll angle
theta = ((-atan(R(3,1,:) ./ sqrt(1-R(3,1,:).^2) ))*180/pi); %pitch angle
psi = ((atan2(R(2,1,:), R(1,1,:) ))*180/pi); %yaw angle

euler = [phi(1,:)' theta(1,:)' psi(1,:)'];  
end
