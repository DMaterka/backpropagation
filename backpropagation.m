%Backpropagation start
out(it,1) = outputs(1).value;
diffsum = outputs(1).value - expected;
deroutput = sigmoid_prime(outputs(1).value,1,0);

deltaoutput = diffsum .* deroutput;
avgdiff(it) = mean(abs(diffsum));
doutputsum = 0;
weightdiff =0;
for y = 1:numoutputs
    sumoutp = 0;
    doutputsum = sigmoid_prime(outputs(y).sum,1,0) * (diffsum);
    for x = 1:hiddensdef(1)
        weightdiff = doutputsum * hiddens(1,x).value;
        outputs(y).bonds(x) = outputs(y).bonds(x) - weightdiff ;
    end
end


for y = 1:hiddensdef(1)
    dhiddensum =0;
    dhiddensum = doutputsum * outputs(1).bonds(y) * sigmoid_prime(hiddens(1,y).sum,1,0);
    for x = 1:size(inputs,1)
        weightdiff = dhiddensum * inputs(x,1);
        hiddens(1,y).bonds(x) = hiddens(1,y).bonds(x) - dhiddensum ;
    end
end