%% SKRIPT SLOUŽÍCÍ K NAÈTENÍ DAT ZE SOUBORU

filename_data = 'class_identity.txt';
delimiterIn = ' ';
headerlinesIn = 0;
class_identity = importdata(filename_data,delimiterIn,headerlinesIn);

class_count = max(class_identity);

patterns_in_class = zeros(1, class_count);

for i=1:length(class_identity)
    patterns_in_class(class_identity(i)) = patterns_in_class(class_identity(i)) + 1;
end
