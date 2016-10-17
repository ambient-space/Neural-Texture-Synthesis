function net = load_vgg19(varargin)

net = load('C:\Users\ryan\Documents\MATLAB\imagenet-vgg-verydeep-19');
opts.useDouble = 0;
opts.lastLayer = 'pool5';
opts = vl_argparse(opts, varargin);


% Only take up to opts.last_layer
L = 1;
while ~strcmp(opts.lastLayer,net.layers{L}.name)
    L = L+1;
    if L > numel(net.layers);
        error([last_layer_name,' is not a layer in vgg19']);
    end
end
net.layers = net.layers(1:L);

for l = 1:L
    if strcmp(net.layers{l}.type,'conv')
        f = net.layers{l}.weights{1};
        b = net.layers{l}.weights{2};
        
        if opts.useDouble
        net.layers{l}.weights{1} = double(f);
        net.layers{l}.weights{2} = double(b);
        end
    end
    
    %change pooling method to average
    if strcmp(net.layers{l}.type,'pool')
        net.layers{l}.method = 'avg';
    end
end

disp('finished loading vgg19');
