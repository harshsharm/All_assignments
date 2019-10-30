function out = High_boost(img,n,A)

mtx = ones(n,n)/(n*n);
%mtx = [0,1,0;1,-4,1;0,1,0];
img = im2double(img);

img2(:,:,1) = cov(img(:,:,1),mtx,n);
img2(:,:,2) = cov(img(:,:,2),mtx,n);
img2(:,:,3) = cov(img(:,:,3),mtx,n);
img2 = imresize(img2,[size(img,1),size(img,2)]);
out = A.*img - img2;
subplot(1,2,1);
imshow(img);
title('Original image');
subplot(1,2,2);
imshow(out);
title('Final image, K=5,A=2');