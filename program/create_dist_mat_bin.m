function [ dist_mat_bin ] = create_dist_mat_bin( distance_matrix, stred_1_i, stred_2_i )
% CREATE_DIST_MAT_BIN Vytvoøí distanèní matici potøebnou pro rozdìlení do
% dvou nových shlukù

dist_mat_bin = zeros(length(distance_matrix), 2);

% Støed 1
for i=1:stred_1_i-1
    dist_mat_bin(i, 1) = distance_matrix(i, stred_1_i);
end
for i=stred_1_i+1:length(distance_matrix)
    dist_mat_bin(i, 1) = distance_matrix(stred_1_i, i);
end

% Støed 2
for i=1:stred_2_i-1
    dist_mat_bin(i, 2) = distance_matrix(i, stred_2_i);
end
for i=stred_2_i+1:length(distance_matrix)
    dist_mat_bin(i, 2) = distance_matrix(stred_2_i, i);
end

end

