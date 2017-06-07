function s = sigmoid_prime(value,maxi, mini)
for(x=1:length(value))
s(1,x) = sigmf(value(x),[maxi,mini]) * (1 -sigmf(value(x),[maxi,mini])) ;
end
end