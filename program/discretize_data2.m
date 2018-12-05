function [ data_changed ] = discretize_data2( data, interval_length )

data_min1 = min(data);
data_min = [];

for i=1:length(data)
    data_min = [data_min; data_min1];
end

data_changed = data - data_min;

data_min = min(data_changed);
data_max = max(data_changed);
%interval_length = (data_max - data_min) / intervals_per_dimension;
data_interval = [];

for i=1:length(data)
    data_interval = [data_interval; interval_length];
end

data_changed = data_changed ./ data_interval;


data_changed = ceil(data_changed);

for i=1:length(data_changed)
    if data_changed(i, 1) < 1
        data_changed(i, 1) = 1;
    end
    
    if data_changed(i, 2) < 1
        data_changed(i, 2) = 1;
    end
end


end

