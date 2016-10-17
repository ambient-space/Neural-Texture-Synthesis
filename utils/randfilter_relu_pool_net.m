function net = randfilter_relu_pool_net(num_pool,num_filters,f_size)

net.layers = {};
num_feat = 3;%RGB input

for p = 1:num_pool
   
    f = rand(f_size,f_size,num_feat,num_filters)-.5;
%     b = rand(num_filters,1)-.5;
    b = [];
    params = struct('type','conv');
    params.filters = f;
    params.biases = b;
    net = add_layer(net,params);
    
    params = struct('type','relu');
    net = add_layer(net,params);
    
    params = struct('type','pool');
    net = add_layer(net,params);
    
    num_feat = num_filters;
end



net = vl_simplenn_tidy(net);