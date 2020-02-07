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
