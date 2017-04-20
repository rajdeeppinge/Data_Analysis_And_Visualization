clear;
close all;

load('data_lab6');

% converting matrix to array
tunnel1 = saliency_map_Tunnel_processing1(:);
tunnel2 = saliency_map_Tunnel_processing2(:);

%%%%%%%%%%%%%%%%%%%%%%% paired t test %%%%%%%%%%%%%%%%%%%%%%%%%%%

% take difference of sample values
diff_tunnel = tunnel2 - tunnel1;

% find mean of difference of sample values
mean_tunnel = mean(diff_tunnel);

% find standard deviation of difference of sample values
sd_tunnel = std(diff_tunnel);

% calculate degree of freedom for the paired test sample which is (n-1)
deg_of_freedom = length(diff_tunnel) - 1;

% calculate effect size
effect_size = mean_tunnel / sd_tunnel;

% find t value for paired t test
paired_t = effect_size * sqrt(deg_of_freedom + 1);


%%%%%%%%%%%%%%%%%%% unpaired t test %%%%%%%%%%%%%%%%%%%%%%

tunnel1_mean = mean(tunnel1);
tunnel1_sd = std(tunnel1);
n1 = length(tunnel1);

tunnel2_mean = mean(tunnel2);
tunnel2_sd = std(tunnel2);
n2 = length(tunnel2);


s = min(tunnel1_sd, tunnel2_sd);

effect_size_unpaired = (tunnel2_mean - tunnel1_mean) / s

[unpaired_t, df_unpaired] = calculate_t(tunnel1_mean, tunnel2_mean, tunnel1_sd, tunnel2_sd, n1, n2)