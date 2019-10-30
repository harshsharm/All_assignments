function final = crossBilateral(img1,img2)

img1 = im2double(img1);
img2 = im2double(img2);
w=5;
sigma_r= 0.05;
sigma_d = 15;

final(:,:,1) = cross_bilateral(w,sigma_r,sigma_d,img1(:,:,1),img2(:,:,1));
final(:,:,2) = cross_bilateral(w,sigma_r,sigma_d,img1(:,:,2),img2(:,:,2));
final(:,:,3) = cross_bilateral(w,sigma_r,sigma_d,img1(:,:,3),img2(:,:,3));

subplot(1,3,1);
imshow(img1);
subplot(1,3,2);
imshow(img2);
subplot(1,3,3);
imshow(final);