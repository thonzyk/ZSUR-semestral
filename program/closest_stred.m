function [ stred_index, distance2 ] = closest_stred( obraz, list_stredu )

min = inf;
min_index = -1;

for i=1:length(list_stredu)
    dist2 = norm2(obraz, list_stredu(i, :));
    if dist2 < min
        min = dist2;
        min_index = i;
    end
end

distance2 = min;
stred_index = min_index;

end

