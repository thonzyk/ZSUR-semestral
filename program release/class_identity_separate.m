function [ class_identity ] = class_identity_separate( class_identity, css_to_separate )
%% CLASS_IDENTITY_SEPARATE rozdìlí mnoinu identity na hodnoty patøící
% do dané mnoiny a na hodnoty nepatøící do dané mnoiny.

for i=1:length(class_identity)
    if class_identity(i) == css_to_separate
        class_identity(i) = 1; % Patøí do tøídy
    else
        class_identity(i) = -1; % Nepatøí do tøídy
    end
end

end

