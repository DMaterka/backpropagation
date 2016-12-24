        for y = 1:numhidden
        hiddens(1,y).sum = 0;
        %%get the sum from inputs, as initial sum%%
        for x = 1:size(inputs,1)
            hiddens(1,y).sum = hiddens(1,y).bonds(x) * inputs(x,:);
            partialsum = hiddens(1,y).bonds(x) * inputs(x,:);
            hiddensum = hiddens(1,y).sum + partialsum;
            hiddens(1,y).sum = hiddensum;
        end
            hiddens(1,y).value = sigmf(hiddens(1,y).sum,[1,0]);
    end

for z = 2:numhiddenlayers
    for y = 1:numhidden
        hiddens(z,y).sum = 0;
        %%get the sum from inputs, as initial sum%%
        for x = 1:size(inputs,1)
            hiddens(z,y).sum = hiddens(z,y).bonds(x) * inputs(x,:);
            partialsum = hiddens(z,y).bonds(x) * inputs(x,:);
            hiddensum = hiddens(z,y).sum + partialsum;
            hiddens(z,y).sum = hiddensum;
        end
            hiddens(z,y).value = sigmf(hiddens(z,y).sum,[1,0]);
    end
end

for y = 1:numoutputs
    outputs(y).sum = 0;
        for x = 1:numhidden
            outputs(y).sum = outputs(y).sum + outputs(y).bonds(x) * hiddens(z,x).value;
        end
            outputs(y).value = sigmf(outputs(y).sum,[1,0]);
end


