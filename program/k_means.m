%% --ROZTØÍDÌNÍ OBRAZÙ DO TØÍD METODOU K-MEANS-- %%

% TODO DODÌLAT OBECNÌ

T_1 = []; % seznam indexù
T_2 = []; % seznam indexù
T_3 = []; % seznam indexù

stred_1 = data(1, :); % souøadnice støedu
stred_2 = data(3, :); % souøadnice støedu
stred_3 = data(2, :); % souøadnice støedu

previous_stred_1 = [-inf, -inf]; % souøadnice pøedchozího støedu
previous_stred_2 = [-inf, -inf]; % souøadnice pøedchozího støedu
previous_stred_3 = [-inf, -inf]; % souøadnice pøedchozího støedu

%data_left = data(4:end, :);

% J_1_prubeh = [];
% J_2_prubeh = [];
% J_3_prubeh = [];
% J_prubeh = [0 -1];

% s_1 = 1;
% s_2 = 1;
% s_3 = 1;

while previous_stred_1 ~= stred_1 & previous_stred_2 ~= stred_2 & previous_stred_3 ~= stred_3
    
    T_1 = [];
    T_2 = [];
    T_3 = [];
    
%     J_1 = 0;
%     J_2 = 0;
%     J_3 = 0;
    
    for i=1:length(data)
        [stred_index, distance2] = closest_stred(data(i, :), [stred_1; stred_2; stred_3]);
        
        switch stred_index
            case 1
                T_1 = [T_1, i];
%                 s_1 = s_1 + 1;
%                 J_1 = J_1 + distance2;
            case 2
                T_2 = [T_2, i];
%                 s_2 = s_2 + 1;
%                 J_2 = J_2 + distance2;
            case 3
                T_3 = [T_3, i];
%                 s_3 = s_3 + 1;
%                 J_3 = J_3 + distance2;
            otherwise
                fprintf('chyba: %d\n', stred_index)
        end
    end
    
%     J_1_prubeh = [J_1_prubeh, J_1];
%     J_2_prubeh = [J_2_prubeh, J_2];
%     J_3_prubeh = [J_3_prubeh, J_3];
%     J_prubeh = [J_prubeh J_1+J_2+J_3];
    
    previous_stred_1 = stred_1;
    previous_stred_2 = stred_2;
    previous_stred_3 = stred_3;
    
    stred_1 = avg_vector(T_1, data);
    stred_2 = avg_vector(T_2, data);
    stred_3 = avg_vector(T_3, data);
end


for i=T_1
    class_identity(i) = 1;
end

for i=T_2
    class_identity(i) = 2;
end

for i=T_3
    class_identity(i) = 3;
end

write_my_data(class_identity, 'class_identity');

%plot_data

% figure
% hold on
% plot(J_1_prubeh, 'r')
% plot(J_2_prubeh, 'g')
% plot(J_3_prubeh, 'b')
% plot(J_prubeh, 'k')
% hold off
