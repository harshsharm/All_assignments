function img = gauss3(x1,y1,sigma)
img=exp((-(1-(x1-y1).^2)/(2*sigma^2)));
end