function [img_out,k,k_trace,ctr] = built_in_kmeans(img,k_cnt,k,k_out,norm,csc,k_trace,ctr)
img_out = img;
if(csc==0)
    cform = makecform('srgb2lab');
    img = applycform(img,cform);
%     img = rgb2lab(img);
elseif(csc==1)
    img = rgb2ycbcr(img);
end

s = 1;
img = double(img(:,:,s:3));
nrows = size(img,1);
ncols = size(img,2);
img = reshape(img,nrows*ncols,4-s);

if(norm==1)
    [cluster_idx, k(:,s:3)] = kmeans(img,k_cnt,'distance','cityblock','Start',k(:,s:3)); 
else
    [cluster_idx, k(:,s:3)] = kmeans(img,k_cnt,'distance','sqeuclidean','Start',k(:,s:3));
end

img2 = reshape(cluster_idx,nrows,ncols);

for i=1:nrows,
    for j=1:ncols,
        pix = k(img2(i,j),:);
%         img_out(i,j,:) = pix;
        img_out(i,j,:) = k_out(img2(i,j),:);
%         k_trace(ctr(3),:,:,3) = k(:,:);
%         if(rem(i,8)==0&(rem(j,8)==0))
%             ctr(3) = ctr(3) + 1;
%         end
    end
end
end
