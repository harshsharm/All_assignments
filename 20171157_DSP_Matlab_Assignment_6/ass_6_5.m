clc;
clearvars;
x = zeros(1,1000);
for i=1:1001
    x(i)= exp(-(0.5*(i-1)));
end
plot(x);
title('Given signal');
axis([-10,1500,-2,2]);
figure;
%H1
n = [3 1];
d = [1,1/2];
fil = fft(filter(n,d,x));
plot(abs(fil));
title('Magnitude response using H1');
%axis([-10,1500,-2,4]);
figure;
plot(angle(fil));
title('phase response using H1');
%axis([-10,1500,-2,2]);
figure;
%H2
n2 = [1 3];
d2 = [3,1];
fil2 = fft(filter(n2,d2,x));
plot(abs(fil2));
title('Magnitude response using H2');
%axis([-10,1500,-2,2]);
figure;
plot(angle(fil2));
title('phase response using H2');
%axis([-10,1500,-2,2]);