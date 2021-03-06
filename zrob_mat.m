function [Yz] = zrob_mat(galezie)

dane2;

%Macierz impedancji wzajemnych
Yz=zeros(9,9);
for m=1:size(galezie)
    
    beg = galezie(m,2);
    kon = galezie(m,3);
    
    if beg == 0
        continue;
    end;
    
    Yz(beg,kon) = -1/(galezie(m,4) + 1i*(omega*galezie(m,5) - (1/(omega * galezie(m,6)))));
    Yz(kon,beg) = -1/(galezie(m,4) + 1i*(omega*galezie(m,5) - (1/(omega * galezie(m,6)))));
    
    for k=1:size(galezie)
        if galezie(k,2) == beg && galezie(k,3) == kon && m ~= galezie(k,1)
            Yz(beg,kon) = Yz(beg,kon) - 1/(galezie(k,4) + 1i*(omega * galezie(k,5) - (1/(omega * galezie(k,6)))));
            Yz(kon,beg) = Yz(kon,beg) - 1/(galezie(k,4) + 1i*(omega * galezie(k,5) - (1/(omega * galezie(k,6)))));
        end;
    end;
end;

%Przekatne Yz
for m=1:9
    for k=1:size(galezie)
        if galezie(k,2) == m || galezie(k,3) == m
            Yz(m,m) = Yz(m,m) + 1/(galezie(k,4) + 1i*(omega*galezie(k,5) - (1/(omega * galezie(k,6)))));
        end;
    end;
end
