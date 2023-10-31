%% Intro to Bicycle Model in Vehicle Dynamics
% https://dingyan89.medium.com/simple-understanding-of-kinematic-bicycle-model-81cac6420357
% Lets get it
% Compute state [x, y, theta, delta] from inputs [v, phi]
% theta = heading angle
% delta = steering angle
% v = velocity
% phi = steering angle


%% Example from article with refrence frame at the rear axle
clear; clc; close all;

v = 11; %m/s or 25 mph
phi = 15;  %rate of change of steering wheel
delta = [15]; %steering angle
theta = [15]; %deg rotation position
L = 2.928; %wheel base of Mazda CX-9
deltaT = 0.1; %steps
x = [0];
y = [0];


for step = [1: 100]
    [new_x, new_y, new_theta, new_delta] = bikeRear(L, v, phi, delta(step), theta(step), x(step), y(step), deltaT);
    x(step+1) = new_x;
    y(step+1) = new_y;
    theta(step+1) = new_theta;
    delta(step+1) = new_delta;
end
quiver(x,y, cos(theta), sin(theta))
xlim([-15, 15])
ylim([-15, 15])

function [x, y, theta, delta] = bikeRear(L, v, phi, delta, theta, x, y, deltaT)
    
    x_dot = v*cos(theta);
    y_dot = v*sin(theta);
    
    R = L/tan(delta); %Radius to ICR
    
    theta_dot = v / (L/tan(delta)); %rotation rate
    
    delta_dot = phi;
    
    x = x + x_dot * deltaT;
    y = y + y_dot * deltaT;
    theta = theta + theta_dot*deltaT;
    delta = delta + delta_dot*deltaT;


end



%% Example from article with refrence frame at the front axle

%v = 11;
% phi = 15;
%delta = 15;

%x_dot = v*cos(delta + theta);
%y_dot = v*sin(delta + theta);

%R = L/sin(delta);
%theta_dot = v/R;
%delta_dot = phi;

