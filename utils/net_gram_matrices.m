function x_net_gram_matrices = net_gram_matrices(x,net)

x_net = vl_simplenn(net,x);

x_net_gram_matrices = {};

for l = 1:numel(net.layers)
    if any(strcmp(net.constraint_layers,net.layers{l}.name))
        N = size(x_net(l+1).x,1)*size(x_net(l+1).x,2);
        xl = reshape(x_net(l+1).x,N,[]);
        
        gx = xl'*xl;
        x_net_gram_matrices{l} = gx;
    end
    
end