function [ class_identity ] = class_identity_separate( class_identity, css_to_separate )

for i=1:length(class_identity)
    if class_identity(i) == css_to_separate
        class_identity(i) = 1; % Pat�� do t��dy
    else
        class_identity(i) = -1; % Nepat�� do t��dy
    end
end

end

