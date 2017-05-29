for i=1:size(inputs,1)
   
    circle2(1,(i*2)+i,1);
    
end

for j=1:size(hiddensdef,1)
    for jj = 1:hiddensdef(j,1)
    circle2((i*2)*j,(jj*2)+jj-2*i/2,1);
    end
end

for k=1:size(numoutputs,1)
   
    circle2((4*j)+3,(k*2)+k+2*j/2,1);
    
end