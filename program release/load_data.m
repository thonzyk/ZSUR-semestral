%% --SKRIPT SLOU��C� K NA�TEN� DAT ZE SOUBORU-- %%

filename_data = 'data_kuhajda.txt';
delimiterIn = ' ';
headerlinesIn = 0;
data = importdata(filename_data,delimiterIn,headerlinesIn);

%data = data(1:31, :); % V��ez dat pro v�vojov� ��ely

max_data_value = max(data);
min_data_value = min(data);
data_interval = max_data_value - min_data_value;

data_dimension = length(data(1, :));


%% PRO�I�T�N� WORKSPACE
vars = {'delimiterIn','v2','headerlinesIn', 'filename_data'};
clear(vars{:})
clear vars