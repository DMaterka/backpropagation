function run(inputs)

if nargin < 1
    inputs = inputs(1,1);
end
addpath('lib');
load('neural_xor.mat')
big_struct(1,1).value = inputs(1,1);
big_struct(1,2).value = inputs(2,1);
big_struct = forwardpass(big_struct,def);
value = big_struct(end,1).value
sum = big_struct(end,1).sum
end