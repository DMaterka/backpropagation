function train(numit,inputs,expected,hiddensdef)
addpath('lib');
if nargin < 2
    %test set
    if nargin < 1
    numit = 1000;
    end

    inputs(:,:,1) = [0; 1];
    expected(1) = [1];
    
    inputs(:,:,2) = [1;0];
    expected(2) = [1];
    
    inputs(:,:,3) = [0; 0];
    expected(3) = [0];
    
    inputs(:,:,4) = [1; 1];
    expected(4) = [0];
    
    hiddensdef = [3,6,8];
end

if nargin == 3
    hiddensdef = [8];
end

%%%% allocate output variable %%%%
out = zeros(numit,1);

%%%% define structure of the network %%%%
def = [size(inputs,1), hiddensdef, size(expected(1),1)];

global big_struct;
big_struct = init_weights(def);
plot2 = figure;
for it = 1:numit

%assign random training set
rnumber = randi([1 size(inputs,3)],1);
big_struct(1,1).value = inputs(1,1,rnumber);
big_struct(1,2).value = inputs(2,1,rnumber);    
    
big_struct = forwardpass(big_struct,def);
diffsum = big_struct(end,1).value - expected(rnumber);
out(it,1) = abs(diffsum);

if(abs(diffsum) < .01 && abs(diffsum) > 0)
    break;
end

big_struct = backpropagation(big_struct,def,expected(rnumber));
clf
print_struct(big_struct,def);

pause(1)
end
close all
abs(diffsum)
plot1 = plot(1:length(out),out(:,:)');
save('neural_xor','big_struct','def')
S(1) = load('gong');
sound(S(1).y,S(1).Fs);


%print_struct(big_struct,def);

end
