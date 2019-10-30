function final = bilateral(img)

img = im2double(img);

w=5;
sigma_r= 0.05;
sigma_d = 15;

final(:,:,1) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,1));
final(:,:,2) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,2));
final(:,:,3) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,3));

imshowpair(img,final,'montage');
title('Original and After filter image');