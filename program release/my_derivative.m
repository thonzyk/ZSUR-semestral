function [ output ] = my_derivative( input )
% MY_DERIVATIVE vrátí "derivaci" diskrétní funkce (posloupnosti hodnot).

    output = zeros(length(input), 1);
    
    for ijk=1:length(input)-1
        output(ijk) = input(ijk+1) - input(ijk);
    end
    
    output(end) = output(end-1);
end

