function [ J ] = J_shluku( shluk, stred )
%J_SHLUKU vrac� sumu odchylek v�ech bod� ve shluku od st�edu

J = 0;

for i=1:length(shluk)
    J = J + norm(shluk(i, :) - stred);
end

end

