function draw_map(Lat,Lon,x,titlename)
figure(1)
h=pcolor(Lon,Lat,x');
mcolor=load('mcolor.mat');
mcolor=mcolor.mcolor;
colormap(mcolor) 
set(h,'LineStyle','none'); 

colorbar
colorbar('Ticks',[0 200 400 600 800 1000 1200 1400]);%figure 1 �༭������ɫͼ���򿪺���Ե�����ɫ��Ϣ�������԰��趨�õ�colorbar�����������´�ֱ�ӵ���
%colorbar('Ticks',[0 50 100 150 200 250 300 350 400 450 500 550 600]);
box on
axis([117,131,23,34]);%�������귶Χ���˷�ΧΪ�����Ĵ���λ��
%axis([109,122,3,24]);
set(gca,'XTick',[117 120 125 130],'YTick',[23 24 26 28 30 32 34 36 38 40])
%set(gca,'XTick',[109 112 115 122],'YTick',[3,6,9,12,15,18,21,24])
fontsize = 12;
set(gca,'linewidth',1,'fontsize',fontsize,'fontname','Times New Roman');
ylabel('Latitude (��)' ,'fontsize',fontsize,'fontname','Times New Roman');   
xlabel('Longitude (��)' ,'fontsize',fontsize,'fontname','Times New Roman');
title(titlename ,'fontsize',fontsize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[1 5 20 15]);
%set(gcf,'unit','centimeters','position',[1 1 28 96]);%%%ǰ����Ϊ������Ļ���½ǵľ��룬x�����y���򣬺�����ΪͼƬ�Ĵ�С
set(gcf,'color','white');