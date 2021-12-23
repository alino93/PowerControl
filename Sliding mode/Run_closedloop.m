%__________________________________________________________
% % 1-Install FAST
% % 2-addpath() your FAST bin folder to MATLAB directories
% % 3-Run Run_closedloop.m for running simulation
% % 4-Open Closedloop.slx for seeing results
%___________________________________________________________
CertTest_Dir = 'CertTest';

TMax = 600;
iTest=11;

FileRoot   = sprintf( 'Test%02.0f', iTest );
    
disp('***********************************************');
disp( ['FAST_SFunc certification test for ' FileRoot] );
disp('***********************************************');
    
FAST_InputFileName = [CertTest_Dir filesep FileRoot '.fst'];

%parameters--------------------------------------------------    
R=35;
Rho=1.225;
Jr=2.96e6;
Jg=53.036;
Cls=1e5;
Kls=5.6e5;
Cr=625;
Cg=0.05;
ng=87.965;
beta_opt=2;
lambda_opt=7.1;
Cp_opt=0.4857;
a31=Kls-Cls*Cr/Jr;
a32=(Cls*Cg/Jg-Kls)/ng;
a33=-Cls*(Jr+ng^2*Jg)/(ng^2*Jg*Jr);
b31=Cls/Jr;
b32=Cls/ng/Jg;
filename = 'Cp.xlsx';
Cp = xlsread(filename);

lambda=0.1;
eta=0.01;
phi=0.1;

A1=1/Jr;
A2=(Jr*(lambda-b31)-Cr)/Jr^2;
A3=(Cr^2-a31*Jr-lambda*Cr*Jr)/Jr^2;
A4=-a32/Jr;
A5=(Cr-a33*Jr-lambda*Jr)/Jr^2;
sim('Closedloop.slx',[0,TMax]);