function net = net2single(net)

for layer = 1:numel(net.layers)
    l = net.layers{layer};
   if strcmp(l.type,'conv')
       l.weights{1} = single(l.weights{1});
       l.weights{2} = single(l.weights{2});
   end
   net.layers{layer} = l;
end