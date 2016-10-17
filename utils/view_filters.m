function imf = view_filters(f)


n = ceil(sqrt(size(f,4)));

% Use PCA to reduce input feature space to 3
% in the first layer, this is RGB, so dimension stays the same

fv = squeeze(mean(f,3));

b = 0:size(f,1)-1;
imf = zeros(n*size(f,1),n*size(f,1));

nf = size(f,4);
k = 1;
for k2 = 1:n
    for k1=1:n
        
        imf(b+ (k1-1)*size(f,1) +1, b + (k2-1)*size(f,1) +1) = fv(:,:,k);

        k = k+1;
        if k>nf
            break;
        end
    end
    if k>nf
        break;
    end
end

imf = imresize(imf,4);

%figure
imf = 2/max(imf(:))*imf;
imshow(imf);drawnow;



