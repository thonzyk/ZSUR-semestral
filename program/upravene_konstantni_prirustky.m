%% TØÍDÌNÍ DO TØÍD METODOU KONSTANTNÍCH PØÍRÙSTKÙ

beta = .1;

pasmo = 4;

q_list = {};

for css=1:pocet_trid
    q_list{css} = rand(data_dimension+1, 1);
end

iterations = 0;

for css=1:pocet_trid
    
    q = q_list{css};
    
    separated_css_identity = class_identity_separate(class_identity, css);
    
    chyba = inf;
    while chyba > 0;
        chyba = 0;
        
        for i=1:length(data)
            x = [1 data(i, :)]';
            omega = separated_css_identity(i);
            norma = norm_na_2(x, zeros(1, length(x)));
            
            ck = beta / norma;
            
            znovu = 1;
            while znovu;
                znovu = 0;
                
                porovnani = q'*x*omega;
                
                if porovnani < pasmo
                    q = q + ck*x*omega;
                    odhad = sign(q'*x);
                    chyba = chyba + 1;
                    znovu = 1;
                end
                
            end
        end
        iterations = iterations + 1;
    end
    
    q_list{css} = q;
end

%% VYKRESLENÍ

figure
hold on

% Rastr
sz = 10;
for x_1=min_data_value(1):rastr:max_data_value(1)
    for x_2=min_data_value(2):rastr:max_data_value(2)
        omega_list = zeros(pocet_trid, 1);
        
        for q_index=1:length(q_list)
            q = q_list{q_index};
            omega = q(2)*x_1 + q(3)*x_2 + q(1);
            if omega > 0
                omega_list(q_index) = 1;
            end
        end
        
        if sum(omega_list) == 1
            [empty, color_i] = ismember(1, omega_list);
            class_color = my_colors_secondary{color_i};
            scatter(x_1+center(1), x_2+center(2), sz, 'MarkerEdgeColor', class_color)
        else
            scatter(x_1+center(1), x_2+center(2), sz, 'MarkerEdgeColor', [0 0 0])
        end
        
    end
end

% Oddìlující pøímky
x = 1.1*min_data_value(1):1.1*data_interval(1):2.2*max_data_value(1);
for q_index=1:length(q_list)
    q = q_list{q_index};
    y = -q(2)/q(3)*x -q(1)/q(3);
    plot(x+center(1), y+center(2), my_colors_primary{q_index});
end

% Trénovací data
plot_data

hold off
axis([min_data_value(1)+center(1) max_data_value(1)+center(1) min_data_value(2)+center(2) max_data_value(2)+center(2)]) 
title_name = ['Upravená metoda konstantních pøírùstkù - PTC: ', num2str(iterations)];
title(title_name)
xlabel('x_1')
ylabel('x_2')

%% PROÈIŠTÌNÍ WORKSPACE
vars = {'ck','beta','chyba', 'css', 'i', 'iterations', 'odhad', 'omega', 'q', 'q_index', 'q_list', 'separated_css_identity', 'x', 'y', 'class_color', 'css_identity', 'css_index', 'norma', 'pasmo', 'ans', 'color_i', 'empty', 'omega_list', 'porovnani', 'sz', 'title_name', 'x_1', 'x_2', 'znovu'};
clear(vars{:})
clear vars



