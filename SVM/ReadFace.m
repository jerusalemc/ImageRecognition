function [train_matrix, test_matrix, test_class] = ReadFace(persons, pics)
% 读取yaleB人脸库照片里的数据到矩阵
% persons: 需要读入的人数
% pics: 每个人用来训练的照片数
% imgrow: 图像的行像素, 48
% imgcol: 图像的列像素, 42

imgrow = 48;
imgcol = 42;
train_matrix = zeros(persons * pics, imgrow * imgcol);
test_matrix = zeros(persons * (59 - pics), imgrow * imgcol);
test_class =  zeros(persons * (59 - pics), 1);

for i = 1:persons %persons
    path = strcat('./Sample/yaleB', num2str(i, '%02d'), '/');
    for j = 1:pics   % read train data
        train_path = strcat(path, 'yaleB', num2str(i, '%02d'), '_', num2str(j, '%02d'), '.pgm');
        train_img = imread(train_path);
        train_matrix((i - 1) * pics + j, :) = train_img(:)';
    end
    
    for k = (pics + 1):59
        k;
        test_path = strcat(path, 'yaleB', num2str(i, '%02d'), '_', num2str(j, '%02d'), '.pgm');
        test_img = imread(test_path);
        test_matrix((i - 1) * (59 - pics) + k - pics, :) = test_img(:)';
        test_class((i - 1) * (59 - pics) + k - pics) = i;
    end
end
end
            