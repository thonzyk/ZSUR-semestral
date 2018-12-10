%% T��D�N� DO T��D METODOU KONSTANTN�CH P��R�STK�

beta = 0.1;

pasmo = 0;

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
            
            odhad = sign(q'*x);
            while odhad ~= omega
                q = q + ck*x*omega;
                odhad = sign(q'*x);
                chyba = chyba + 1;
            end
        end
        iterations = iterations + 1;
    end
    
    q_list{css} = q;
end

%% VYKRESLEN�

figure
plot_data
hold on

x = 1.1*min_data_value(1):1.1*data_interval(1):2.2*max_data_value(1);

for q_index=1:length(q_list)
    q = q_list{q_index};
    y = -q(2)/q(3)*x -q(1)/q(3);
    plot(x, y, my_colors_primary{q_index});
end

hold off
axis(1.1*[min_data_value(1) max_data_value(1) min_data_value(2) max_data_value(2)]);
title('Upraven� metoda konstantn�ch p��r�stk�')
xlabel('x_1')
ylabel('x_2')

%% PRO�I�T�N� WORKSPACE
vars = {'ck','beta','chyba', 'css', 'i', 'iterations', 'odhad', 'omega', 'q', 'q_index', 'q_list', 'separated_css_identity', 'x', 'y', 'class_color', 'css_identity', 'css_index', 'norma', 'pasmo'};
clear(vars{:})
clear vars



