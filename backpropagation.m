%Backpropagation start
out(it,1) = big_struct(end,1).value;
diffsum = big_struct(end,1).value - expected;
deroutput = sigmoid_prime(big_struct(end,1).value,1,0);

deltaoutput = diffsum .* deroutput;
avgdiff(it) = mean(abs(diffsum));
doutputsum = 0;
weightdiff = 0;
for y = 1:def(3)
    sumoutp = 0;
    doutputsum = sigmoid_prime(big_struct(3,1).sum,1,0) * (diffsum);
    for x = 1:def(2)
        weightdiff = doutputsum * big_struct(2,x).value;
        big_struct(3,1).bonds(x) = big_struct(3,1).bonds(x) - weightdiff ;
    end
end


for y = 1:def(2)
    dhiddensum =0;
    dhiddensum = doutputsum * big_struct(end,1).bonds(y) * sigmoid_prime(big_struct(2,y).sum,1,0);
    for x = 1:size(inputs,1)
        weightdiff = dhiddensum * big_struct(1,x).value;
        big_struct(2,y).bonds(x) = big_struct(2,y).bonds(x) - dhiddensum ;
    end
end

