%% SKRIPT SLOUŽÍCÍ K NAÈTENÍ DAT ZE SOUBORU

filename_data = 'data.txt';
delimiterIn = ' ';
headerlinesIn = 0;
data = importdata(filename_data,delimiterIn,headerlinesIn);



%data = data(1:1000, :); % TODO: OSDTRANIT

max_data_value = max(data);
min_data_value = min(data);









