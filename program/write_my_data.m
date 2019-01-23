function [ output_args ] = write_my_data( data, filename )
% WRITE_MY_DATA zapíše <data/> do souboru s názvem <filename/>

filename = [filename '.txt'];
fileID = fopen(filename,'w');
fprintf(fileID, '%d\n', data);
fclose(fileID);

end

