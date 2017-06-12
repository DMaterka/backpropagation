addpath('..');
addpath('../lib');
%%%% script starts %%%%
it = 1;

hiddensdef = [3];
inputs = [1;1];
expected=[0];

%%%% allocate output variable %%%%
out = zeros(numit,length(expected));

def = [length(inputs), hiddensdef, length(expected)];

big_struct(1,1).value = inputs(1,1);
big_struct(1,2).value = inputs(2,1);
big_struct(2,1).bonds = [0.8;0.2];
big_struct(2,2).bonds = [0.4;0.9];
big_struct(2,3).bonds = [0.3;0.5];
big_struct(3,1).bonds = [0.3,0.5,0.9];

big_struct = forwardpass(big_struct,def);
out(it,1) = big_struct(end,1).value;
diffsum = big_struct(end,1).value - expected;
big_struct = backpropagation(big_struct,def,diffsum);

assert(floor(out(end,1)*100)/100 == 0.77,strcat('General error', num2str(out(end,1))))
out(end,1)
w1= 0.7921;
assert(abs(big_struct(2,1).bonds(1)-w1) < 0.1,'assigning new weights seems to be spoiled');    
w2= 0.3887;   
assert(abs(big_struct(2,2).bonds(1)-w2) < 0.1,'assigning new weights seems to be spoiled');   
w3= 0.2741;    
assert(abs(big_struct(2,3).bonds(1)-w3) < 0.1,'assigning new weights seems to be spoiled');   
w4= 0.1921;
assert(abs(big_struct(2,1).bonds(2)-w4) < 0.1,'assigning new weights seems to be spoiled');   
w5= 0.8887;     
assert(abs(big_struct(2,2).bonds(2)-w5) < 0.1,'assigning new weights seems to be spoiled');   
w6= 0.4741;    
assert(abs(big_struct(2,3).bonds(2)-w6) < 0.1,'assigning new weights seems to be spoiled');   
w7= 0.2020;    
assert(abs(big_struct(3,1).bonds(1)-w7) < 0.1,'assigning new weights seems to be spoiled');   
w8= 0.3940; 
assert(abs(big_struct(3,1).bonds(2)-w8) < 0.1,'assigning new weights seems to be spoiled');   
w9= 0.8060;
assert(abs(big_struct(3,1).bonds(3)-w9) < 0.1,'assigning new weights seems to be spoiled');   

clearvars -global;