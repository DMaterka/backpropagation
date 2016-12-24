it = 1;
numit = 10000;
numhidden = 12;
numoutputs = 1;
numhiddenlayers = 1;
hiddens = struct();
outputs = struct();
inputs = [0,0,1,1; 
          1,0,1,0];
expected=[1,0,0,1];

out = zeros(numit,length(inputs));

%%%% initialize weights %%%% 

    for y = 1:numhidden
    hiddens(1,y).bonds = rand(size(inputs,1),1);
    end
for y = 1:numoutputs
    outputs(y).bonds = rand(1,numhidden);
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
