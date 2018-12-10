%% SKRIPT SLOUŽÍCÍ K VYKRESLENÍ DAT VE 2D prostoru

hold on

% Vykreslení dat v 2D prostoru
for i=1:length(data)
    css_identity = class_identity(i);
    plot(data(i, 1),data(i, 2), my_colors_primary_star{css_identity})
end

hold off

axis(1.1*[min_data_value(1) max_data_value(1) min_data_value(2) max_data_value(2)]) 