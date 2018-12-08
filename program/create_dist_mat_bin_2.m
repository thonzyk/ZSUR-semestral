function [ dist_mat_bin ] = create_dist_mat_bin_2(stred_1, stred_2, pracovni_shluk_1, pracovni_shluk_2 )
%CREATE_DIST_MAT_BIN_FROM_DATA Vytvoøí distanèní matici potøebnou pro 
% rozdìlení do dvou nových shlukù

dist_mat_bin = zeros(length(pracovni_shluk_1)+length(pracovni_shluk_2), 2);


for i=1:length(pracovni_shluk_1)
    dist_mat_bin(i, 1) = norm(stred_1 - pracovni_shluk_1(i));
end

for i=length(pracovni_shluk_1)+1:length(pracovni_shluk_1)+length(pracovni_shluk_2)
    dist_mat_bin(i, 2) = norm(stred_2 - pracovni_shluk_2(i-length(pracovni_shluk_1)));
end

end

