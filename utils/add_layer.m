function net = add_layer(net,params)


n = numel(net.layers) + 1;
switch params.type
    
    case 'conv'
        net.layers{n}.filters = single(params.filters);
        net.layers{n}.type = 'conv';
        net.layers{n}.biases = single(params.biases);
        
    case 'relu'
        net.layers{n}.type = 'relu';
            
    case 'pool'
        net.layers{n}.type = 'pool';
        net.layers{n}.method = 'avg';
        net.layers{n}.stride = [2,2];
        net.layers{n}.pool = [2,2];
    otherwise
        
end