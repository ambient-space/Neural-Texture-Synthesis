function [f,g] = grad_gramm_net_loss(y,net,x_gram,y_sz,use_gpu,x_mean)

y = single(reshape(y,y_sz));
if use_gpu
    y = gpuArray(y);
end

y_net = vl_simplenn(net,y);
f = 0;
g = 0;

for l = numel(net.layers):-1:1
    n = net.layers{l}.name;
    if any(strcmp(net.constraint_layers,n))
        N = size(y_net(l+1).x,1)*size(y_net(l+1).x,2);
        K = size(y_net(l+1).x,3);
        yl = reshape(y_net(l+1).x,N,[]);
        gy = yl'*yl;
        
        gx = single(x_gram{l});
        
        ge = gy-gx;
        f = f + sum(ge(:).^2)/N^2;
        gl = reshape(4*yl*ge/N^2, size(y_net(l+1).x));
        
        g = g + gl;
    end
    
    if numel(g)>1
        res = vl_simplenn(net, y, g, y_net, 'BackPropDepth',1,'SkipForward','true');
        g = res(l).dzdx;
    end
    net.layers = net.layers(1:end-1);
    y_net = y_net(1:end-1);
end

imshow(bsxfun(@plus,y,x_mean)/255);
title('Current neural synthesis');
drawnow;

%cast to double for minFunc
g = double(gather(g(:)));
f = double(gather(f));
