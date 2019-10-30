function res = q6(X,k)
upper_limit=300;
graph_plot=zeros(upper_limit,1);
graph_plot1=zeros(upper_limit,1);
for i=3:upper_limit
    tic
        res1= slower_mean_filter(X,i);
    graph_plot(i)= toc;
end
%colormap('gray');
%imagesc(X);
%figure;
%colormap('gray');
%imagesc(res1);
imshowpair(X,res1,'montage');
for i=3:upper_limit
    tic
        res2= faster_mean_filter(X,i);
    graph_plot1(i)=toc;
end
figure;
colormap('gray');
imagesc(res2);
figure;
plot(1:upper_limit,graph_plot);
hold on;
plot(1:upper_limit,graph_plot1,'--');
end


function res = slower_mean_filter(X,k)
    F = ones(k)/k.^2;
    res= conv2(X,F,'same');
end



function res = faster_mean_filter(X,k)
    V = ones(k,1)/k.^2;
    H = ones(1,k)/k.^2;
    temp = imfilter(X,H,'conv');                            
    res = imfilter(temp,V,'conv');
end
