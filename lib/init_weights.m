function big_struct = init_weights(inputs,hiddensdef,numoutputs)
global big_struct;

big_struct = struct();

def = [length(inputs), hiddensdef,numoutputs];

for v = 1:length(def)
    for w = 1:def(v)
        if(v <= 1 )
        big_struct(v,w).bonds = [];
        else
        big_struct(v,w).bonds = rand(def(v-1),1);
        end
    end
end


end