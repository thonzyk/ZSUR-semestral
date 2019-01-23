

x1 = -30:rastr:30; x2 = -60:rastr:10;
[X1,X2] = meshgrid(x1,x2);

for i=1:length(mi_cell)
    sigma = sigma_cell{i};
    mi = mi_cell{i};
    if i == 1
        F = mvnpdf([X1(:) X2(:)],mi,sigma);
        
    else
        F = F + mvnpdf([X1(:) X2(:)],mi,sigma);
    end
end

F = reshape(F,length(x2),length(x1));

surf(x1,x2,F);

caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-30 30 -60 10 0 .05])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

%% PROÈIŠTÌNÍ WORKSPACE
vars = {'F','i','mi', 'sigma', 'x1', 'x2', 'X1', 'X2'};
clear(vars{:})
clear vars



% x1 = -30:.05:30; x2 = -60:.05:10;
% [X1,X2] = meshgrid(x1,x2);
% F = mvnpdf([X1(:) X2(:)],mi,sigma);
% F = reshape(F,length(x2),length(x1));
%
% mvncdf([0 0],[1 1],mi,sigma);
% contour(x1,x2,F);