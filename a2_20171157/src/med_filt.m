function new_img = med_filt(img)
%img = imread('Degraded.jpg');
im =img;
for i=1:8
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);

    new_img(:,:,1) = median_filter(R,3);
    new_img(:,:,2) = median_filter(G,3);
    new_img(:,:,3) = median_filter(B,3);
    new_img = uint8(new_img);
    img = imresize(new_img,[size(img,1),size(img,2)]);
    %figure;
end
imshowpair(im,new_img,'montage');
title('Input and output image after calling median filter 8 times');
%imshow(new_img);

