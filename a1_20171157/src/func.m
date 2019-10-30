function im = func(im,k1,k2,a,b)
if size(im,3)==3
    im = rgb2gray(im);
    im = im2double(im);
else
    im = im2double(im);
end
m = size(k1,2);
d = size(im);
for n = 1:m
    for i = 1:d(1,1)
        for j = 1:d(1,2)
            if(im(i,j)>=a(1,n) & im(i,j)<=b(1,n))
                im(i,j) = im(i,j)*k1(1,n) + k2(1,n);
            end
        end
    end
end
im = im*255;
im = uint8(im);
%figure;
%imshow(sho);
end