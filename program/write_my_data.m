function [ output_args ] = write_my_data( data, filename )
% WRITE_MY_DATA zap�e <data/> do souboru s n�zvem <filename/>

filename = [filename '.txt'];
fileID = fopen(filename,'w');
fprintf(fileID, '%d\n', data);
fclose(fileID);

end

