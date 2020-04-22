% ee001la_Lab3_Part1_voltage_divider_symbolic.m
% ---------------------------------------------
% Course: EE001LA
% Project: Lab 3, Part 1
% Purpose: Symbolic Solution of a Linear System of Equations obtained
% while solving the voltage divider circuit
%
% Usage: 1. Change the Matlab's working directory to the one where
% the file containing this code is located
% 2. At the command prompt type:
%
% >> ee001la_Lab3_Part1_voltage_divider_symbolic
%
% ---------------------------------------------------------------------
clear vS vR1 vR2 vR3 iS iR1 iR2 iR3 VS R1 R2 R3; % clear symbolic variables

syms vS vR1 vR2 iS iR1 iR2 iR3; % unknown reference voltages & currents
syms VS R1 R2; % known circuit component parameters
% ----- Write KCL, KVL and, i-v equations -----------------------------
eq_node1 = iS + iR1 - iR2 == 0; % KCL node 1
eq_node2 = iR2 + iR1 == 0; % KCL node 2
eq_loop1 = -vS + vR1 - vR2(iR2 + iR3) == 0; % KVL loop 1
eq_loop2 = vR2(iR3 - iR2) - vR3 == 0;

eq_iv_VS = vS == VS; % i-v characteristic of the voltage src
eq_iv_R1 = vR1 - R1*iR1 == 0; % i-v characteristic of R1
eq_iv_R2 = vR2 - R2*iR2 == 0; % i-v characteristic of R2
eq_iv_R3 = vR3 - R3*iR3 == 0;
% ----- Solve symbolically the system of linear equations -------------
S = solve(eq_node1, eq_node2, eq_loop1, eq_loop2, eq_iv_VS, eq_iv_R1, eq_iv_R2, eq_iv_R3, vS,vR1,vR2, vR3,iS,iR1,iR2, iR3);
% ----- Solutions can be obtained by accessing fields in the S structure
disp('vS =') , disp(S.vS)
disp('vR1 ='), disp(S.vR1)
disp('vR2 ='), disp(S.vR2)
disp('iS =') , disp(S.iS)
disp('iR1 ='), disp(S.iR1)
disp('iR2 ='), disp(S.iR2)
disp('iR3 ='), disp(S.iR3)