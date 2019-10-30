function final=histMatching(im1,im2)
im1 = rgb2gray(im1);
im2 = rgb2gray(im2);
map_to_img = uint8(zeros(256,1));
im=im1;
total = size(im,1) * size(im,2);
subplot(1,2,1);
imshow(im);
cnt = zeros(256,1);
pf = zeros(256,1);
d = size(im);
for i=1:d(1,1)
    for j=1:d(1,2)
        cnt(im(i,j)+1)=cnt(im(i,j)+1)+1;
        pf(im(i,j)+1)=cnt(im(i,j)+1)/total;
    end
end

sum = 0;
num_bins = 255; 

pc = zeros(256,1);
cum_Sum = zeros(256,1);
for i=1:size(pf)
   sum = sum+cnt(i);
   cum_Sum(i) = sum;
end
cdf1 = cum_Sum;
im = im2;
total = size(im,1) * size(im,2);
subplot(1,2,1);
imshow(im);
cnt = zeros(256,1);
pf = zeros(256,1);
d = size(im);
for i=1:d(1,1)
    for j=1:d(1,2)
        cnt(im(i,j)+1)=cnt(im(i,j)+1)+1;
        pf(im(i,j)+1)=cnt(im(i,j)+1)/total;
    end
end

sum = 0;
num_bins = 255; 
pc = zeros(256,1);
cum_Sum = zeros(256,1);
for i=1:size(pf)
   sum = sum+cnt(i);
   cum_Sum(i) = sum;
end
cdf2 = cum_Sum;
for i = 1 : 256
    d = abs(cdf1(i) - cdf2);
    [val,idx] = min(d);
    map_to_img(i) = idx-1;
end
final = map_to_img(im1+1);
imshow(final);
figure;
subplot(2,2,1),imhist(im1);
title('Histogram of Given Image')
subplot(2,2,2),imhist(im2);
title('Histogram of Ref Image')
subplot(2,2,3),imhist(final);
title('Histogram After transforming the image')
figure;
subplot(2,2,1)
imshow(im1);
subplot(2,2,2)
imshow(im2);
subplot(2,2,3);
imshow(final);