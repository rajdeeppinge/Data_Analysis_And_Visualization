clear;
close all;

load('data_lab6');

% converting matrix to array
belgium1 = Saliency_Map_dani_belgium_processing1';
belgium2 = Saliency_Map_dani_belgium_processing2';

%%%%%%%%%%%%%%%%%%%%%%% paired t test %%%%%%%%%%%%%%%%%%%%%%%%%%%

% take difference of sample values
diff_belgium = belgium1 - belgium2;

% find mean of difference of sample values
mean_belgium = mean(diff_belgium);

% find standard deviation of difference of sample values
sd_belgium = std(diff_belgium);

% calculate degree of freedom for the paired test sample which is (n-1)
deg_of_freedom = length(diff_belgium) - 1;

% calculate effect size
effect_size = mean_belgium ./ sd_belgium;

% find t value for paired t test
paired_t = effect_size .* sqrt(deg_of_freedom + 1);

mean(paired_t(:), 'omitnan')

%%%%%%%%%%%%%%%%%%% unpaired t test %%%%%%%%%%%%%%%%%%%%%%

% sample 1
belgium1_mean = mean(belgium1);
belgium1_sd = std(belgium1);
n1 = length(belgium1);

% sample 2
belgium2_mean = mean(belgium2);
belgium2_sd = std(belgium2);
n2 = length(belgium2);

% to find effect size
s = min(belgium1_sd, belgium2_sd);

effect_size_unpaired = (belgium2_mean - belgium1_mean) ./ s;

% calculate unpaired t value
[unpaired_t, df_unpaired] = calculate_t(belgium1_mean, belgium2_mean, belgium1_sd, belgium2_sd, n1, n2);

mean(unpaired_t(:), 'omitnan')