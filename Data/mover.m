% ----------------------------------
% clear all
clc;
close all;
clear all;

% ----------------------------------
% constants
maxAngle = 60;
minAngle = 30;

% ----------------------------------
% random starting angle (30°-60°)
randVal = rand(1);
startAngle = randVal*(maxAngle-minAngle) + minAngle;

% ----------------------------------
% generate the meshgrid
x = 1:10;
y = 1:10;
grass = ones(100,100);
%grass(1,3) = 0;
pcolor(grass);
%figure
%axis([0 10 0 10]);
%plot(x,y)