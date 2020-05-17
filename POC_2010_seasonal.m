%����2010����POCŨ�ȷֲ�ͼ
clear; clc;
InPath = 'POC_data\seasonal\Rrs_555\';

%�����ļ��ֲ�ͼ����Ϊ�ļ�POC��colorbar����Χ������ļ���colorbar��Ϊ��׼��
name = 'A20101722010263.L3m_SNSU_RRS_Rrs_555_4km.nc';
%��ȡ���ݣ��趨���꾭γ�ȷ�Χ
[Rrs_555,Lat,Lon] = read_x_nc(InPath,name,'Rrs_555'); 
%��������Χ
ind1 = find(Lon>117,1); %������Сֵ
ind2 = find(Lon>131,1); %�������ֵ
lon1 = Lon(ind1:ind2);
ind3 = find(Lat<23,1); %��γ��Сֵ
ind4 = find(Lat<34,1); %��γ���ֵ
lat1 = Lat(ind4:ind3);
Rrs = Rrs_555(ind1:ind2,ind4:ind3);

%����POCŨ��
bb = 2.109*Rrs-0.001186;
bbp = bb-0.0015;
bbp(bbp<0) = 0;
POC = 2607*bbp.^0.4975;

%�����ļ�Ũ�ȷֲ�ͼ
subplot(222);
draw_map(lat1,lon1,POC);
text(118,33,'(b)','fontsize', 14, 'fontname', 'Times New Roman');
temp1 = caxis;

%�����ļ�Ũ�Ⱦ�ֵ
sum2 = get_POC(POC);

%���ƴ����ֲ�ͼ
name = 'A20100802010171.L3m_SNSP_RRS_Rrs_555_4km.nc';
[Rrs_555,Lat,Lon] = read_x_nc(InPath,name,'Rrs_555');

ind1 = find(Lon>117,1);
ind2 = find(Lon>131,1);
lon1 = Lon(ind1:ind2);
ind3 = find(Lat<23,1);
ind4 = find(Lat<34,1);
lat1 = Lat(ind4:ind3);
Rrs = Rrs_555(ind1:ind2,ind4:ind3);

bb = 1.623*Rrs-0.000162;
bbp = bb-0.0015;
bbp(bbp<0) = 0;
POC = 1359*bbp.^0.3252;

subplot(221);
draw_map(lat1,lon1,POC);
text(118,33,'(a)','fontsize', 14, 'fontname', 'Times New Roman');
caxis(temp1);

sum1 = get_POC(POC);

%�����＾�ֲ�ͼ
name = 'A20102642010354.L3m_SNAU_RRS_Rrs_555_4km.nc';
[Rrs_555,Lat,Lon] = read_x_nc(InPath,name,'Rrs_555');

ind1 = find(Lon>117,1);
ind2 = find(Lon>131,1);
lon1 = Lon(ind1:ind2);
ind3 = find(Lat<23,1);
ind4 = find(Lat<34,1);
lat1 = Lat(ind4:ind3);
Rrs = Rrs_555(ind1:ind2,ind4:ind3);

bb = 1.787*Rrs-0.0006908;
bbp = bb-0.0015;
bbp(bbp<0) = 0;
POC = 1498*bbp.^0.3827;

subplot(223);
draw_map(lat1,lon1,POC);
text(118,33,'(c)','fontsize', 14, 'fontname', 'Times New Roman');
caxis(temp1);

sum3 = get_POC(POC);

%���ƶ����ֲ�ͼ
name = 'A20103552011079.L3m_SNWI_RRS_Rrs_555_4km.nc';
[Rrs_555,Lat,Lon] = read_x_nc(InPath,name,'Rrs_555');

ind1 = find(Lon>117,1);
ind2 = find(Lon>131,1);
lon1 = Lon(ind1:ind2);
ind3 = find(Lat<23,1);
ind4 = find(Lat<34,1);
lat1 = Lat(ind4:ind3);
Rrs=Rrs_555(ind1:ind2,ind4:ind3);

bb=1.705*Rrs-0.0003317;
bbp=bb-0.0015;
bbp(bbp<0)=0;
POC=849.4*bbp.^0.2668;

subplot(224);
draw_map(lat1,lon1,POC);
text(118,33,'(d)','fontsize', 14, 'fontname', 'Times New Roman');
caxis(temp1);

sum4=get_POC(POC);

%����ͼƬ
saveas(gcf,'figures/POC_2010_seasonal.fig');

%����ļ�Ũ�Ⱦ�ֵ�����mat
seasonal = [sum1 sum2 sum3 sum4];
save('results/POC_2010_seasonal.mat','seasonal');