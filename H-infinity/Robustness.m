R=ureal('Rho',35,'Percentage',15);
Rho=ureal('Rho',1.225,'Percentage',15);
Jr=ureal('Jr',2.96e6,'Percentage',15);
Jg=ureal('Jg',53.036,'Percentage',15);
Cls=ureal('Cls',1e5,'Percentage',15);
Kls=ureal('Kls',5.6e5,'Percentage',15);
Cr=ureal('Cr',625,'Percentage',15);
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
B=[0 b11*10^6 b12*10^4;0 b21*10^6 b22*10^4;0 b31*10^6 b32*10^4];
C=[0 0 0;1 0 0;a21 a22 a23;1 0 0;0 0 0;0 1 0];
D=[0 0 1;0 0 0;0 b21*10^6 b22*10^4;-lambda_opt/R 0 0;0 1 0;0 0 0];

s=tf('s');
WT=uss(A,B,C,D);

k1=-0.018969*(s-3.714)*(s+1.149)*(s+0.04533)*(s+0.01038)*(s+0.002273)/(s*(s+0.8325)*(s+0.1111)*(s+0.01274)*(s+0.002171));
k2=0.032167*s*(s+0.9259)*(s+0.002234)*(s^2 - 0.01879*s + 0.006516)/(s*(s+0.8325)*(s+0.1111)*(s+0.01274)*(s+0.002171));
k3=0.020178*s*(s+0.6718)*(s+0.05862)*(s+0.0117)*(s+0.002179)/(s*(s+0.8325)*(s+0.1111)*(s+0.01274)*(s+0.002171));
K_dk=[k1,k2,k3];

CLoop_unc = lft( WT([1:6 4:6],1:3) , K_dk);
W= logspace(0,2.3,140);
%bodemag(WT(1,1),'k-.',CLoop_unc(1,1),'r-',W)
time = 0:0.05:100;
v = 0*time;
v(1:801) = 4*(1-cos(0.05*pi*time(1:801))); %
ta=1.225/2*pi*35^3*0.4857/7.1*v.^2*1e-6;
[p1,t] = lsim(WT(1:6,1:2),[v;ta],time); % Generate O.L. response
CLoop_unc20 = usample(CLoop_unc,20); % Generate 20 sample of
% uncertain C.L. system
nsamp = 20;
for i=1:nsamp %For each of 20 random samples do a simulation and plot response
[y1,t] = lsim(CLoop_unc20(1:6,1:2,i),[v;ta],time); % simul. C.L. response
subplot(321)
plot(t,y1(:,1),'b-')
title('Generator Torque'); ylabel('T_{em} (10kN.m)'); hold on
subplot(322)
plot(t,y1(:,2),'b-',t,p1(:,2),'k--') %Plot 2 nd CL and OL output
title('Rotor angular speed')
ylabel('\omega_t (rad/s)'); hold on
subplot(323)
plot(t,y1(:,3),'b-', t,p1(:,3),'k--') %Plot 3nd CL and OL output
title('Generator angular acceleration')
xlabel('Time (sec)');ylabel('\omega_g^\prime (rad/s^2)');hold on
subplot(324)
plot(t,y1(:,4),'b-',t,p1(:,4),'k--') %Plot 4 nd CL and OL output
title('Rotor angular speed error');xlabel('Time (sec)')
ylabel('\omega_t- \omega_{t-opt} (rad/s)'); hold on
subplot(325)
plot(t,v,'b-') %Plot 4 nd CL and OL output
title('Wind Speed');xlabel('Time (sec)')
ylabel('v (m/s)'); hold on
subplot(326)
plot(t,y1(:,6),'b-') %Plot 6 nd CL and OL output
title('Generator angular speed');xlabel('Time (sec)')
ylabel('\omega_g (rad/s)'); hold on
end