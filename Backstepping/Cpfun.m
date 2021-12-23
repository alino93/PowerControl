function y = Cpfun( beta,tsr )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    filename = 'Cp.xlsx';
    Cp = xlsread(filename);
    beta1=floor(beta)+1;
    tsr1=floor(tsr*10);
    beta2=beta1+1;
    tsr2=tsr1+1;
    betap=beta-floor(beta);
    tsrp=tsr*10-floor(tsr*10);
    Cp1=Cp(beta1,tsr1)+betap*(Cp(beta2,tsr1)-Cp(beta1,tsr1));
    Cp2=Cp(beta1,tsr2)+betap*(Cp(beta2,tsr2)-Cp(beta1,tsr2));
    y=tsrp*(Cp2-Cp1)+Cp1;

end

