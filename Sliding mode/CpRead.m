%  filename = 'Cp.xlsx';
%  Cp = xlsread(filename);
 filename = 'Cp_lim.xlsx';
 Cp_lim = xlsread(filename);

% figure(1)
% untitled.fig
% % surf(0.1:0.1:14,0:1:89,Cp)
% ylabel('Pitch(deg)');
% xlabel('Tip Speed Ratio');


figure(2)
surf(0.1:0.1:14,0:1:40,Cp_lim)
ylabel('Pitch(deg)');
xlabel('Tip Speed Ratio');