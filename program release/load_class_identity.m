%% --SKRIPT SLOU��C� K NA�TEN� DAT ZE SOUBORU-- %%

filename_data = 'class_identity.txt';
delimiterIn = ' ';
headerlinesIn = 0;
class_identity = importdata(filename_data,delimiterIn,headerlinesIn);

pocet_trid = max(class_identity);

patterns_in_class = zeros(1, pocet_trid);

for i=1:length(class_identity)
    patterns_in_class(class_identity(i)) = patterns_in_class(class_identity(i)) + 1;
end

%% PRO�I�T�N� WORKSPACE
vars = {'delimiterIn','v2','headerlinesIn', 'filename_data'};
clear(vars{:})
clear vars