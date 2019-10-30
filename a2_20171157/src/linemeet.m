function img = linemeet(img)
img = rgb2gray(img);
img = im2double(img);
mtx = [1,1,1;0,0,0;-1,-1,-1];
%c = conv2(img,mtx);
subplot(1,2,1);
imshow(img);
title('Original Image');
c2 = con_2(img,mtx,3);
subplot(1,2,2);
imshow(c2);
title('Output Image');

function out = con_2(img1,mtx,n)
if(mod(n,2)~=0)
    m = (n-1)/2;
else
    m=n/2;
end
mtx = flip(mtx,2);
mtx = flip(mtx);
d = size(img1);
out = zeros(d);
img = zeros(d(1,1)+2*m,d(1,2)+2*m);

img(m+1:(end-m),m+1:(end-m)) = img1;
for i = 2:d(1,1)
    for j = 2:d(1,2)
        part_temp = img(i-1:i+n-2,j-1:j+n-2) .* mtx;
        out(i-1,j-1) = sum(part_temp(:));
    end
end