 # Experiment-3
 
### (i) Reverberation is similar to the echo effect we can hear when we shout across an open valley or canyon, or in a large empty room. The following figure gives one such model of reverberation. Find the transfer function and frequency response. Write a program to display its frequency response and impulse response. 
![](Images/Ex_3_1.PNG)

     B = input('Numerator cofficient :');
     A = input('Denominator cofficient :');

     [z,p,k] = tf2zpk(B,A);

     disp('value of z : ');
     disp(z);
     disp('value of p : ');
     disp(p);
     disp('value of k : ');
     disp(k);

     figure(1)
     zplane(B,A);

     N = input('length of bounded input : ');

     [H,n] = impz(B,A,N);
     figure(2)
     subplot(2,1,1);
     stem(n,H);
     title('impulse response');
     xlabel('number of samples');
     ylabel('Amplitude');

     [S,n]= stepz(B,A,N);
     subplot(2,1,2);
     stem(n,S);
     title('step response');
     xlabel('number of samples');
     ylabel('Amplitude');

     f = isstable(B,A);
     if(f==0)
         disp('system is unstable');
     else
         disp('system is stable');
         W = -pi:pi/255:pi;
         H = freqz(B,A,W);

         figure(3)

         subplot(2,1,1);
         plot(W,abs(H));
         title('frequency response');
         xlabel('omega');
         ylabel('magnitude');

         subplot(2,1,2);
         plot(W,angle(H));
         title('frequency response');
         xlabel('omega');
         ylabel('phase');

     end

## Input : 
#### Numerator cofficient : [1 zeros(1,239) 0.1]
#### Denominator cofficient :[1 zeros(1,239) -0.8]

## Output :

![](Images/ex_3_zplane.PNG)
![](Images/Ex_3_impulse_response.PNG)
![](Images/Ex_3_frequency-response.PNG)

## Note: Use inbuilt function: impz, freqz. 
### (ii) Apply an audio signal of suitable length to this filter containing mixture of tones at 126Hz, 277Hz, 1050Hz, 2277Hz and 3400Hz with equal relative magnitudes and sampled at 8000Hz. Plot and hear its input and output using headphone/ear phone/speaker. 
# Method-1 (Convolution)
    clc;
    clear all;
    close all;
    ampl = input('Enter sin Wave amplitude :');
    %freq  = input('Enter sin Wave Frequency(Hz) :');
    phase  = input('Enter sin Wave Phase in radian(ex: pi/2 ):');
    sam_freq = input('Enter sin Wave Sampling frequency(samples par sec) :');
    length_of_secquence = input('Enter sin Wave length of the sequence :');
    B = input('Numerator cofficient :');
    A = input('Denometer cofficient :');
    N = input('Enter the lenght of h(z)');
    %f = freq/sam_freq;
    n = 0:1:length_of_secquence-1;
    x = ampl*sin(2*pi*(126/8000)*n+phase)+ampl*sin(2*pi*(277/8000)*n+phase)+ampl*sin(2*pi*(1050/8000)*n+phase)+ampl*sin(2*pi*(2277/8000)*n+phase)+ampl*sin(2*pi*(3400/8000)*n+phase);
    x_n= x/max(abs(x));
    [H,n] = impz(B,A,N);
    y=conv(H,x_n);
    y_n=y/max(abs(y));
    audiowrite('exp1c.wav',y_n,sam_freq,'Bitspersample',16);
    a = audioread('exp1c.wav');
    p = audioplayer(a,sam_freq);
    play(p);
    figure(1)
    subplot(2,1,1);
    stem(n(1:2000),y_n(1:2000));
    subplot(2,1,2);
    stem(n(1:2000),x_n(1:2000));
## Input : 
    Enter sin Wave amplitude :100
    Enter sin Wave Phase in radian(ex: pi/2 ):0
    Enter sin Wave Sampling frequency(samples par sec) :8000
    Enter sin Wave length of the sequence :50000
    Numerator cofficient :[1 zeros(1,239) 0.1]
    Denometer cofficient :[1 zeros(1,239) -0.8]
    Enter the lenght of h(z)4000
## Output:
[Generated waw file](Exp_3_generated.wav)

# Method-1 (Filter)

# Experiment 4 
### (i) For M-tap moving average filter, plot the magnitude and phase response for different values of M using MATLAB.  
## Note: Use inbuilt function: freqz. 
### (ii) Write a MATLAB program to generate a signal x(n)=2n (0.95)n; 0≤n≤99. Corrupt it by additive random noise with amplitude in interval [-0.5 0.5]. Apply the signal to a Moving average filter with given tap length. Plot the input signal, noise signal, corrupted signal and filtered signal in same plot. Use proper labels and legends. Note: Use inbuilt functions: rand, filter  
 
