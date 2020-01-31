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




