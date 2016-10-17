function y = neural_synthesis(x0,net,varargin)

opts.useGpu = 0;
opts.numIter = 50;
opts.usePyramid = 0;
x0 = single(x0);

opts = vl_argparse(opts, varargin);

% handle scales
scales = 1;
if opts.usePyramid; scales = [1,.5,.25]; end;

% move to gpu if specified
if opts.useGpu; net = vl_simplenn_move(net,'gpu'); end;


%create blurred noise
out_scale = 1;
y = rand(size(x0))*255;
y = imresize(y,out_scale);
y = imfilter(y,fspecial('gaussian',5,1));


%subtract means
mx0 = mean(mean(x0,1),2);
x0 = bsxfun(@minus,x0,mx0);
y = bsxfun(@minus,y,mx0);


%Perform synthesis
figure;
for s = scales(end:-1:1)
    x = resize_image_3D(x0,s);
    y = resize_image_3D(y,ceil(out_scale*s*size(x0)));
    
    if opts.useGpu; x = gpuArray(x); end;
    
    x_net_gram = net_gram_matrices(x,net);
    
    mf_options = struct('MaxIter', opts.numIter);
    mf_options.MaxFunEvals = opts.numIter;
%     mf_options.Method = 'sd';
    tmp = minFunc(@grad_gramm_net_loss, y(:), mf_options, net, x_net_gram, size(y), opts.useGpu, mx0);
    y = reshape(tmp,size(y));
    
    
end

y =  bsxfun(@plus,y,mx0)/255;

