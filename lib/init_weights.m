function big_struct = init_weights(def)
global big_struct;

big_struct = struct();

for v = 1:length(def)
    for w = 1:def(v)
        if(v <= 1 )
        big_struct(v,w).bonds = [];
        else
        big_struct(v,w).bonds = rand(def(v-1),1);
        big_struct(v,w).sum = 0;
        big_struct(v,w).value = 0;
        end
    end
end


end