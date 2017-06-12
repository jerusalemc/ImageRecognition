function [multiSVMstruct] = multiSVMtrain(traindata, nclass, npics, gamma, c)
% 多类别的SVM训练器
% Detailed explaination goes here
% multiSVMstruct = cell(nclass);
for i=1:nclass-1  
    for j=i+1:nclass  
        X=[traindata(npics*(i-1)+1:npics*i,:);traindata(npics*(j-1)+1:npics*j,:)];  
        Y=[ones(npics,1);zeros(npics,1)];  
        multiSVMstruct{i}{j} = svmtrain(X,Y,'Kernel_Function',@(X,Y) kfun_rbf(X,Y,gamma),'boxconstraint',c);  
    end  
end 

end