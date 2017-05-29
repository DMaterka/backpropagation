addpath('..');
%%%% script starts %%%%
it = 1;
numit = 1;
numoutputs = 1;
numhiddenlayers = 1;
hiddensdef = [3];
hiddens = struct();
outputs = struct();
inputs = [1;  
          1];
expected=[0];

%%%% allocate output variable %%%%
out = zeros(numit,length(outputs));

%%%% initialize weights %%%% 
for z = length(hiddensdef)
    for y = 1:hiddensdef(z)
        hiddens(z,y).bonds = rand(size(inputs,1),1);
    end
end

hiddens(1,1).bonds = [0.8;0.3];
hiddens(1,2).bonds = [0.4;0.9];
hiddens(1,3).bonds = [0.3;0.5];

for y = 1:numoutputs
    %%output bonds conformed with hiddensdef bonds number
    outputs(y).bonds = rand(1,hiddensdef(end));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

outputs.bonds = [0.3,0.5,0.9];

for it = 1:numit
init_neur
backpropagation
end
out(end,:)'
%plot(1:it,out(:,:)')
%hold on
%p1 = plot(avgdiff,'r');
%hold off
bonds_out = outputs.bonds;
bonds_hidden = hiddens.bonds;
%p2 = plot(avgdiff);
%clear;

assert(floor(out(end,1)*100)/100 == 0.77,'General error','test ok')