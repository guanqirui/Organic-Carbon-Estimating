%������ˮ���й�ѧ����ȫ��ֲ�α��ɫͼ

clc;clear all;
InPath = 'F:\CALIOP and code\matlab\MODIS data\';
%ncdisp(strcat(InPath,'A20170012017365.L3m_YR_IOP_a_412_giop_4km.nc')) %��ȡ����ȡnc�ļ��Ļ�����Ϣ
source1 = strcat(InPath,'A20170012017365.L3m_YR_IOP_a_412_giop_4km.nc'); 
Lon = ncread(source1,'lon');
Lat = ncread(source1,'lat');
a_412 = ncread(source1,'a_412_giop');
%ncdisp(strcat(InPath,'A20170012017365.L3m_YR_IOP_bb_412_giop_4km.nc'))
source2 = strcat(InPath,'A20170012017365.L3m_YR_IOP_bb_412_giop_4km.nc'); 
bb_412 = ncread(source2,'bb_412_giop');
%% ����Kd
Kd_412 = a_412+4.18.*bb_412.*(1-0.52.*exp(-10.8.*a_412));%Kd�ļ��㷽�� 
figure(1)
h=pcolor(Lon,Lat,Kd_412'); 
colormap; 
set(h,'LineStyle','none'); 
colorbar
colorbar('Ticks',[0 1]);%figure 1 �༭������ɫͼ���򿪺���Ե�����ɫ��Ϣ�������԰��趨�õ�colorbar�����������´�ֱ�ӵ���
box on
axis([100,130,0,42]);%�������귶Χ���˷�ΧΪ�����Ĵ���λ��
set(gca,'XTick',[100 105 110 115 120 125 130 ],'YTick',[0 7 14 21 28 35 42])
fontsize = 12;
set(gca,'linewidth',1,'fontsize',fontsize,'fontname','Times New Roman');
ylabel('Latitude (��)' ,'fontsize',fontsize,'fontname','Times New Roman');   
xlabel('Longitude (��)' ,'fontsize',fontsize,'fontname','Times New Roman');
title('Kd @412nm  (m^{-1}) ' ,'fontsize',fontsize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[1 5 22 12]);%%%ǰ����Ϊ������Ļ���½ǵľ��룬x�����y���򣬺�����ΪͼƬ�Ĵ�С
set(gcf,'color','white');