Wp = 0.3;
Ws = 0.2;
Ap = 0.25;
As = -50;
trans_W = (Wp-Ws)*pi;
Wc = (Wp+Ws)/2;
disp('Cutoff Freq ');
disp(Wc);
M = ceil((6.6*pi)/trans_W);
if(rem(M,2) == 0)
   M = M + 1;
end
disp('Order ');
disp(M);
n = 0:M-1;
w_n = window(@hamming,M);
B = fir1(M-1, Wc, 'high', w_n);
figure(1);
freqz(B,1)
title('Frequency Response of Filter');



w_ns = 0:pi/255:Ws*pi;
Hs = freqz(B,1,w_ns);
Hsmag = abs(Hs);
HsdB = 20*log10(Hsmag);
as = max(HsdB);
disp('Stop Band Attenuation');
disp(as);



w_np = Wp*pi:pi/255:pi;
Hp = freqz(B,1,w_np);
Hpmag = abs(Hp);
HpdB = 20*log10(Hpmag);
ap = max(HpdB);
disp('Pass Band Attenuation');
disp(ap);