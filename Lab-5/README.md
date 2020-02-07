# Experiment 4

### 1) For M-tap moving average filter, plot the magnitude and phase response for different values of M using MATLAB.
### Note: Use inbuilt function: freqz.
![](Images/M_tap.jpeg)

    M = input('Enter the value of M:');
    B = 1/M*ones(1,M);
    A = input('Denominator cofficient :');
    N=M-1;

    W = -pi:pi/255:pi;
    H = freqz(B,A,W);

    figure(1)

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

![](Images/freq_res.png)

### Input:
    Enter the value of M:10
    Denominator cofficient :2

### 2)  Write a MATLAB program to generate a signal x(n)=2n (0.95) n ; 0≤n≤99. Corrupt it by additive random noise with amplitude in interval [-0.5 0.5]. Apply the signal to a Moving average filter with given tap length. Plot the input signal,noise signal, corrupted signal and filtered signal in same plot. Use proper labels and legends.
### Note: Use inbuilt functions: rand, filter

        M = input('Enter the value of M:');
        B = 1/M*ones(1,M);
        A = 1;
        figure(1)
        b = 0.5;
        a = -0.5;
        r = a + (b-a).*rand(100,1);
        X_C=2*r.*(0.95).^r;
        w=[0:99];
        X=2*w.*(0.95).^w;
        t = 1:length(X);
        X_noise=X+X_C';
        Y = filter(B,A,X_noise);
        plot(t,X_C,'-',t,Y,'-',t,X,'-.',t,X_noise,'-');
        legend('Corrupted Signal','Filtered Signal',"Input Signal","Noise Signal")
 ## Input:
    Enter the value of M:13

## Output:
![](Images/Ex_4_2.png)
