function init_weights(hiddensdef)

%%%% initialize weights %%%% 
for z = length(hiddensdef)
    for y = 1:hiddensdef(z)
        hiddens(1,y).bonds = rand(size(inputs,1),1);
    end
end

for y = 1:numoutputs
    outputs(y).bonds = rand(1,hiddensdef(end));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end