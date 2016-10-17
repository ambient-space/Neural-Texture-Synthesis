
net = load_vgg19('lastLayer','pool2');
% net.constraint_layers = {'pool5','pool4','pool3','pool2','pool1','conv1_1'};
net.constraint_layers = {'pool2','pool1','conv1_1'};

x = load_image('packaged_candy.png');
x = resize_image_3D(x,.5);
rng(2);
t1 = tic;
y = neural_synthesis(x,net,'useGpu',1,'usePyramid',1,'numIter',250);
toc(t1)
