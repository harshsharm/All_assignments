function new_img = temp_q5_3(im)
%img = imread('Degraded.jpg');
img =im;
eff = zeros(1,7);
ct=1;
nor = zeros(1,7);
x = zeros(1,7);
for i=3:2:15
    tic;
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    new_img(:,:,1) = im2Col(R,i);
    new_img(:,:,2) = im2Col(G,i);
    new_img(:,:,3) = im2Col(B,i);
    new_img = uint8(new_img);
    eff(ct)=toc;
    tic;
    new_img(:,:,1) = median_filter(R,i);
    new_img(:,:,2) = median_filter(G,i);
    new_img(:,:,3) = median_filter(B,i);
    new_img = uint8(new_img);
    x(ct) = i;
    nor(ct)=toc;
    ct =ct+1;
end

plot(x, nor);
hold on;
plot(x, eff);
legend('Normal', 'Efficient');
xlabel('w');
ylabel('time in seconds');