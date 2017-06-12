function [scaledface] =  Scaling(faceMat, lowvec, upvec)
% 特征数据规范化
% 输入— faceMat: 需要进行规范化的图像数据
%            lowvec: 原来的最小值
%            upvec:  原来的最大值
upnew = 1;
lownew = -1;
[m, n] = size(faceMat);
scaledface = zeros(m, n);
for i=1:m
    scaledface(i, :) = lownew+ (faceMat(i,:)-lowvec) ./ (upvec - lowvec) * (upnew - lownew); 
end
end