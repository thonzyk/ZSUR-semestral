function [ output ] = my_derivative( input )

    output = zeros(length(input), 1);
    
    for ijk=1:length(input)-1
        output(ijk) = input(ijk+1) - input(ijk);
    end
    
    output(end) = output(end-1);
end

