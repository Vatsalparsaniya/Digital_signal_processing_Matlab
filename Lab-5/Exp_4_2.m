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