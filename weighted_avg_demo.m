clear all 
close all
clc

img = imread('mountain.jpg');
imshow(img)
s = size(img);
img_ycbcr = double(rgb2ycbcr(img));

k_cnt = 4;
k_out = [255,0,0;0,255,0;0,0,255;0,255,255;205,50,0;0,205,50;0,50,205;50,205,255];

k = ones(k_cnt,3)*127;
k_n = zeros(k_cnt,1);
ma_wa = 1;
[img_out_wa,k] = kmeans_custom(img_ycbcr,k_cnt,k,k_out,k_n,ma_wa);


k = ones(k_cnt,3)*127;
k_n = zeros(k_cnt,1);
ma_wa = 0;
[img_out_ma,k] = kmeans_custom(img_ycbcr,k_cnt,k,k_out,k_n,ma_wa);


img_out_wa = uint8(img_out_wa);
% img_out_wa = ycbcr2rgb(img_out_wa);
imshow(img_out_wa)
figure
img_out_ma = uint8(img_out_ma);
% img_out_ma = ycbcr2rgb(img_out_ma);
imshow(img_out_ma)
figure
% img_out = built_in_kmeans(img,k_cnt);
norm = 1;
csc = 0;
img_out = built_in_kmeans(img,k_cnt,k,k_out,norm,csc);
imshow(img_out,[])

% plot(k_trace_ma(:,1,2))
diff = abs(img_out_wa-img_out_ma);
diff = rgb2gray(diff);
diff = imbinarize(diff);
err = 100*sum(sum(sum(diff)))/(s(1)*s(2))
figure
imshow((diff),[])


