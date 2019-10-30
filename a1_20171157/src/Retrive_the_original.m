function Retrive_the_original(im,im1,im2,im3,im4)
d = size(im);
d1 = size(im1);
d2 = size(im1);
d3 = size(im2);
d2 = size(im3);

o1 = histMatching(im1,im((1:d(1,1)/2),(1:d(1,2)/2),:));
o2 = histMatching(im2,im((1:d(1,1)/2),(d(1,2)/2 +1:d(1,2)),:));
o3 = histMatching(im3,im((d(1,1)/2 +1:d(1,1)),(1:d(1,2)/2),:));
o4 = histMatching(im4,im((d(1,1)/2 +1:d(1,1)),(d(1,2)/2+1:d(1,2)),:));

res1 = cat(1,o1,o3);
res2 = cat(1,o2,o4);
final_res = cat(2,res1,res2);
im5 = rgb2gray(im);

subplot(2,1,1);
imshow(im5);
title('Original Image');
subplot(2,1,2);
imshow(final_res);
title('Retrival Image');