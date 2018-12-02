%% SKRIPT SLOUŽÍCÍ K NAÈTENÍ DAT ZE SOUBORU

filename_data = 'data.txt';
delimiterIn = ' ';
headerlinesIn = 0;
data = importdata(filename_data,delimiterIn,headerlinesIn);

max_value = max(data);
min_value = min(data);

data = data(1:1000, :); % TODO: OSDTRANIT

data_length = length(data);