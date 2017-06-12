function [pcaA, V] = fastPCA(A, k, mA)
% fastPCA, 主成分分析
%输入： A, 样本矩阵，每行是一个样本，列是样本的维数
%           k, 降至k维
%输出： pcaA, 降维后的k维样本特征向量组成的矩阵, 即主成分
%           v, 主成分分量

m = size(A, 1);
Z = (A - repmat(mA, m, 1));
T = Z * Z';
[V, D] = eigs(T, k); %计算T的最大的k个特征值和特征向量
V = Z' * V;             %协方差矩阵的特征向量
for i = 1:k
    l = norm(V(:,i));
    V(:, i) = V(:, i) / l;
end
pcaA = Z * V;      %线性变换，降至k维
end