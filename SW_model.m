clear all
close all
clc

img = imread('s02.bmp');
s = size(img);
% img = imresize(img,0.25);
k = fi(ones(4,3)*127,1,18,8);
[img_out,k] = SW_Segmentation(img,k);
imshow(img_out)
drawnow
[img_out,k] = SW_Segmentation(img,k);
imshow(img_out)
drawnow
[img_out,k] = SW_Segmentation(img,k);
imshow(img_out)
drawnow
[img_out,k] = SW_Segmentation(img,k);
imshow(img_out)
drawnow
pause


img = rgb2ycbcr(img);
img_r_S = img(:,:,1);
img_g = img(:,:,2);
img_b = img(:,:,3);
img_r = zeros(size(img_g));
% img_r = img_r_S;
img_flat = double([img_r(:),img_g(:),img_b(:)]);
% hist(img_flat)
% figure
[img_k, C] = kmeans(img_flat, 4);%,'Start',rand(2,3)*50);
img_k = reshape(img_k,s(1),s(2));
img_out = zeros(s(1),s(2),3);

for i=1:s(1)
    for j=1:s(2)
        k = img_k(i,j);
        img_out(i,j,:) = C(k,:);
        img_out(i,j,1) = 64;%img_r_S(i,j);
    end
end
img_out = ycbcr2rgb(uint8(img_out));
img_out = (uint8(img_out));
imshow(img_out)
ycbcr2rgb(uint8(C))



function [img_out,k] = SW_Segmentation(img_in,k_in)
k_cnt = 4;
% k = fi(ones(k_cnt,3)*127,1,18,8);
k = k_in;
alpha = fi(0.999);
s = size(img_in);
img_in = rgb2ycbcr(img_in);

for i=1:s(1)
    for j=1:s(2)
        in = img_in(i,j,:);
        in = [in(1),in(2),in(3)];
        p = repmat(in,k_cnt,1);
        p = fi(p,1,18,8);
        %Find closest matching cluster centroid using SAD
        scores = abs(p-k);
        scores = sum(scores(:,2:3),2);  %Skip Y in the first column
        [Y,adr] = min(scores);
        img_in(i,j,:) = k(adr,:);
        %Update matched centroid
        k(adr,:) = k(adr,:)*alpha + (1-alpha)*in;
    end
    i*100/s(1)
end
img_out = uint8(img_in);
img_out = ycbcr2rgb(img_out);
end
