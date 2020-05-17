%�����㷨���POC-bbp��������
clear; clc;
InPath = 'POC_data\seasonal\';

%��ȡ2010���ļ�POC����
name = 'poc\A20101722010263.L3m_SNSU_POC_poc_4km.nc';
%��ȡ���ݣ��趨���꾭γ�ȷ�Χ
[POC,Lat,Lon] = read_x_nc(InPath,name,'poc'); 
%��������Χ
ind1 = find(Lon>117,1); %������Сֵ
ind2 = find(Lon>131,1); %�������ֵ
ind3 = find(Lat<23,1); %��γ��Сֵ
ind4 = find(Lat<34,1); %��γ���ֵ
POC = POC(ind1:ind2,ind4:ind3);

%��ȡ2010���ļ�bb����
name = 'bb_555\A20101722010263.L3m_SNSU_IOP_bb_555_giop_4km.nc';
%��ȡ���ݣ��趨���꾭γ�ȷ�Χ
[bb_555,Lat,Lon] = read_x_nc(InPath,name,'bb_555_giop'); 
%��������Χ
ind1 = find(Lon>117,1); %������Сֵ
ind2 = find(Lon>131,1); %�������ֵ
ind3 = find(Lat<23,1); %��γ��Сֵ
ind4 = find(Lat<34,1); %��γ���ֵ
bb = bb_555(ind1:ind2,ind4:ind3);
bbp = bb-0.0015;

%�������
[xData, yData] = prepareCurveData(bbp, POC);
%������Ϻ�������
ft = fittype('power1');
opts = fitoptions('Method', 'NonlinearLeastSquares');
opts.Display = 'Off';
opts.StartPoint = [109.039499669993 0.0065783563099195];
[fitresult, gof] = fit(xData, yData, ft, opts);
%������ͼ��
h = plot(fitresult, xData, yData ,'+k');
%�趨��ʽ
fontsize = 16;
axis([0, 0.05, 0, 1500]);
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('\it c\rm(POC) (mg/m^3)', 'fontsize', fontsize, 'fontname', 'Times New Roman');   
xlabel('\it b_{bp} \rm(m^{-1})', 'fontsize', fontsize, 'fontname', 'Times New Roman');
hl = legend(h, '\it c\rm(POC) - \it b_{bp}', 'Fitting Curve', 'Location', 'NorthEast');
set(hl, 'EdgeColor', 'w');
 
%����ͼƬ
saveas(gcf, 'figures/fitting_POC_bbp.fig');