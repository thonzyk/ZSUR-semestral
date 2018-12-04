function [ output ] = klouzavy_prumer( input, sirka_pasma )

output = zeros(length(input), 1);
sum = 0;

for i=1:length(input)-sirka_pasma
    sum = 0;
    for j=0:sirka_pasma-1
        sum = sum + input(i+j);
    end
    output(i) = sum;
end




end

