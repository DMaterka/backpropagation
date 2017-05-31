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

hiddens(1,1).bonds = [0.8;0.2];
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
    if(it==1)
    assert(floor(out(end,1)*100)/100 == 0.77,'General error','test ok')
    end
end
out(end,:)'

bonds_out = outputs.bonds;
bonds_hidden = hiddens.bonds;

w1= 0.7921;
assert(abs(hiddens(1,1).bonds(1)-w1) < 0.1,'assigning new weights seems to be spoiled');    
w2= 0.3887;   
assert(abs(hiddens(1,2).bonds(1)-w2) < 0.1,'assigning new weights seems to be spoiled');   
w3= 0.2741;    
assert(abs(hiddens(1,3).bonds(1)-w3) < 0.1,'assigning new weights seems to be spoiled');   
w4= 0.1921;
assert(abs(hiddens(1,1).bonds(2)-w4) < 0.1,'assigning new weights seems to be spoiled');   
w5= 0.8887;     
assert(abs(hiddens(1,2).bonds(2)-w5) < 0.1,'assigning new weights seems to be spoiled');   
w6= 0.4741;    
assert(abs(hiddens(1,3).bonds(2)-w6) < 0.1,'assigning new weights seems to be spoiled');   
w7= 0.2020;    
assert(abs(outputs(1,1).bonds(1)-w7) < 0.1,'assigning new weights seems to be spoiled');   
w8= 0.3940; 
assert(abs(outputs(1,1).bonds(2)-w8) < 0.1,'assigning new weights seems to be spoiled');   
w9= 0.8060;
assert(abs(outputs(1,1).bonds(3)-w9) < 0.1,'assigning new weights seems to be spoiled');   

%clear;