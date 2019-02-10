function [ J ] = J_shluku_data( shluk, stred, data )
%J_SHLUKU vrací sumu odchylek všech bodù ve shluku od støedu

J = 0;

for i=1:length(shluk)
    index_nejaky = shluk(i);
    dato = data(index_nejaky, :);
    J = J + norm(dato - stred);
end

end

