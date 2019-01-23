%% KOHENENOVA S͍

% Po��te�n� v�hovou matici pln�m n�hodn�mi ��sly
% v intervalu <-1, 1>
min_interval = -1; max_interval = 1;
W = min_interval + (max_interval-min_interval) * rand(3, 2); % V�hov� matice

X = data';

c = 0.5;

for i=1:length(X)
   x = X(:, i);
   y =  W*x;
   
   [max_value, max_index] = max(y);
    
   
   W(max_index, :) = W(max_index, :) + c*(x'-W(max_index, :));
   W(max_index, :) = W(max_index, :)/norm(W(max_index, :));
end
