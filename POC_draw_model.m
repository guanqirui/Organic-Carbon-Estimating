%����POC��ֱ�ֲ�ģ��ʾ��ͼ���ֱ�Ϊ���¾����͡�ָ��˥���͡���˹�ֲ��ͺ����߷ֲ���
clear; clc;

%���¾�����
subplot1 = subplot(221);
fplot(@(x) 125, [0, 200], 'blue');
fontsize = 16;
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('\itc\rm(POC) (mg/m^3)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
xlabel('Depth (m)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
text(15,6,'(a)','fontsize', fontsize, 'fontname', 'Times New Roman');
ylim(subplot1, [0 200]);
box(subplot1, 'on');
set(subplot1, 'CameraUpVector', [-1 0 0], 'XTick', [0 100 200], 'YTick', 0);

%ָ��˥����
subplot2 = subplot(222);
fplot(@(x) 180*exp(-0.003*(x+100)), [0,200],'blue');
fontsize = 16;
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('\itc\rm(POC) (mg/m^3)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
xlabel('Depth (m)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
text(15,6,'(b)','fontsize', fontsize, 'fontname', 'Times New Roman');
ylim(subplot2, [0 200]);
box(subplot2, 'on');
set(subplot2, 'CameraUpVector', [-1 0 0], 'XTick', [0 100 200], 'YTick', 0);


%��˹�ֲ���
subplot3 = subplot(223);
fplot(@(x) 100+0.75*x*exp(-0.002*(x-50)*(x- 50)), [0,200],'blue');
fontsize = 16;
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('\itc\rm(POC) (mg/m^3)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
xlabel('Depth (m)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
text(15,6,'(c)','fontsize', fontsize, 'fontname', 'Times New Roman');
ylim(subplot3, [0 200]);
box(subplot3, 'on');
set(subplot3, 'CameraUpVector', [-1 0 0], 'XTick', [0 100 200], 'YTick', 0);

%���߷ֲ���
subplot4 = subplot(224);
fplot(@(x) 150-0.75*x, [0, 80], 'blue');
hold on; 
fplot(@(x) 90, [80, 200], 'blue'); 
hold off;
fontsize = 16;
set(gca, 'linewidth', 1, 'fontsize', fontsize, 'fontname', 'Times New Roman');
ylabel('\itc\rm(POC) (mg/m^3)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
xlabel('Depth (m)', 'fontsize', fontsize, 'fontname', 'Times New Roman');
text(15,6,'(d)','fontsize', fontsize, 'fontname', 'Times New Roman');
ylim(subplot4, [0 200]);
box(subplot4, 'on');
set(subplot4, 'CameraUpVector', [-1 0 0], 'XTick', [0 100 200], 'YTick', 0);

set(gcf, 'unit', 'centimeters', 'position', [1 5 20 15]);

%����ͼƬ
saveas(gcf, 'figures/POC_model.fig');