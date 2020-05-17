function draw_map(Lat, Lon, x)

h = pcolor(Lon, Lat, x');
mcolor = load('mcolor.mat');
mcolor = mcolor.mcolor;
colormap(mcolor) 
set(h,'LineStyle','none'); 

%colorbar
h = colorbar('Ticks', [0 100 200 300 400 500 600 700 800]);
set(get(h, 'title'), 'string', 'mg/m^3');

box on
axis([117,131,23,34]); %�������귶Χ���˷�ΧΪ�����Ĵ���λ��
set(gca, 'XTick', [118 122 126 130], 'YTick', [24 27 30 33]); %�趨������

fontsize = 16;
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('Latitude (��N)', 'fontsize', fontsize, 'fontname', 'Times New Roman');   
xlabel('Longitude (��E)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
set(gcf, 'unit', 'centimeters', 'position', [1 5 20 15]); %ǰ����Ϊ������Ļ���½ǵľ��룬x�����y���򣬺�����ΪͼƬ�Ĵ�С
set(gcf, 'color', 'white');