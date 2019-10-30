function img2 = gauss2(x1,y2,sigma1)
    img2 = exp(-(x1-y2).^2/(2*sigma1^2));
end
