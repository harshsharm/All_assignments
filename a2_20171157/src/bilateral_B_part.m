function final = bilateral_B_part(img,Com_img)

img = im2double(img);
Com_img = im2double(Com_img);
w=5;
sigma_r= 0.05;
sigma_d = 15;

final(:,:,1) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,1));
final(:,:,2) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,2));
final(:,:,3) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,3));

temp = Com_img - final;
temp = temp.^2;
sumi = sum(temp(:));
dis = sqrt(sumi);
subplot(2,2,1)
imshowpair(Com_img,final,'montage');
title(['r_sigma = ' , num2str(sigma_r) , '   d_sigma = ' , num2str(sigma_d) , '   L2 distance= ' , num2str(dis)]);

w=5;
sigma_r= 10;
sigma_d = 4;

final(:,:,1) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,1));
final(:,:,2) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,2));
final(:,:,3) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,3));

temp = Com_img - final;
temp = temp.^2;
sumi = sum(temp(:));
dis = sqrt(sumi);
subplot(2,2,2)
imshowpair(Com_img,final,'montage');
title(['r_sigma = ' , num2str(sigma_r) , '   d_sigma = ' , num2str(sigma_d) , '   L2 distance= ' , num2str(dis)]);

w=5;
sigma_r= 0.2;
sigma_d = 2.1;

final(:,:,1) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,1));
final(:,:,2) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,2));
final(:,:,3) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,3));

temp = Com_img - final;
temp = temp.^2;
sumi = sum(temp(:));
dis = sqrt(sumi);
subplot(2,2,3)
imshowpair(Com_img,final,'montage');
title(['r_sigma = ' , num2str(sigma_r) , '   d_sigma = ' , num2str(sigma_d) , '   L2 distance= ' , num2str(dis)]);

w=5;
sigma_r= 0.5;
sigma_d = 1;

final(:,:,1) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,1));
final(:,:,2) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,2));
final(:,:,3) = bilateral_filter(w,sigma_r,sigma_d,img(:,:,3));

temp = Com_img - final;
temp = temp.^2;
sumi = sum(temp(:));
dis = sqrt(sumi);
subplot(2,2,4)
imshowpair(Com_img,final,'montage');
title(['r_sigma = ' , num2str(sigma_r) , '   d_sigma = ' , num2str(sigma_d) , '   L2 distance= ' , num2str(dis)]);
