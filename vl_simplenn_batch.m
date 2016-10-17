function res = vl_simplenn_batch(net,X,bs)



res = vl_simplenn(net,X(:,:,:,1));

for k1 = 2:bs:size(X,4)
    
    k2 = min(size(X,4),k+bs-1);
    tmp = vl_simplenn(net,X(:,:,:,k1:k2));
    res(1).x = cat(4,res(1).x,tmp(1).x);
end
