function [ J ] = J_shluku( shluk, stred )
%J_SHLUKU vrací sumu odchylek všech bodù ve shluku od støedu

J = 0;

for i=1:length(shluk)
    J = J + norm(shluk(i, :) - stred);
end

end

