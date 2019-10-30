function final = Inverse_bilateral(img)

img = im2double(img);

w=5;
sigma_r= 0.05;
sigma_d = 15;

final(:,:,1) = Inv_bilateral(w,sigma_r,sigma_d,img(:,:,1));
final(:,:,2) = Inv_bilateral(w,sigma_r,sigma_d,img(:,:,2));
final(:,:,3) = Inv_bilateral(w,sigma_r,sigma_d,img(:,:,3));

img = rgb2gray(img);
final = rgb2gray(final);
imshowpair(img,final,'montage');