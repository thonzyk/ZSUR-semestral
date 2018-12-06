function [ class_identity ] = class_identity_separate( class_identity, css_to_separate )

for i=1:length(class_identity)
    if class_identity(i) == css_to_separate
        class_identity(i) = 1; % Patøí do tøídy
    else
        class_identity(i) = -1; % Nepatøí do tøídy
    end
end

end

