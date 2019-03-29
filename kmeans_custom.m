function [img,k,k_trace,ctr] = kmeans_custom(img_in,k_cnt,k,k_out,ma_wa,norm,csc,k_trace,ctr)
img = img_in;
if(csc==0)
    cform = makecform('srgb2lab');
    img = applycform(img,cform);
elseif(csc==1)
    img = rgb2ycbcr(img);
end
img = double(img);

s = size(img);
k_n = zeros(k_cnt,1);
alpha = 0.999;
alpha = fi(alpha);

for i=1:s(1)
%     i
    for j=1:s(2)
        in = img(i,j,:);
        in = [in(1),in(2),in(3)];
        p = repmat(in,k_cnt,1);
         p = fi(p,1,12,2);
        %Find closest matching cluster centroid using SAD
        scores = abs(p-k(:,:,ma_wa));
        if(norm==2)
            scores = scores.^2;
        end
        scores = sum(scores(:,1:3),2);  %To Skip Y, use 2:3
        [Y,adr] = min(scores);
        img(i,j,:) = k(adr,:,ma_wa);        %Actual weighted-averaged centroids as output      
%         img(i,j,:) = k_out(adr,:);      %pseudocolor as output for each centroid
        %Update matched centroid
        k_n(adr) = k_n(adr) + 1;
        if(ma_wa==1)%weighted average
            k(adr,:,ma_wa) = k(adr,:,ma_wa)*alpha + (1-alpha)*in;
        else%moving average
            k(adr,:,ma_wa) = k(adr,:,ma_wa)*(1-1/k_n(adr)) + (1/k_n(adr))*in;
        end
%         k_trace(ctr(ma_wa),:,:,ma_wa) = k(:,:,ma_wa);
%         if(rem(i,8)==0&(rem(j,8)==0))
%             ctr(ma_wa) = ctr(ma_wa) + 1;
%         end
    end
%     i*100/s(1)
end
end




