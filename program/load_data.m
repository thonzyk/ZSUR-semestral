%% --SKRIPT SLOU��C� K NA�TEN� DAT ZE SOUBORU-- %%

filename_data = 'data.txt';
delimiterIn = ' ';
headerlinesIn = 0;
data = importdata(filename_data,delimiterIn,headerlinesIn);

data(:, 1) = data(:, 1) + 1000;

data = data(1:1000, :); % V��ez dat pro v�vojov� ��ely

max_data_value = max(data);
min_data_value = min(data);
data_interval = max_data_value - min_data_value;


% Normalizace dat (posunut�)
center = [max_data_value(1)-data_interval(1)/2 max_data_value(2)-data_interval(2)/2];
data(:, 1) = data(:, 1) - center(1);
data(:, 2) = data(:, 2) - center(2);

max_data_value = max(data);
min_data_value = min(data);
data_interval = max_data_value - min_data_value;
data_dimension = length(data(1, :));


%% PRO�I�T�N� WORKSPACE
vars = {'delimiterIn','v2','headerlinesIn', 'filename_data'};
clear(vars{:})
clear vars
