function [ dist_mat_bin ] = create_dist_mat_bin( distance_matrix, stred_1_i, stred_2_i )
% CREATE_DIST_MAT_BIN Vytvo�� distan�n� matici pot�ebnou pro rozd�len� do
% dvou nov�ch shluk�

dist_mat_bin = zeros(length(distance_matrix), 2);

% St�ed 1
for i=1:stred_1_i-1
    dist_mat_bin(i, 1) = distance_matrix(i, stred_1_i);
end
for i=stred_1_i+1:length(distance_matrix)
    dist_mat_bin(i, 1) = distance_matrix(stred_1_i, i);
end

% St�ed 2
for i=1:stred_2_i-1
    dist_mat_bin(i, 2) = distance_matrix(i, stred_2_i);
end
for i=stred_2_i+1:length(distance_matrix)
    dist_mat_bin(i, 2) = distance_matrix(stred_2_i, i);
end

end

