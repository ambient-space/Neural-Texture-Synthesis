function w = net2vector(net)

w = [];
for l = 1:numel(net.layers)
   layer = net.layers{l};
   if strcmp(layer.type,'conv');
       f = net.layers{l}.weights{1};
       n = numel(f);
       w = [w;f(:)];
       
       b = net.layers{l}.weights{2};
       n = numel(b);
       w = [w;b(:)];
       
   end
end