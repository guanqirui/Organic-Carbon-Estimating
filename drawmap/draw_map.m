function draw_map(Lat,Lon,x,titlename)
figure(1)
h=pcolor(Lon,Lat,x');
colormap; 
set(h,'LineStyle','none'); 
fmin=min(min(x));
fmax=max(max(x));
N=(fmax-fmin)/5;
colorbar
colorbar('Ticks',linspace(fmin,fmax,N)');%figure 1 �༭������ɫͼ���򿪺���Ե�����ɫ��Ϣ�������԰��趨�õ�colorbar�����������´�ֱ�ӵ���
box on
axis([100,130,0,42]);%�������귶Χ���˷�ΧΪ�����Ĵ���λ��
set(gca,'XTick',[100 105 110 115 120 125 130 ],'YTick',[0 7 14 21 28 35 42])
fontsize = 12;
set(gca,'linewidth',1,'fontsize',fontsize,'fontname','Times New Roman');
ylabel('Latitude (��)' ,'fontsize',fontsize,'fontname','Times New Roman');   
xlabel('Longitude (��)' ,'fontsize',fontsize,'fontname','Times New Roman');
title(titlename ,'fontsize',fontsize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[1 5 22 12]);%%%ǰ����Ϊ������Ļ���½ǵľ��룬x�����y���򣬺�����ΪͼƬ�Ĵ�С
set(gcf,'color','white');