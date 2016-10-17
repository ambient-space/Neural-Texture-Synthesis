function net = vector2net(w,net)


for l = 1:numel(net.layers)
   layer = net.layers{l};
   if strcmp(layer.type,'conv');
       f = net.layers{l}.weights{1};
       n = numel(f);
       f(:) = w(1:n);
       net.layers{l}.weights{1} = f;
       w = w(n+1:end);
       
       b = net.layers{l}.weights{2};
       n = numel(b);
       b(:) = w(1:n);
       net.layers{l}.weights{2} = b;
       
       if numel(w)>n
           w = w(n+1:end);
       end
   end
end