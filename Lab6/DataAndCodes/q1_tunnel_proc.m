clear;
close all;

load('data_lab6');

s1 = saliency_map_Tunnel_processing1;
s2 = saliency_map_Tunnel_processing2;

% converting matrix to array
tunnel1 = s1(:);
tunnel2 = s2(:);

%%%%%%%%%%%%%%%%%%%%%%% paired t test %%%%%%%%%%%%%%%%%%%%%%%%%%%

% take difference of sample values
diff_tunnel = tunnel2 - tunnel1;

iter = length(diff_tunnel) / 100;

paired_t_arr = zeros(iter,1);

for i = 1 : iter
    sample_diff = diff_tunnel(100*(i-1)+1:100*(i-1)+100);
    
    % find mean of difference of sample values
    mean_tunnel = mean(sample_diff);

    % find standard deviation of difference of sample values
    sd_tunnel = std(sample_diff);

    % calculate degree of freedom for the paired test sample which is (n-1)
    deg_of_freedom = length(sample_diff) - 1;

    % calculate effect size
    effect_size = mean_tunnel / sd_tunnel;

    % find t value for paired t test
    if ~isnan(effect_size)
        paired_t_arr(i) = effect_size * sqrt(deg_of_freedom + 1);
    end
    
    sum(paired_t_arr)
end
    

sum(paired_t_arr)