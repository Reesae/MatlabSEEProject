daneetk;

ng = galezie(:,1);
wp = galezie(:,2);
wk = galezie(:,3);
R = galezie(:,4);
L = galezie(:,5);
C = galezie(:,6);
E = galezie(:,7);
fi = galezie(:,8);

f=50;
X = 2*pi*f.*L;

file = fopen('wynik.txt','w');

disp('ng--wp--wk----R_Ohm---L_mH---C_nF--E_kV--fi_st');
for k=1:length(ng),
fprintf('%2.0f %4.2f %4.2f %4.2e %4.2f %4.2e %4.2f %4.2f\n',ng(k),wp(k),wk(k),R(k),L(k),C(k),E(k),fi(k));
fprintf(file,'%2.0f %4.2f %4.2f %4.2e %4.2f %4.2e %4.2f %4.2f\n',ng(k),wp(k),wk(k),R(k),L(k),C(k),E(k),fi(k));
end;

fclose(file);