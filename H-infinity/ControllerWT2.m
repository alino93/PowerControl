R=ureal('Rho',35,'Percentage',1);
Rho=ureal('Rho',1.225,'Percentage',1);
Jr=ureal('Jr',2.96e6,'Percentage',1);
Jg=ureal('Jg',53.036,'Percentage',1);
Cls=ureal('Cls',1e5,'Percentage',1);
Kls=ureal('Kls',5.6e5,'Percentage',1);
Cr=ureal('Cr',625,'Percentage',1);
Cg=0.05;
ng=87.965;
beta_opt=2;
lambda_opt=7.1;
Cp_opt=0.4857;

a11=-Cr/Jr;
a12=0;
a13=-1/Jr;
a21=0;
a22=-Cg/Jg;
a23=1/ng/Jg;
a31=Kls-Cls*Cr/Jr;
a32=(Cls*Cg/Jg-Kls)/ng;
a33=-Cls*(Jr+ng^2*Jg)/(ng^2*Jg*Jr);

b11=1/Jr;
b12=0;
b21=0;
b22=-1/Jg;
b31=Cls/Jr;
b32=Cls/ng/Jg;

A=[a11 a12 a13;a21 a22 a23;a31 a32 a33];
B=[b11*10^6 b12*10^4;b21*10^6 b22*10^4;b31*10^6 b32*10^4];
C=[0 0 0;1 0 0;a21 a22 a23;0 0 0;0 1 0];
D=[0 1;0 0;b21*10^6 b22*10^4;1 0;0 0];

s=tf('s');
WT=uss(A,B,C,D);
Wem=1;
Wta_opt=1;
Wp=(s/3+5)/(s+1e-2);
Wg=0.03;
Wta=1;

systemnames='WT Wta Wp Wg Wem';
inputvar='[wt_opt; Ta_opt; Tem]';
outputvar='[Wem; Wg; Wp; -wt_opt+WT(2); Ta_opt; WT(5)]';
input_to_WT='[Ta; Tem]';
input_to_Wp='[WT(2)-wt_opt]';
input_to_Wg='[WT(3)]';
input_to_Wem='[WT(1)]';
input_to_Wta='[Ta]';
input_to_Wta_opt='[Ta_opt]';

WTicunc=sysic; nmeas=3; ncont=1;

[K_dk, CLoop, gama]=dksyn(WTicunc,nmeas,ncont);
gama
sys=zpk(K_dk)
syss=zpk(K_dk);
rsys = balred(sys,5)
bodemag(sys,syss)
[A,B,C,D]=ssdata(sys);