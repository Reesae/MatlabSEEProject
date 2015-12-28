b=8;
Ea=230000;
Eb=230000;
Ec=230000;
Cp=(0.25+b)*1e-9;
Cg=(0.6+0.01*b)*1e-6;
Rl=6.5;
Ll=0.150 - b/1000;
Ro=500+20*b;
Lo=0.5-0.01*b;
Rz=10;
omega=2*50*pi;


galezie=[
%ng--wp--wk----R_Ohm----L_H-----C_F----E_V---fi_st
  1   0   1     1e-6       0     1e9     Ea      0  %napiecie fazowe UA    
  2   0   2     1e-6       0     1e9     Eb   -120  %napiecie fazowe UB  
  3   0   3     1e-6       0     1e9     Ec    120  %napiecie fazowe UC  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  4   0   1        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L1 0 
  5   0   2        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L2 0   
  6   0   3        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L3 0 
  7   1   2        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L1 L2   
  8   2   3        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L2 L3  
  9   3   1        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L3 L1   
 10   1   4        Rl      Ll     1e9     0    0    %impedancja wzd³u¿na fazy L1 
 11   2   5        Rl      Ll     1e9     0    0    %impedancja wzd³u¿na fazy L2   
 12   3   6        Rl      Ll     1e9     0    0    %impedancja wzd³u¿na fazy L3
 13   6   4        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L3 L1 
 14   5   6        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L2 L3 
 15   4   5        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L1 L2
 16   0   6        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L3 0 
 17   0   5        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L2 0
 18   0   4        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L1 0  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 19   0   4        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L1 0 
 20   0   5        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L2 0   
 21   0   6        0       0      Cg      0    0    %pojemnoœæ faza ziemia  L3 0 
 22   4   5        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L1 L2   
 23   5   6        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L2 L3  
 24   6   4        0       0      Cp      0    0    %pojemnoœæ miêdzy fazowa L3 L1   
 25   4   7       Rl      Ll     1e9      0    0    %impedancja wzd³u¿na fazy L1 
 26   5   8       Rl      Ll     1e9      0    0    %impedancja wzd³u¿na fazy L2   
 27   6   9       Rl      Ll     1e9      0    0    %impedancja wzd³u¿na fazy L3
 28   9   7        0       0     Cp       0    0    %pojemnoœæ miêdzy fazowa L3 L1
 29   8   9        0       0     Cp       0    0    %pojemnoœæ miêdzy fazowa L2 L3 
 30   7   8        0       0     Cp       0    0    %pojemnoœæ miêdzy fazowa L1 L2
 31   0   9        0       0     Cg       0    0    %pojemnoœæ faza ziemia  L3 0 
 32   0   8        0       0     Cg       0    0    %pojemnoœæ faza ziemia  L2 0
 33   0   7        0       0     Cg       0    0    %pojemnoœæ faza ziemia  L1 0 

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 34   0   7       Ro      Lo     1e9       0    0    %obci¹¿enie w fazie L1
 35   0   8       Ro      Lo     1e9       0    0    %obci¹¿enie w fazie L2
 36   0   9       Ro      Lo     1e9       0    0    %obci¹¿enie w fazie L3
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 37   0   5       Rz       0     1e9       0    0
 ];