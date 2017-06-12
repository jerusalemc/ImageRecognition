npersons = 38; 
npics = 7; %用于训练的照片数

% 读取训练数据
[train_matrix, test_matrix, test_class] = ReadFace(npersons, npics);   %读取训练数据
nfaces = size(train_matrix, 1);  % 样本人脸的数量

% 低维空间的图像是(npersons * npics) * k的矩阵，每行代表一个主成分脸，每个脸k维特征
% 训练数据PCA特征提取
mA = mean(train_matrix);
k = 40; %降维至k维(40 -90)
[pcaface, V] = fastPCA(train_matrix, k, mA);    %主成分分析法特征提取 


% 训练特征数据规范化
lowvec = min(pcaface);
upvec = max(pcaface);
scaledface = Scaling(pcaface, lowvec, upvec);

% SVM样本训练
gamma=0.01;  
c=128;  
multiSVMstruct=multiSVMtrain(scaledface,npersons,npics, gamma,c);  


% 测试数据特征降维
m = size(test_matrix, 1);
for i = 1:m
    test_matrix(i, :) = test_matrix(i, :) - mA;
end
pcatestface = test_matrix * V;

% 测试特征数据规范化
scaledtestface = Scaling(pcatestface, lowvec, upvec);

% SVM样本分类
class= multiSVM(scaledtestface,multiSVMstruct,npersons); 

accuracy=sum(class==test_class)/length(class);  
% display(['正确率：',num2str(accuracy)]);
fprintf('投影维数为: %d\n', k);
fprintf('每类训练样本个数为: %d\n', npics);
fprintf(2,'识别率为: %3.2f%%\n\n',accuracy*100);


