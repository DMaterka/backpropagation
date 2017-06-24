function print_struct(big_struct,def)
    if nargin<1
        load 'neural_xor'
    end
    c_radius = 2;
    c_margin = 1;
    c_space = c_radius*2 + c_margin;
        for j = 1:size(big_struct,1)
            for k = 1:size(big_struct,2)
                if(size(big_struct(j,k).value) > 0)
                    big_struct(j,k).xpos = (j*10);
                    if def(j) ~= 1
                        big_struct(j,k).ypos = ((size(big_struct,2)*c_space - def(j)) / def(j)^2) + size(big_struct,2)*c_space/def(j) * (k-1);
                    else
                        big_struct(j,k).ypos = size(big_struct,2)*c_space/2;
                    end
                    
                    circle2(big_struct(j,k).xpos,big_struct(j,k).ypos,c_radius);
                    text(big_struct(j,k).xpos,big_struct(j,k).ypos, num2str(round(big_struct(j,k).value *100)/100),'color','red','FontSize',10,'FontWeight','bold');
                    if(j>1)
                        for l = 1:size(big_struct(j,k).bonds,1)
                            if size(big_struct(j-1,l).value) > 0
                            line([big_struct(j,k).xpos, big_struct(j-1,l).xpos ],[big_struct(j,k).ypos , big_struct(j-1,l).ypos]);
                            end
                        end
                    end
                end
            end
        end 
end


