%% SKRIPT SLOUŽÍCÍ K NAÈTENÍ DAT ZE SOUBORU

filename_data = 'data.txt';
delimiterIn = ' ';
headerlinesIn = 0;
data = importdata(filename_data,delimiterIn,headerlinesIn);



data = data(1:2000, :); % TODO: OSDTRANIT

max_data_value = max(data);
min_data_value = min(data);
data_interval = max_data_value - min_data_value;

data_dimension = length(data(1, :));









