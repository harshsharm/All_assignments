function Histogram_equalization_2bar(im)
if size(im,3) == 3
    im = rgb2gray(im);
else
    im=im;
end
im = histEqualization(im);
figure;
im = histEqualization(im);
