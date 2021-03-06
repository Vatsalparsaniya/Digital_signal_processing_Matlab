clc;
clear;
close all;

n1 = input('Enter alue of n1 : ');
n2 = input('Enter alue of n2 : ');
n0 = input('Enter alue of n0 : ');

range = n2 - n1;
x = n1:n2;
unit_impulse = [zeros(1,abs(n0-n1)) ones(1,1) zeros(1,n2-n0)];

figure(1);
subplot(2,2,1);
stem(x,unit_impulse);

unit_step = [zeros(1,abs(n0-n1)) ones(1,n2-n0+1)];
subplot(2,2,2);
stem(x,unit_step);

ramp = [zeros(1,abs(n0-n1)) 0:n2-n0];
subplot(2,2,3);
stem(x,ramp);
