%% URÈENÍ POÈTU TØÍD POMOCÍ METODY SHLUKOVÉ HLADINY

max_min_rozdil = max_value - min_value;
t = (max_min_rozdil(1)^2 + max_min_rozdil(2)^2)/6; % automatické urèení hladiny

% Inicializace
class_count = 1;
stredy = data(1, :); % TODO: zmìnit název
class_identity(1) = 1;

for j=2:length(data)
    
    x = data(j, :);
    
    d = zeros(class_count, 1);
    
    for k=1:class_count
        rozdil = x-stredy(k, :);
        d(k) = rozdil(1)^2 + rozdil(2)^2; % velikost rozdilu ^2
    end
    
    [favorit, favorit_index] = min(d);
    
    if favorit < t
        class_identity(j) = favorit_index;
    else
        stredy = [stredy; x];
        class_count = class_count + 1;
        class_identity(j) = class_count;
    end
end

