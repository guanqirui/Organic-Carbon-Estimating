clear; clc;
InPath = 'POC_data\seasonal\';

%��ȡ2010���ļ�Rrs����
name = 'Rrs_555\A20101722010263.L3m_SNSU_RRS_Rrs_555_4km.nc';
%��ȡ���ݣ��趨���꾭γ�ȷ�Χ
[Rrs_555,Lat,Lon] = read_x_nc(InPath,name,'Rrs_555'); 
%��������Χ
ind1 = find(Lon>117,1); %������Сֵ
ind2 = find(Lon>131,1); %�������ֵ
ind3 = find(Lat<23,1); %��γ��Сֵ
ind4 = find(Lat<34,1); %��γ���ֵ
Rrs = Rrs_555(ind1:ind2,ind4:ind3);

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

%�������
[xData, yData] = prepareCurveData(Rrs, bb);
%������Ϻ�������
ft = fittype('poly1');
[fitresult, gof] = fit(xData, yData, ft);
%������ͼ��
h = plot(fitresult, xData, yData ,'+k');
%�趨��ʽ
fontsize = 16;
axis([0, 0.025, 0, 0.05]);
set(gca,'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('\it b_b \rm(m^{-1})','fontsize', fontsize, 'fontname', 'Times New Roman');   
xlabel('\it R_{rs} \rm(sr^{-1})','fontsize', fontsize, 'fontname', 'Times New Roman');
hl = legend(h, '\it b_b - R_{rs}', 'Fitting Curve', 'Location', 'SouthEast');
set(hl, 'EdgeColor', 'w')

%����ͼƬ
saveas(gcf, 'figures/bb_Rrs_fitting.fig')