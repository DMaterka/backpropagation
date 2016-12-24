it = 1;
numit = 1000;
numhidden = 3;
numoutputs = 2;
numhiddenlayers = 1;
hiddenlayersdef = [2]; % number of neurons in each hidden layer 

hiddens = struct();
outputs = struct();
inputs = [0.01,0.01,0.99,0.99; 
          0.99,0.01,0.99,0.01];
expected=[0.99,0.01,0.01,0.99];

out = zeros(numit,length(inputs));

%%%% initialize weights %%%% 
for z = 1:length(hiddenlayersdef)
    for y = 1:hiddenlayersdef(z)
    hiddens(z,y).bonds = rand(size(inputs,1),1);
    end
end
for y = 1:numoutputs
    outputs(y).bonds = rand(1,hiddenlayersdef(end));
end

for it = 1:numit
init_neur
backpropagation
end

out(end,:)'
plot(1:it,out(:,:)')
hold on
p1 = plot(avgdiff,'r')
hold off
bonds_out = outputs.bonds;
bonds_hidden = hiddens.bonds;
save('neural_xor','outputs','hiddens')
p2 = plot(avgdiff)
%clear;
