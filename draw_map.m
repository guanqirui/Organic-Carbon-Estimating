function draw_map(Lat, Lon, x, data)
%���ƶ���ˮ��POC�����ֲ�ͼ
%������������ȡ�γ�ȡ����ݡ���������
%�������Ϳ�ѡ��POC\DOC\Zeu\SCS
%�ֱ��ʾ����POC�������ݡ�����DOC�������ݡ�����Zeu�������ݡ��Ϻ�POC�·�����
%����ѡ���������͵Ĳ�ͬ����γ����Colorbar�ĳ߶Ȳ�ͬ
h = pcolor(Lon, Lat, x');
mcolor = load('mcolor.mat');
mcolor = mcolor.mcolor;
colormap(mcolor) 
set(h, 'LineStyle', 'none'); 

%colorbar
switch data
    case {'POC', 'SCS'}
        h = colorbar('Ticks', [0 100 200 300 400 500 600 700 800]);
        set(get(h, 'title'), 'string', 'mg/m^3');
    case 'DOC'
        h = colorbar('Ticks', [0 500 1000 1500 2000 2500 3000 3500 4000]);
        set(get(h, 'title'), 'string', 'mg/m^3');
    case 'Zeu'
        h = colorbar('Ticks', [0 20 40 60 80 100 120 140]);
        set(get(h, 'title'), 'string', 'm');
end

box on
%�������귶Χ
switch data
    case {'POC', 'DOC', 'Zeu'}
        axis([117,131,23,34]); %�������귶Χ���˷�ΧΪ�����Ĵ���λ��
        set(gca, 'XTick', [118 122 126 130], 'YTick', [24 27 30 33]); %�趨������
    case 'SCS'
        axis([109,122,3,24]); %�������귶Χ���˷�ΧΪ�����Ĵ���λ��
        set(gca, 'XTick', [109 115 121], 'YTick', [3 10 17 24]); %�趨������
end

fontsize = 16;
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('Latitude (��N)', 'fontsize', fontsize, 'fontname', 'Times New Roman');   
xlabel('Longitude (��E)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
set(gcf, 'unit', 'centimeters', 'position', [1 5 20 15]); %ǰ����Ϊ������Ļ���½ǵľ��룬x�����y���򣬺�����ΪͼƬ�Ĵ�С
set(gcf, 'color', 'white');