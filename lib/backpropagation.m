function big_struct = backpropagation(big_struct,def,expected)

%iterate layers backwards 
for z = fliplr(2:length(def))
    
    for y = 1:def(z)
        
         if(z == length(def))
                doutputsum(z,y) = sigmoid_prime(big_struct(z,y).sum,1,0) * (big_struct(z,y).sum - expected);
         else
                doutputsum(z,y) = 0;
                for i = 1:def(z+1)
                    doutputsum(z,y) =+ doutputsum(end,1) * big_struct(z+1,i).oldbonds(y) * sigmoid_prime(big_struct(z,y).sum,1,0);
                end
         end
        
        for x = 1:length(big_struct(z,y).bonds)
            weightdiff = doutputsum(z,y) * big_struct(z-1,x).value;         
            big_struct(z,y).oldbonds(x) = big_struct(z,y).bonds(x);
            big_struct(z,y).bonds(x) = big_struct(z,y).bonds(x) - weightdiff ;
        end
    end
end

end
