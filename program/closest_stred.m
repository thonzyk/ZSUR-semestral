function [ stred_index, distance2 ] = closest_stred( obraz, list_stredu )
% CLOSEST_STRED vrací index nejbližšího ze seznamu støedù a jeho vzdálenost

min_value = inf;
min_index = -1;

for i=1:length(list_stredu)
    dist2 = norm_na_2(obraz, list_stredu(i, :));
    if dist2 < min_value
        min_value = dist2;
        min_index = i;
    end
end

distance2 = min_value;
stred_index = min_index;

end

