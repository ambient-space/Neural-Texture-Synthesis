function net = net2double(net)

for layer = 1:numel(net.layers)
    l = net.layers{layer};
   if strcmp(l.type,'conv')
       l.weights{1} = double(l.weights{1});
       l.weights{2} = double(l.weights{2});
   end
   net.layers{layer} = l;
end