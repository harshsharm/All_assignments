function im = gamma_transform(im)
subplot(2,2,1);
imshow(im);
title('Befor transformation');
y = 0.6;
im1 = double(im);
im1 = 255*((im1/255).^y);
im1 = uint8(im1);
subplot(2,2,2);
imshow(im1);
title('Y = 0.6');

y = 1;
im1 = double(im);
im1 = 255*((im1/255).^y);
im1 = uint8(im1);
subplot(2,2,3);
imshow(im1);
title('Y = 1');

y = 1.6;
im1 = double(im);
im1 = 255*((im1/255).^y);
im1 = uint8(im1);
subplot(2,2,4);
imshow(im1);
title('Y = 1.6');