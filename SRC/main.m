clear all
clc
close all

database=[pwd '/Sample'];   %使用的人脸库
train_samplesize=20;        %每类训练样本数
address=[database '/yaleB'];
rows=48;
cols=42;
ClassNum=38;
tol_num=59;
image_fmt='.pgm';

%------------------------PCA降维-------------------------
train=1:train_samplesize;
test=train_samplesize+1:tol_num;

train_num=length(train);
test_num=length(test);

train_tol=train_num*ClassNum;
test_tol=test_num*ClassNum;

[train_sample,train_label]=readsample(address,ClassNum,train,rows,cols,image_fmt);
[test_sample,test_label]=readsample(address,ClassNum,test,rows,cols,image_fmt);

for pro_dim=40:10:90
    %PCA降维
    [Pro_Matrix,Mean_Image]=my_pca(train_sample,pro_dim);
    train_project=Pro_Matrix'*train_sample;
    test_project=Pro_Matrix'*test_sample;
    
    %单位化
    train_norm=normc(train_project);
    test_norm=normc(test_project);
    
    accuracy=computaccuracy(train_norm,ClassNum,train_label,test_norm,test_label);
    fprintf('投影维数为: %d\n',pro_dim);
    fprintf('每类训练样本个数为: %d\n', train_samplesize);
    fprintf(2,'识别率为: %3.2f%%\n\n',accuracy*100);
end

