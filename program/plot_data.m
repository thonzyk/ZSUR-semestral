%% SKRIPT SLOUŽÍCÍ K VYKRESLENÍ DAT VE 2D prostoru

hold on

% Vykreslení dat v 2D prostoru
for j=1:length(data)
    switch class_identity(j)
        case 1
            class_color = 'r*';
        case 2
            class_color = 'g*';
        case 3
            class_color = 'b*';
        otherwise
             class_color = 'k*';
    end
    plot(data(j, 1),data(j, 2), class_color)
end

hold off

axis(1.1*[min_value(1) max_value(1) min_value(2) max_value(2)]) 