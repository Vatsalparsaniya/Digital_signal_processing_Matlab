clc;
clear all;
close all;
A=input('Enter the amplitude:');
Ph=input('Enter the phase in radian: ');
k=input('Enter no. of bits per sample: ');

Fs=8000;
N=input('Length of no of sample: ');
n=0:N-1;
x = A*sin(2*pi*(126/8000)*n+Ph) +A*sin(2*pi*(277/8000)*n+Ph) +A*sin(2*pi*(1050/8000)*n+Ph) + A*sin(2*pi*(2277/8000)*n+Ph) + A*sin(2*pi*(3400/8000)*n+Ph);
x_n = x/max(abs(x));
audiowrite('try.wav',x_n,Fs,'BitsPerSample',k);
a=audioread('try.wav');
p=audioplayer(a,Fs);

B = [1 zeros(1,239) 0.1];
A = [1 zeros(1,239) -0.8];
N1 = 3000;
[h, t] = impz(B,A,N1);
y = conv(h,x_n);
y_n = y/max(abs(y));
audiowrite('Exp_3_generated.wav',y_n,Fs,'BitsPerSample',k);
a1=audioread('Exp_3_generated.wav');
p1=audioplayer(a1,Fs);
play(p1);
