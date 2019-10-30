 function n_im = histEqualization(im)
if size(im,3) == 3
    im = rgb2gray(im);
else
    im=im;
end
te = im;
total = size(im,1) * size(im,2);
subplot(1,2,1);
imshow(im);
title('Original Image');
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
map_img = zeros(256,1);
map_img = double(map_img);
for i=1:size(pf)
   sum = sum+cnt(i);
   cum_Sum(i) = sum;
   pc(i) = cum_Sum(i)/total;
   map_img(i) = pc(i)*num_bins;
end
d = size(map_img);
for i =1:d(1,1)
    map_img(i) = round(map_img(i));
end
map_img = uint8(map_img);
map_img;
d = size(im);
n_im = uint8( zeros( size(im,1) , size(im,2) ) );
for i=1:d(1,1)
    for j=1:d(1,2)
        n_im(i,j) = map_img(im(i,j)+1);
    end
end
%figure
subplot(1,2,2);
imshow(n_im);
title('Histogram equalization');
figure;
subplot(1,2,1)
histogram(te);
subplot(1,2,2);
histogram(n_im);