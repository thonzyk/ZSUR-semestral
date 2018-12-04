function [ output_args ] = write_my_data( data, filename )

filename = [filename '.txt'];
fileID = fopen(filename,'w');
fprintf(fileID, '%d\n', data);
fclose(fileID);

end

