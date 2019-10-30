clc;
[x,fs] = audioread("piano_A.wav");
y = sinu(1,50,0,67,fs);
%display(fs);
z = zeros(1,67000);
t = zeros(1,length(x));
for i=1:length(x)
    t(i) = x(i,1);
end
for i = 1:1:67000
    z(i) = t(i) + y(i);
end
f = filter(HH,z);
sound(f);
subplot(3,1,1);
plot(abs(fft(t)));
subplot(3,1,2);
plot(abs(fft(z)));
subplot(3,1,3);
plot(abs(fft(f)));