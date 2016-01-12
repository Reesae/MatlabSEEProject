dane2;
Yz = zrob_mat(galezie);

%Macierz Ezr
Ezr=zeros(37,1);
Ezr(1,1) = Ea;
Ezr(2,1) = Eb*(cos(-pi*2/3)+1i*sin(-pi*2/3));
Ezr(3,1) = Ec*(cos(pi*2/3)+1i*sin(pi*2/3));

%Macierz pradow zwarciowych
Izw = zeros(9,1);
Izw(1,1) = Ezr(1,1)*Yz(1,1);
Izw(2,1) = Ezr(2,1)*Yz(2,2);
Izw(3,1) = Ezr(3,1)*Yz(3,3);

%Macierz potencjalow wezlowych
V = Yz^(-1);
V = V * Izw;

%Macierz Ug
Ug = zeros(37,1);
for m=1:size(galezie)
    Ug(m,1) = V(galezie(m,3));
    if galezie(m,2)~=0
         Ug(m,1) = Ug(m,1) - V(galezie(m,2));
    end;
end;


%Macierz admitancji ga³êziowych
R = galezie(:,4);
L = galezie(:,5); 
C = galezie(:,6);
Xc = zeros(37,1);
Xl = zeros(37,1);
Z = zeros(37,1);
Y = zeros(37,1);

for k=1:size(C)
    Xc(k,1) = 1/(omega * C(k,1));
    Xl(k,1) = omega * L(k,1);
    Z(k,1) = R(k,1) + 1i * (Xl(k,1) - Xc(k,1));
    Y(k,1) = 1/Z(k,1);
end;

%Prady galeziowe
Ig = zeros(37,1);
for k=1:37
    Ig(k,1) = (Ug(k,1) - Ezr(k,1))*Y(k,1);
end;

 for i=1:3
     Ig(i,1) = 0;
     for j=3:size(galezie)
         if galezie(j,2) == i || galezie(j,3) == i
             Ig(i,1) = Ig(i,1) + Ig(j);
         end
     end
 end

%Macierz fi
fi = radtodeg(angle(Ug));

%Pgen;
for k=1:3
Pgen(k) = real(Ezr(k) * conj(Ig(k)));
end;
for k=4:size(galezie)
    Pgen(k) = 0;
end;

%Qgen;
for k=1:3
Qgen(k) = imag(Ezr(k) * conj(Ig(k)));
end;

for k=4:size(galezie)
    Qgen(k) = 0;
end;

%Podb;
for k=1:3
    Podb(k) = 0;
end;

for k=4:size(galezie)
    Podb(k) = real(Ug(k) * conj(Ig(k)));
end;
%Qgen;
for k=1:3
    Qodb(k) = 0;
end;

for k=4:size(galezie)
    Qodb(k) = imag(Ug(k) * conj(Ig(k)));
end;
%Gen_fi
genfi = 0;%radtodeg(angle(Pgen))-radtodeg(angle(Qgen));


file = fopen('wyniki.txt','w');
 
fprintf(file,'nr_gal--wp--wk---U [kV] --- fi---I [kA]--gen fi--gen P--gen Q--odb P -- odb Q\n');
for k=1:size(galezie)
    fprintf(file,'%2d %7d %3d  %4.2e  %4.0f  %4.2e %4.2f  %4.0f  %7.2f %7.2f %7.2f \n',k,galezie(k,2),galezie(k,3),abs(Ug(k)/1000),fi(k),abs(Ig(k))/1000,genfi,Pgen(k)/1000000,Qgen(k)/1000000,Podb(k)/1000000,Qodb(k)/1000000);
end;

fclose(file);