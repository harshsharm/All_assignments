function im = Identify_the_operation(im)
k=2;
subplot(2,2,1);
imshow(im);
im2 = im;
im = double(im);
im = im/(2^(8-k));
im = floor(im);
im = im * (2^(8-k));
im = uint8(im);
subplot(2,2,2);
imshow(im);
a6  = 255*bitand(im2,2^4);
subplot(2,2,3);
imshow(a6);
a8  = 255*bitand(im2,2^7);
subplot(2,2,4);
imshow(a8);