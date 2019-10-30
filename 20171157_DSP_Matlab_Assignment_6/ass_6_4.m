clc;
clearvars;
%%H1
h2 = tf([3 1],[1 1/2],0.1,'variable','z')
subplot(3,1,1);
pzmap(h2);
n = [3 1];
d = [1,1/2];
[H2,w1] = freqz(n,d,'whole');
subplot(3,1,2);
plot(abs(H2));
subplot(3,1,3);
plot(angle(H2));
figure;
%%H2
h2 = tf([1 3],[3 1],0.1,'variable','z')
subplot(3,1,1);
pzmap(h2);
n = [1 3];
d = [3,1];
[H2,w2] = freqz(n,d,'whole');
subplot(3,1,2);
plot(abs(H2));
subplot(3,1,3);
plot(angle(H2));