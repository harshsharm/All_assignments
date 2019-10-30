function im =  BitQuantizeImage(im,k)
subplot(1,2,1);
imshow(im);
title('Before Quantize');
subplot(1,2,2);
im = double(im);
im = im/(2^(8-k));
im = floor(im);
im = im * (2^(8-k));
im = uint8(im);
subplot(1,2,2);
imshow(im);
title('After Quantize');