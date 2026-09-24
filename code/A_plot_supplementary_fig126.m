clear, clc
close all
load('E:\A_course\A_boot_weight_stats.mat')
load('G:\A_arousal_analysis\data\community.mat')
load('G:\A_arousal_analysis\data\fig_cols.mat')
load('G:\Atlas\parceln468_info.mat')

groupcols = groupcolor3([7 5 2 1 4 10], :);

pt = FDR(positive_affect_Ztest_P, 0.05);
pos_sig = positive_affect_Ztest_P<pt;
pt = FDR(negative_affect_Ztest_P, 0.05);
neg_sig = negative_affect_Ztest_P<pt;
sigs = pos_sig & neg_sig;

comm_dat = positive_affect_Z - negative_affect_Z;
comm_dat(~sigs) = 0;

positive_affect_Z(~pos_sig) = 0;
negative_affect_Z(~neg_sig) = 0;

%% PAES
data_to_plot = positive_affect_Z;
nparcel = 468;
general_w_recon = zeros(nparcel, nparcel);
general_w_recon(triu(true(nparcel, nparcel),1)) = data_to_plot;
general_w_recon = general_w_recon+general_w_recon';

[~, ~, surv_w] = find(triu(general_w_recon, 1));
fx = @(x) ((abs(x) - min(abs(x))) ./ (max(abs(x)) - min(abs(x)))).^0.6;
thr_alpha = fx(surv_w);
fx = @(x) (abs(x) - min(abs(x))) ./ (max(abs(x)) - min(abs(x))) * 2.25 + 0.1;
thr_width = fx(surv_w);
thr_color = zeros(numel(surv_w), 3);
thr_color(surv_w > 0, :) = repmat([255,0,0] ./ 255, sum(surv_w > 0), 1);
thr_color(surv_w < 0, :) = repmat([10,150,255] ./ 255, sum(surv_w < 0), 1);

pos_deg = sum(general_w_recon .* double(general_w_recon>0));
neg_deg = -sum(general_w_recon .* double(general_w_recon<0));
norm_pos_deg = (pos_deg - min([pos_deg neg_deg])) ./ (max([pos_deg, neg_deg]) - min([pos_deg, neg_deg]));
norm_neg_deg = (neg_deg - min([pos_deg neg_deg])) ./ (max([pos_deg, neg_deg]) - min([pos_deg, neg_deg]));

figure;
set(gcf, 'visible', 'on');

circos_multilayer(general_w_recon, 'group', community, 'group_color', groupcols, 'length_ratio', [1 0 1], 'patch_edge_alpha', 0, ...
     'region_names', names, 'region_names_size', 4,'conn_color', thr_color, 'conn_alpha', thr_alpha, 'conn_width', thr_width);

set(gca, 'xlim', [-1.2 1.2], 'ylim', [-1.2 1.2]);
set(gcf, 'position', [40    40   786   762]);
set(gcf, 'Color', 'w');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 10 10]);
% % print('-dtiff', 'A_PAES', '-r500')

%% NAES
data_to_plot = negative_affect_Z;
nparcel = 468;
general_w_recon = zeros(nparcel, nparcel);
general_w_recon(triu(true(nparcel, nparcel),1)) = data_to_plot;
general_w_recon = general_w_recon+general_w_recon';

[~, ~, surv_w] = find(triu(general_w_recon, 1));
fx = @(x) ((abs(x) - min(abs(x))) ./ (max(abs(x)) - min(abs(x)))).^0.6;
thr_alpha = fx(surv_w);
fx = @(x) (abs(x) - min(abs(x))) ./ (max(abs(x)) - min(abs(x))) * 2.25 + 0.1;
thr_width = fx(surv_w);
thr_color = zeros(numel(surv_w), 3);
thr_color(surv_w > 0, :) = repmat([255,0,0] ./ 255, sum(surv_w > 0), 1);
thr_color(surv_w < 0, :) = repmat([10,150,255] ./ 255, sum(surv_w < 0), 1);

pos_deg = sum(general_w_recon .* double(general_w_recon>0));
neg_deg = -sum(general_w_recon .* double(general_w_recon<0));
norm_pos_deg = (pos_deg - min([pos_deg neg_deg])) ./ (max([pos_deg, neg_deg]) - min([pos_deg, neg_deg]));
norm_neg_deg = (neg_deg - min([pos_deg neg_deg])) ./ (max([pos_deg, neg_deg]) - min([pos_deg, neg_deg]));

figure;
set(gcf, 'visible', 'on');

circos_multilayer(general_w_recon, 'group', community, 'group_color', groupcols, 'length_ratio', [1 0 1], 'patch_edge_alpha', 0, ...
     'region_names', names, 'region_names_size', 4,'conn_color', thr_color, 'conn_alpha', thr_alpha, 'conn_width', thr_width);

set(gca, 'xlim', [-1.2 1.2], 'ylim', [-1.2 1.2]);
set(gcf, 'position', [40    40   786   762]);
set(gcf, 'Color', 'w');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 10 10]);
% % print('-dtiff', 'A_NAES', '-r500')

%% Common
data_to_plot = comm_dat;
nparcel = 468;
general_w_recon = zeros(nparcel, nparcel);
general_w_recon(triu(true(nparcel, nparcel),1)) = data_to_plot;
general_w_recon = general_w_recon+general_w_recon';

[~, ~, surv_w] = find(triu(general_w_recon, 1));
fx = @(x) ((abs(x) - min(abs(x))) ./ (max(abs(x)) - min(abs(x)))).^0.6;
thr_alpha = fx(surv_w);
fx = @(x) (abs(x) - min(abs(x))) ./ (max(abs(x)) - min(abs(x))) * 2.25 + 0.1;
thr_width = fx(surv_w);
thr_color = zeros(numel(surv_w), 3);
thr_color(surv_w > 0, :) = repmat([255,0,0] ./ 255, sum(surv_w > 0), 1);
thr_color(surv_w < 0, :) = repmat([10,150,255] ./ 255, sum(surv_w < 0), 1);

pos_deg = sum(general_w_recon .* double(general_w_recon>0));
neg_deg = -sum(general_w_recon .* double(general_w_recon<0));
norm_pos_deg = (pos_deg - min([pos_deg neg_deg])) ./ (max([pos_deg, neg_deg]) - min([pos_deg, neg_deg]));
norm_neg_deg = (neg_deg - min([pos_deg neg_deg])) ./ (max([pos_deg, neg_deg]) - min([pos_deg, neg_deg]));

figure;
set(gcf, 'visible', 'on');

circos_multilayer(general_w_recon, 'group', community, 'group_color', groupcols, 'length_ratio', [1 0 1], 'patch_edge_alpha', 0, ...
     'region_names', names, 'region_names_size', 4,'conn_color', thr_color, 'conn_alpha', thr_alpha, 'conn_width', thr_width);

set(gca, 'xlim', [-1.2 1.2], 'ylim', [-1.2 1.2]);
set(gcf, 'position', [40    40   786   762]);
set(gcf, 'Color', 'w');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 10 10]);
% % print('-dtiff', 'A_common', '-r500')