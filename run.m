function run(inputs)
load('neural_xor.mat')
big_struct(1,1).value = inputs(1,1);
big_struct(1,2).value = inputs(2,1);
big_struct = forwardpass(big_struct,def);
big_struct(end,1).value
end