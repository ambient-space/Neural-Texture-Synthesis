# Neural-Texture-Synthesis
neural texture code with matconvnet in MATLAB 
Uses the vgg19 very deep net but can use any net that matconvnet uses. 


Installation instructions:

(1) Download and install matconvnet
http://www.vlfeat.org/matconvnet/

(2) Download minFunc 
https://www.cs.ubc.ca/~schmidtm/Software/minFunc.html

compile the mexFiles

(3) Change the path to these libraries in setup.m

(4) Add the paths of the images you want to use

Here are some free databases:
http://texturesynthesis.com/research.htm
http://www.cgtextures.com/

(5) Run the code in neural_synthesis_demo.m
Change the texture image or how many layers you would like to use.
Feel free to use a diffrent net as well.

NOTE: If you installed matconvnet without gpu then change 'useGpu' to 0 when calling neural_synthesis.m
