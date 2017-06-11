for z = 2:length(def)
    for y = 1:def(z)
        big_struct(z,y).sum = 0;
        %%get the sum from inputs, as initial sum%%
        for x = 1:def(z-1)
            partialsum = big_struct(z,y).bonds(x) * big_struct(z-1,x).value;
            hiddensum = big_struct(z,y).sum + partialsum;
            big_struct(z,y).sum = hiddensum;
        end
            big_struct(z,y).value = sigmf(big_struct(z,y).sum,[1,0]);
    end
end

hiddens = big_struct(end-1,:);
outputs = big_struct(end,:);