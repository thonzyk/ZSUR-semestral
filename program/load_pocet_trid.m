%% --SKRIPT SLOU��C� K NA�TEN� DAT ZE SOUBORU-- %%

filename_data = 'pocet_trid.txt';
delimiterIn = ' ';
headerlinesIn = 0;
pocet_trid = importdata(filename_data,delimiterIn,headerlinesIn);

%% PRO�I�T�N� WORKSPACE
vars = {'delimiterIn','v2','headerlinesIn', 'filename_data'};
clear(vars{:})
clear vars