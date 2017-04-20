clear;
close all;

load('data_lab6');

% converting matrix to array
belgium1 = Saliency_Map_dani_belgium_processing1(:);
belgium2 = Saliency_Map_dani_belgium_processing2(:);

%%%%%%%%%%%%%%%%%%%%%%% paired t test %%%%%%%%%%%%%%%%%%%%%%%%%%%

% take difference of sample values
diff_belgium = belgium2 - belgium1;

iter = length(diff_belgium) / 25;

paired_t_arr = zeros(iter,1);

for i = 1 : iter
    sample_diff = diff_belgium(25*(i-1)+1:25*(i-1)+25);
    
    % find mean of difference of sample values
    mean_belgium = mean(sample_diff);

    % find standard deviation of difference of sample values
    sd_belgium = std(sample_diff);

    % calculate degree of freedom for the paired test sample which is (n-1)
    deg_of_freedom = length(sample_diff) - 1;

    % calculate effect size
    effect_size = mean_belgium / sd_belgium;

    % find t value for paired t test
    if ~isnan(effect_size)
        paired_t_arr(i) = effect_size * sqrt(deg_of_freedom + 1);
    end
end

sum(paired_t_arr(1:1000))