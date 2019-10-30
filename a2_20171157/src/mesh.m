function mat = mesh(t)
    temp = [-t:t];
    for i=1:2*t
        temp = [temp,-t:t];
    end
    mat = temp;
end