%���Ʊ��DOCŨ�ȷֲ�ͼ����������Ũ�Ⱦ�ֵ���ɵ�������year������ݽ��м���
clear; clc;

%ͬһ��ݲ�ͬ���ڶԱ�
year = 2010; %�趨�������
InPath = 'data\seasonal\'; %��������·��

%����
season = choose_s(1,year);
[avg_sp, sum_sp, DOC_SP, lat1, lon1] = get_DOC(1, season, InPath);
subplot(2, 2, 1);
draw_map(lat1, lon1, DOC_SP, 'DOC');
text(118, 33, '(a)', 'fontsize', 14, 'fontname', 'Times New Roman');
temp1 = caxis;
avg_sp; %����Ũ�Ⱦ�ֵ

%�ļ�
season = choose_s(2,year);
[avg_su, sum_su, DOC_SU, lat1, lon1] = get_DOC(2, season, InPath);
subplot(2, 2, 2);
draw_map(lat1, lon1, DOC_SU, 'DOC');
text(118, 33, '(b)', 'fontsize', 14, 'fontname', 'Times New Roman');
caxis(temp1);
avg_su;

%�＾
season = choose_s(3,year);
[avg_au, sum_au, DOC_AU, lat1, lon1] = get_DOC(3, season, InPath);
subplot(2, 2, 3);
draw_map(lat1, lon1, DOC_AU, 'DOC');
text(118, 33, '(c)', 'fontsize', 14, 'fontname', 'Times New Roman');
caxis(temp1);
avg_au;

%����
season = choose_s(4, year);
[avg_wi, sum_wi, DOC_WI, lat1, lon1] = get_DOC(4, season, InPath);
subplot(2, 2, 4);
draw_map(lat1, lon1, DOC_WI, 'DOC');
text(118, 33, '(d)', 'fontsize', 14, 'fontname', 'Times New Roman');
caxis(temp1);
avg_wi;

%����ͼƬ
saveas(gcf, 'figures/DOC_2010_seasonal.fig');

%save('results/DOC_2010.mat','DOC_SP','DOC_SU','DOC_AU','DOC_WI','-v7.3');