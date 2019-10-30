function img1 = gauss(x,y,sigma)
    img1 = exp(-(x.^2+y.^2)/(2*sigma^2));
end