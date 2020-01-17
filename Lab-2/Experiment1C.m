clc;
clear all;
close all;
ampl = input('Enter sin Wave amplitude :');
freq  = input('Enter sin Wave Frequency(Hz) :');
phase  = input('Enter sin Wave Phase in radian(ex: pi/2 ):');
sam_freq = input('Enter sin Wave Sampling frequency(samples par sec) :');
length_of_secquence = input('Enter sin Wave length of the sequence :');
f = freq/sam_freq;
n = 0:1:length_of_secquence-1;
y_n = ampl*sin(2*pi*f*n+phase);

audiowrite('exp1c.wav',y_n,sam_freq,'Bitspersample',16);
a = audioread('exp1c.wav');
p = audioplayer(a,sam_freq);
play(p);