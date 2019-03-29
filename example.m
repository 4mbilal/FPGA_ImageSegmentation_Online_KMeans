clc; clear all; close all;
% Set the video information
% http://vip.cs.nctu.edu.tw/resource_seq.html
videoSequence(1).file = 'akiyo_cif.yuv'; videoSequence(1).width = 352; videoSequence(1).height = 288;videoSequence(1).nfr = 300;
videoSequence(2).file = 'container_cif.yuv'; videoSequence(2).width = 352; videoSequence(2).height = 288;videoSequence(2).nfr = 300;
videoSequence(3).file = 'foreman_cif.yuv'; videoSequence(3).width = 352; videoSequence(3).height = 288;videoSequence(3).nfr = 300;
videoSequence(4).file = 'carphone_cif.yuv'; videoSequence(4).width = 352; videoSequence(4).height = 288;videoSequence(4).nfr = 382;
videoSequence(5).file = 'claire_qcif.yuv'; videoSequence(5).width = 176; videoSequence(5).height = 144;videoSequence(5).nfr = 494;
videoSequence(6).file = 'hall_cif.yuv'; videoSequence(6).width = 352; videoSequence(6).height = 288;videoSequence(6).nfr = 300;
videoSequence(7).file = 'highway_cif.yuv'; videoSequence(7).width = 352; videoSequence(7).height = 288;videoSequence(7).nfr = 2000;
videoSequence(8).file = 'soccer_cif.yuv'; videoSequence(8).width = 352; videoSequence(8).height = 288;videoSequence(8).nfr = 150;
videoSequence(9).file = 'ice_cif.yuv'; videoSequence(9).width = 352; videoSequence(9).height = 288;videoSequence(9).nfr = 240;
videoSequence(10).file = 'tennis_cif.yuv'; videoSequence(10).width = 352; videoSequence(10).height = 288;videoSequence(10).nfr = 150;

rms_val1 = [];
rms_val2 = [];
for vid=8:8,
videofile = videoSequence(vid).file;
width  = videoSequence(vid).width;
height = videoSequence(vid).height;
nFrame = videoSequence(vid).nfr;
pix_frame = width*height;


% Read the video sequence
[Y,U,V] = yuvRead(videofile, width, height ,nFrame); 
U = imresize(U,2);
V = imresize(V,2);
% img = zeros(size(U),3);
% Show sample frames
figure;
c = 0;  % counter
k_cnt = 8;
k_out = [255,0,0;0,255,0;0,0,255;0,255,255;205,50,0;0,205,50;0,50,205;50,205,255];
k_out = [k_out;k_out*0.5];
norm = 2;
csc = 1;        %0-LAB, 1-YCbCr
nfr = nFrame;
k = ones(k_cnt,3,3)*127;
% k = rand(k_cnt,3,3)*15+127;
% k = fi(rand(k_cnt,3,3)*15+127,1,12,2); %6.9331
% k = fi(ones(k_cnt,3,3)*127);
% k_trace = zeros(396*nfr,k_cnt,3,3);
k_trace = [];
ctr = [1,1,1];
err1 = [];
err2 = [];
% image = imread('mountain.jpg');
fr_step = 1;
nfr = 1;
scale = 1;
for iFrame = 1:fr_step:nfr
    disp(iFrame*100/nfr)
    img = cat(3, Y(:,:,iFrame),U(:,:,iFrame),V(:,:,iFrame));
    img = imresize(img,scale);
    img = ycbcr2rgb(img);
%     img = image;
    
%     imshow(img)
%     pause
%     continue
    subplot(2,2,1)
    imshow(img)
    title('Input Image')
    
    [img_out1,k(:,:,3),k_trace,ctr] = built_in_kmeans(img,k_cnt,k(:,:,3),k_out,norm,csc,k_trace,ctr);
    subplot(2,2,2)
    imshow((uint8(img_out1)))
    title('Matlab K-Means')
    
    ma_wa = 1;
%     [img_out2,k,k_trace,ctr] = kmeans_custom(img,k_cnt,k,k_out,ma_wa,norm,csc,k_trace,ctr);
    subplot(2,2,3)
%     imshow(ycbcr2rgb(uint8(img_out2)))
    title('Weighted Average')
%     err1 = [err1 sum(sum(sum((double(img_out2)-double(img_out1)).^2)))];
    ma_wa = 2;
%     [img_out3,k,k_trace,ctr] = kmeans_custom(img,k_cnt,k,k_out,ma_wa,norm,csc,k_trace,ctr);
    subplot(2,2,4)
%     imshow(ycbcr2rgb(uint8(img_out3)))
    title('Moving Average')
%     err2 = [err2 sum(sum(sum((double(img_out3)-double(img_out1)).^2)))];
    drawnow
end

figure
err1 = err1/(pix_frame*3*scale*scale);
err2 = err2/(pix_frame*3*scale*scale);
plot(err1.^0.5)
hold on 
plot(err2.^0.5)
axis([0 nfr 0 10])

rmse1 = (sum(err1)*fr_step/nfr).^0.5;
rmse2 = (sum(err2)*fr_step/nfr).^0.5;
rms_val1 = [rms_val1, rmse1];
rms_val2 = [rms_val2, rmse2];

end
rms_val1
rms_val2

% figure
% hold on
% for i=1:5:k_cnt
%     for j=1:3
%         plot(k_trace(:,i,1,j))
%     end
% end
% 
% figure
% hold on
% for i=1:5:k_cnt
%     for j=1:3
%         plot(k_trace(:,i,2,j))
%     end
% end
% 
% figure
% hold on
% for i=1:5:k_cnt
%     for j=1:3
%         plot(k_trace(:,i,3,j))
%     end
% end
