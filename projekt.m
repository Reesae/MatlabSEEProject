dane2;
Yz=zrob_mat(galezie);

%Macierz pradow zwarciowych
Izw=zeros(9,1);
Izw(1,1)=-Ea*Yz(1,1);
Izw(2,1)=-Eb*(cos(-120)+1i*sin(-120))*Yz(2,2);
Izw(3,1)=-Ec*(cos(120)+1i*sin(120))*Yz(3,3);

%Macierz potencjalow wezlowych
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
        end;
         if galezie(k,2)==beg && galezie(k,3)==kon && galezie(k,2)==0
            Ug(m)=V(galezie(k,3));
         end;
    end;
end;

%Dodaje napiecia zrodlowe do galezi
Ug(1)=Ug(1)+Ezr(1);
Ug(2)=Ug(2)+Ezr(2);
Ug(3)=Ug(3)+Ezr(3);

%Macierz Ydiag
Ydiag=zeros(37,37);
for k=1:size(galezie)           
    Ydiag(k,k) = Ydiag(k,k) + 1/(galezie(k,4)+1i*(omega*galezie(k,5)-(1/(omega*galezie(k,6)))));
end;

%Druga metoda
R=galezie(:,4);
L=galezie(:,5); Xl=omega*L;
C=galezie(:,6); Xc=1./(omega*C);
Z=R+1i*(Xl-Xc); 

%Prady galeziowe
Ig = Ug./Z;
Ig2 = Ydiag*Ug;

% disp('ng--wp--wk----R_Ohm---L_mH---C_nF--E_kV--fi_st');
% for k=1:length(ng),
% fprintf('%2.0f %4.2f %4.2f %4.2e %4.2f %4.2e %4.2f %4.2f\n',ng(k),wp(k),wk(k),R(k),L(k),C(k),E(k),fi(k));
% fprintf(file,'%2.0f %4.2f %4.2f %4.2e %4.2f %4.2e %4.2f %4.2f\n',ng(k),wp(k),wk(k),R(k),L(k),C(k),E(k),fi(k));
% end;
% 
% fclose(file);