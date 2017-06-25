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
    
    hiddensdef = [8,8];
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

for it = 1:numit

%assign random training set
rnumber = randi([1 size(inputs,3)],1);
big_struct(1,1).value = inputs(1,1,rnumber);
big_struct(1,2).value = inputs(2,1,rnumber);    
    
big_struct = forwardpass(big_struct,def);
diffsum = expected(rnumber) - big_struct(end,1).value;
out(it,1) = abs(diffsum);

%if(abs(diffsum) < .01 && abs(diffsum) > 0)
%    break;
%end

big_struct = backpropagation(big_struct,def,expected(rnumber));
%clf
%print_struct(big_struct,def);
%pause(0.1)
end

%%%%% stub of a printing function
close all
abs(diffsum);
plot1 = figure;
hold on
plot(1:length(out),out(:,:));
b = polyfit(1:numit,out',2);
lin = (b(1) * 1:length(out)).^2 + b(2) .* 1:length(out) + b(3);
vals = polyval(b,lin);
plot(1:length(vals'),vals','color','red');
hold off
save('neural_xor','big_struct','def','out')
plot2 = figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S(1) = load('gong');
sound(S(1).y,S(1).Fs);


print_struct(big_struct,def);
for inp = 1:size(inputs,3)
    inputs(:,:,inp)
    run(inputs(:,:,inp))
end
end
