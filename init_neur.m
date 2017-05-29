for z = length(hiddensdef)   
    for y = 1:hiddensdef(z)
        hiddens(z,y).sum = 0;
        %%get the sum from inputs, as initial sum%%
        for x = 1:size(inputs,1)
            partialsum = hiddens(1,y).bonds(x) * inputs(x,:);
            hiddensum = hiddens(1,y).sum + partialsum;
            hiddens(1,y).sum = hiddensum;
        end
            hiddens(1,y).value = sigmf(hiddens(1,y).sum,[1,0]);
    end
end

for y = 1:numoutputs
    outputs(y).sum = 0;
    for x = 1:hiddensdef(end)
        outputs(y).sum = outputs(y).sum + outputs(y).bonds(x) * hiddens(end,x).value;
    end
        outputs(y).value = sigmf(outputs(y).sum,[1,0]);
end


