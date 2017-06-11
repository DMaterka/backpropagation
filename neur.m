%%%% script starts %%%%
addpath('lib');
it = 1;
numit = 100;
hiddensdef = [3];
numhiddenlayers = length(hiddensdef);
inputs = [0.01;  0.99];
expected= [0.01];
numoutputs = length(expected);
%%%% allocate output variable %%%%

def = [length(inputs), hiddensdef,numoutputs];

global big_struct;
big_struct = init_weights(def);
big_struct(1,1).value = inputs(1,1)
big_struct(1,2).value = inputs(2,1)
hiddens = big_struct(2,:);
outputs = big_struct(3,:);

out = zeros(numit,length(expected));
for it = 1:numit
init_neur1
backpropagation1
end
out(end,:)'
plot(1:it,out(:,:)');
hold on
p1 = plot(avgdiff,'r');
hold off
save('neural_xor','big_struct','def')
p2 = plot(avgdiff);
%clear;
