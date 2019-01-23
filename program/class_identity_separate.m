function [ class_identity ] = class_identity_separate( class_identity, css_to_separate )
%% CLASS_IDENTITY_SEPARATE rozd�l� mno�inu identity na hodnoty pat��c�
% do dan� mno�iny a na hodnoty nepat��c� do dan� mno�iny.

for i=1:length(class_identity)
    if class_identity(i) == css_to_separate
        class_identity(i) = 1; % Pat�� do t��dy
    else
        class_identity(i) = -1; % Nepat�� do t��dy
    end
end

end

