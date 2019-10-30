function out = im2Col(img, N)
d1 = size(img);
%disp('dfs');
if(mod(N,2)~=0)
    m = (N-1)/2;
else
    m=N/2;
end
Pad_image = zeros(d1(1,1)+2*m,d1(1,2)+2*m);

Pad_image(m+1:(end-m),m+1:(end-m)) = img;
out = zeros(d1(1,1)+2*m,d1(1,2)+2*m);
d = size(Pad_image);

for i= 1:d(1,1)-N+1
    for j=1:d(1,2)-N+1
        mtx=zeros(N*N,1);
        idx=1;
        cnt = zeros(256,1);
        for x=1:N
            for y=1:N
                mtx(idx)=Pad_image(i+x-1,j+y-1);
                cnt(mtx(idx)+1) = cnt(mtx(idx)+1)+1;
                idx=idx+1;
            end
        end
       t = floor((N*N)/2);
       c=0;
       for lp = 1:256
           if cnt(lp)==1
               c = c+cnt(lp);
           end
           if c == t
               out(i,j)=lp-1;
               break;
           end
       end
    end
end
out=uint8(out);
%size(out)
out = imresize(out,[d1(1),d1(2)]);
%size(out)
end