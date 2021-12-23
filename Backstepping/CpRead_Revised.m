%  filename = 'Cp.xlsx';
%  Cp = xlsread(filename);
 filename = 'Cp_lim.xlsx';
 Cp_lim = xlsread(filename);

% figure(1)
% untitled.fig
% % surf(0.1:0.1:14,0:1:89,Cp)
% ylabel('Pitch(deg)');
% xlabel('Tip Speed Ratio');
beta=0:1:40;
tsr=0.1:0.1:15;
Cp_math(41,140)=0;

figure(2)
surf(0.1:0.1:14,0:1:40,Cp_lim)
ylabel('\beta (deg)','fontsize',24,'fontweight','bold');
xlabel('TSR (\lambda)','fontsize',24,'fontweight','bold');

for i=1:1:41
    for j=10:1:140
        La=1/(tsr(j)-0.02*beta(i))-0.003/(beta(i)^3+1);
        Cp_math(i,j)=0.73*(151*La-.58*beta(i)-0.002*beta(i)^2.14-13.2)*exp(-18.4*La);
        if Cp_math(i,j)<0 
            Cp_math(i,j)=0; 
        end
    end
end

figure(3)
surf(0.1:0.1:14,0:1:40,Cp_math)
ylabel('\beta (deg)','fontsize',24,'fontweight','bold');
xlabel('TSR (\lambda)','fontsize',24,'fontweight','bold');

figure(4)
surf(0.1:0.1:14,0:1:40,Cp_lim-Cp_math)
ylabel('\beta (deg)','fontsize',24,'fontweight','bold');
xlabel('TSR (\lambda)','fontsize',24,'fontweight','bold');
