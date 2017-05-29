%Backpropagation start
out(it,1) = outputs(1).value;
diffsum = outputs(1).value - expected;
deroutput = sigmoid_prime(outputs(1).value,1,0);

deltaoutput = diffsum .* deroutput;
avgdiff(it) = mean(abs(diffsum));

for y = 1:numoutputs
    for x = 1:hiddensdef(1)
        tmp = ( deltaoutput / hiddens(end,x).value );
        outputs(y).bonds(x) = outputs(y).bonds(x) - tmp;
        hiddens(end,x).sum = (deltaoutput / outputs(y).bonds(x)) .* sigmoid_prime(hiddens(end,x).value,1,0);
    end
end

% code for adding inter-multilayer calculations



%

% Recalculating initial weights
% mhl won't change due to multilayers
for y = 1:hiddensdef(1)
    for x = 1:size(inputs,1)
        hiddens(1,y).bonds(x) = hiddens(1,y).bonds(x) - (hiddens(1,y).sum / inputs(x,:));
    end
end

