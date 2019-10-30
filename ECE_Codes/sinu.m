function sinusoid = sinu(a,f,phi,T,Fs)
    for t = 1:T*Fs
     sinusoid(t) = a*sin(2*pi*f*t/Fs + phi);
    end
end