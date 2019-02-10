%% SKRIPT SLOUŽÍCÍ K VYKRESLENÍ DAT VE 2D prostoru

hold on

exist class_identity;

% Vykreslení dat v 2D prostoru
if ans
    % Barevnì podle tøíd
    for i=1:length(data)
        css_identity = class_identity(i);
        plot(data(i, 1)+center(1),data(i, 2)+center(2), my_colors_primary_star{css_identity})
    end
else
    % Jednobarevnì
    for i=1:length(data)
        plot(data(i, 1),data(i, 2), '*k')
    end
end



hold off

axis([min_data_value(1)+center(1) max_data_value(1)+center(1) min_data_value(2)+center(2) max_data_value(2)+center(2)]) 