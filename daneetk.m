galezie=[
%ng--wp--wk----R_Ohm----L_mH-----C_nF----E_kV---fi_st
  1   0   1     1e-6       0     1e18     230      0  %napiecie fazowe UA    
  2   0   2     1e-6       0     1e18     230   -120  %napiecie fazowe UB  
  3   0   3     1e-6       0     1e18     230    120  %napiecie fazowe UC  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  4   0   1        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L1 0 
  5   0   2        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L2 0   
  6   0   3        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L3 0 
  7   1   2        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L1 L2   
  8   2   3        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L2 L3  
  9   3   1        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L3 L1   
 10   1   4      6.5     145     1e18       0    0    %impedancja wzd�u�na fazy L1 
 11   2   5      6.5     145     1e18       0    0    %impedancja wzd�u�na fazy L2   
 12   3   6      6.5     145     1e18       0    0    %impedancja wzd�u�na fazy L3
 13   6   4        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L3 L1 
 14   5   6        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L2 L3 
 15   4   5        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L1 L2
 16   0   6        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L3 0 
 17   0   5        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L2 0
 18   0   4        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L1 0  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 29   0   4        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L1 0 
 20   0   5        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L2 0   
 21   0   6        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L3 0 
 22   4   5        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L1 L2   
 23   5   6        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L2 L3  
 24   6   4        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L3 L1   
 25   4   7      6.5     145     1e18       0    0    %impedancja wzd�u�na fazy L1 
 26   5   8      6.5     145     1e18       0    0    %impedancja wzd�u�na fazy L2   
 27   6   9      6.5     145     1e18       0    0    %impedancja wzd�u�na fazy L3
 28   9   7        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L3 L1
 29   8   9        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L2 L3 
 30   7   8        0       0     0.25       0    0    %pojemno�� mi�dzy fazowa L1 L2
 31   0   9        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L3 0 
 32   0   8        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L2 0
 33   0   7        0       0    0.5e3       0    0    %pojemno�� faza ziemia  L1 0 

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 34   0   7  0.5*1e3 0.5*1e3     1e18       0    0    %obci��enie w fazie L1
 35   0   8  0.5*1e3 0.5*1e3     1e18       0    0    %obci��enie w fazie L2
 36   0   9  0.5*1e3 0.5*1e3     1e18       0    0    %obci��enie w fazie L3
 ];