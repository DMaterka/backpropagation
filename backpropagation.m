%Backpropagation start
out(it,:,:) = outputs(1).value(:,:);
diffsum = outputs(1).value - expected;
deroutput = sigmoid_prime(outputs(1).value,1,0);

deltaoutput = diffsum .* deroutput;
avgdiff(it) = mean(abs(diffsum));

for y = 1:numoutputs
    for x = 1:numhidden
        tmp = ( deltaoutput / hiddens(1,x).value );
        outputs(y).bonds(x) = outputs(y).bonds(x) - tmp;
        hiddens(1,x).sum = (deltaoutput / outputs(y).bonds(x)) .* sigmoid_prime(hiddens(1,x).value,1,0);
    end
end
% Recalculating initial weights

for y = 1:numhidden
    for x = 1:size(inputs,1)
        hiddens(1,y).bonds(x) = hiddens(1,y).bonds(x) - (hiddens(1,y).sum / inputs(x,:));
    end
end

