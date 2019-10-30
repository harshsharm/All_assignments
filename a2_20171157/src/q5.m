function res  = q5(im)
if size(im,3) == 3
    im = rgb2gray(im);
    im = im2double(im);
    img = im;
else
    im = im2double(im);
    img = im;
end
 filter = ones(5, 5) / (5 * 5);
 result_im = cov(im,filter,5);
 %result_im = uint8(result_im);
 imshowpair(im,result_im,'montage');
 title('Original and output image of 1st part');
 figure;
%im = rand(64);
x = zeros(1, 16);
normal = zeros(1, 16);
efficient = zeros(1, 16);
cntr = 1;
for k = 2:2:32
    tic
    im3 = lowpass(im, k);
    normal(cntr) = toc;
    tic
    im2 = efficient_lowpass(im,k);
    efficient(cntr) = toc;
    x(cntr) = k;
    cntr = cntr+1;
end

plot(x, normal);
hold on;
plot(x, efficient);
legend('Normal', 'Efficient');
xlabel('k');
ylabel('time in seconds');
end
function result_im = lowpass(im, k)
    % padding the image
    im = padarray(im, [floor((k-1)/2) floor((k-1)/2)], 0);
    if mod(k-1, 2) == 1
        im = padarray(im, [1, 1], 0, 'pre');
    end
    im = double(im);
    % moving average filter
    filter = ones(k, k) / (k * k);
    result_im = cov(im,filter,k);
    result_im = uint8(result_im);
end

function result_im = efficient_lowpass(im, k)
    % padding the image
    result_im = zeros(size(im));
    im = padarray(im, [floor((k-1)/2) floor((k-1)/2)], 0);
    if mod(k-1, 2) == 1
        im = padarray(im, [1, 1], 0, 'pre');
    end
    for row = 1 : size(result_im, 1)
        if row == 1
            result_im(row, 1) = sum(sum(im(1:k, 1:k)));
        else
            result_im(row, 1) = result_im(row - 1, 1) - sum(im(row-1, 1:k)) + sum(im(row+k-1, 1:k));
        end
        for col = 2 : size(result_im, 2)
            result_im(row, col) = result_im(row, col-1) - sum(im(row:row+k-1, col-1)) + sum(im(row:row+k-1, col+k-1));
        end
    end
    result_im = result_im / (k * k);
    result_im = uint8(result_im);
end

