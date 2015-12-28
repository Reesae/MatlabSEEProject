dane2;

% ng = galezie(:,1);
% wp = galezie(:,2);
% wk = galezie(:,3);
% R = galezie(:,4);
% L = galezie(:,5);
% C = galezie(:,6);
% E = galezie(:,7);
% fi = galezie(:,8);
% file = fopen('wynik.txt','w');

Yz=zeros(9,9);

for m=1:size(galezie)
    
    beg = galezie(m,2);
    kon = galezie(m,3);
    
    if beg==0
        continue;
    end;
    
    if galezie(m,6) > 1e-11
         Yz(beg,kon) = -1/(galezie(m,4)+1i*omega*galezie(m,5)+(1/(1i*omega*galezie(m,6))));
    else Yz(beg,kon) = -1/(galezie(m,4)+1i*omega*galezie(m,5));
    end;
    
    for k=1:size(galezie)
        if (galezie(k,2)) == beg && (galezie(k,3)) == kon
            if(galezie(k,6) > 1e-11)
                 Yz(beg,kon) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5)+(1/(1i*omega*galezie(k,6))));
            else Yz(beg,kon) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5));
            end;
        end;
    end;
end;

for m=1:size(galezie)
    
    kon = galezie(m,2);
    beg = galezie(m,3);
    
    if kon==0
        continue;
    end;
    
    if galezie(m,6) ~= 0
         Yz(beg,kon) = -1/(galezie(m,4)+1i*omega*galezie(m,5)+(1/(1i*omega*galezie(m,6))));
    else Yz(beg,kon) = -1/(galezie(m,4)+1i*omega*galezie(m,5));
    end;
    
    for k=1:size(galezie)
        if galezie(k,2) == beg && galezie(k,3) == kon
            if(galezie(k,6) ~= 0)
                 Yz(beg,kon) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5)+(1/(1i*omega*galezie(k,6))));
            else Yz(beg,kon) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5));
            end;
        end;
    end;
end;



%Przekatne Yz
for m=1:9
     
    for k=1:size(galezie)
        if galezie(k,2) == m || galezie(k,3) == m
            if galezie(k,6) ~= 0
                 Yz(m,m) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5)+(1/(1i*omega*galezie(k,6))));
            else Yz(m,m) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5));
            end;
        end;
    end;
    
end

Izw=zeros(9,1);

Izw(1,1)=-Ea*Yz(1,1);
Izw(2,1)=-Eb*(cos(-120)+1i*sin(-120))*Yz(2,2);
Izw(3,1)=-Ec*(cos(120)+1i*sin(120))*Yz(3,3);
V=Yz\Izw;
%Macierz Ezr
Ezr=zeros(37,1);
Ezr(1,1)=Ea;
Ezr(2,1)=Eb*(cos(-120)+1i*sin(-120));
Ezr(3,1)=Ec*(cos(120)+1i*sin(120));

%Macierz Ug
Ug=zeros(37,1);
for m=1:size(galezie)
     beg = galezie(m,2);
     kon = galezie(m,3);
    for k=1:size(galezie)
        if galezie(k,2)== beg && galezie(k,3)==kon && galezie(k,2)~=0
            Ug(m)=V(galezie(k,3))-V(galezie(k,2));
        end
         if galezie(k,2)==beg && galezie(k,3)==kon && galezie(k,2)==0
            Ug(m)=V(galezie(k,3));
        end
    end
end

Ug(1)=-Ezr(1);
Ug(2)=-Ezr(2);
Ug(3)=-Ezr(3);


%Macierz Ydiag
Ydiag=zeros(37,37);
for k=1:size(galezie)
            if galezie(k,6) ~= 0
                 Ydiag(k,k) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5)+(1/(1i*omega*galezie(k,6))));
            else Ydiag(k,k) =+ -1/(galezie(k,4)+1i*omega*galezie(k,5));
            end;
end;
R=galezie(:,4);
L=galezie(:,5)*10^-3; Xl=omega*L;
C=galezie(:,6)*10^-9; Xc=1./(omega*C);
Z=R+1i*(Xl-Xc); %impedancje poszczególnych ga³êzi

Ig=Ug./Z;

% disp('ng--wp--wk----R_Ohm---L_mH---C_nF--E_kV--fi_st');
% for k=1:length(ng),
% fprintf('%2.0f %4.2f %4.2f %4.2e %4.2f %4.2e %4.2f %4.2f\n',ng(k),wp(k),wk(k),R(k),L(k),C(k),E(k),fi(k));
% fprintf(file,'%2.0f %4.2f %4.2f %4.2e %4.2f %4.2e %4.2f %4.2f\n',ng(k),wp(k),wk(k),R(k),L(k),C(k),E(k),fi(k));
% end;
% 
% fclose(file);