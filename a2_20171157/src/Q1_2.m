img = imread('barbara.jpg');
if(size(img,3)==3)
    img = rgb2gray(img);
end
img = im2double(img);
%   prewitt %%
pwtx = [-1,0,1;-1,0,1;-1,0,1];
pwty = [1,1,1;0,0,0;-1,-1,-1];


subplot(2,2,1);
imshow(img);
title('Original');
mx = cov(img,pwtx,3);
my = cov(img,pwty,3);
subplot(2,2,2);
imshow(mx);
title('x part');
subplot(2,2,3)
imshow(my);
title('y part');
subplot(2,2,4)
out = sqrt(mx.*mx + my.*my);
imshow(out);
title('Premitt output');
figure;
% sobel %
sblx = [-1 0 1;-2 0 2;-1 0 1];
sbly = [1 2 1;0 0 0;-1 -2 -1];

subplot(2,2,1);
imshow(img);
title('Original');
mx = cov(img,sblx,3);
my = cov(img,sbly,3);
subplot(2,2,2);
imshow(mx);
title('x part');
subplot(2,2,3)
imshow(my);
title('y part');
subplot(2,2,4)
%out = mx+my;
out = sqrt(mx.*mx + my.*my);
imshow(out);
title('Sobel output');
figure;

%Robert%

rbtx = [0 1;-1 0];
rbty = [1 0;0 -1];

subplot(2,2,1);
imshow(img);
title('Original');
mx = cov(img,rbtx,2);
my = cov(img,rbty,2);
subplot(2,2,2);
imshow(mx);
title('x part');
subplot(2,2,3)
imshow(my);
title('y part');
subplot(2,2,4)
out = sqrt(mx.*mx + my.*my);
imshow(out);
title('Robert output');
figure;

%Laplacian%

lap1 = [0,1,0;1,-4,1;0,1,0];
lap2 = [1,1,1;1,-8,1;1,1,1];

subplot(2,2,1);
imshow(img);
title('Original');
mx = cov(img,lap1,3);
my = cov(img,lap2,3);
subplot(2,2,2);
imshow(mx);
title('Using 1st matrix');
subplot(2,2,3)
imshow(my);
title('Using 2nd matrix');
subplot(2,2,4)
out = sqrt(mx.*mx + my.*my);
imshow(out);
title('if we mix the 2 outouts');

figure;
m = edge(img,'canny',0.2);
subplot(1,2,1);
imshow(img);
title('Original');
subplot(1,2,2);
imshow(m);
title('Canny');