function im = piecewise_lineartransform(im)
subplot(2,2,1);
imshow(im);
im2 = func(im,[0 4/3 -2 0],[0 0 2 0],[0 0.3 0.6 0.8],[0.3 0.6 0.8 1]);
subplot(2,2,2);
imshow(im2);
title('First Part');
im3 = func(im,[0 0 0 0 0],[0 0.2 0.4 0.6 0.8],[0 0.2 0.4 0.6 0.8],[0.2 0.4 0.6 0.8 1]);
subplot(2,2,3);
imshow(im3);
title('second part');
