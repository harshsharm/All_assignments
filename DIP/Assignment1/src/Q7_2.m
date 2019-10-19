im1 = imread('Dark.jfif');
im2 = im1;
im3 = histMatching(im1,im2);
subplot(2,2,1)
imshow(im1);
subplot(2,2,2)
imshow(im2);
subplot(2,2,[3 4])
imshow(im3);
figure;
im2 = imread('Gray.bmp');
im3 = histMatching(im1,im2);
subplot(2,2,1)
imshow(im1);
subplot(2,2,2)
imshow(im2);
subplot(2,2,[3 4])
imshow(im3);
figure;
im2 = imread('Gray.bmp');
im3 = histMatching(im2,im1);
subplot(2,2,1)
imshow(im2);
subplot(2,2,2)
imshow(im1);
subplot(2,2,[3 4])
imshow(im3);