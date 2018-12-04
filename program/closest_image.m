function [ min, min_index ] = closest_image( input_image, dist_matrix )
% Vrac� index nejbli���ho obrazu
 
len = length(dist_matrix);
min = inf;
min_index = [0 0];

for i=1:input_image-1
    if dist_matrix(i, input_image) < min
        min = dist_matrix(i, input_image);
        min_index = i;
    end
end

for i=input_image+1:len
    if dist_matrix(input_image, i) < min
        min = dist_matrix(input_image, i);
        min_index = i-1; % o 1 men�� z d�vodu n�sledn�ho o��znut� matice
    end
end

end

