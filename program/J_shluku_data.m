function [ J ] = J_shluku_data( shluk, stred, data )
%J_SHLUKU vrac� sumu odchylek v�ech bod� ve shluku od st�edu

J = 0;

for i=1:length(shluk)
    index_nejaky = shluk(i);
    dato = data(index_nejaky, :);
    J = J + norm(dato - stred);
end

end

