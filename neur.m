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
out = zeros(numit,length(outputs));

bstruct = init_weights(inputs,hiddensdef,numoutputs);

hiddens = bstruct(2,:);
outputs = bstruct(3,:);

for it = 1:numit
init_neur
backpropagation
end
out(end,:)'
plot(1:it,out(:,:)');
hold on
p1 = plot(avgdiff,'r');
hold off
bonds_out = outputs.bonds;
bonds_hidden = hiddens.bonds;
save('neural_xor','outputs','hiddens','hiddensdef')
p2 = plot(avgdiff);
%clear;
