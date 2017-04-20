% Author - Rajdeep Pinge
% Date - 11th April, 2017

clear;
close all;

load('data_lab9');

heritage_images = heritage;
natural_images = natural;


mean(heritage_images)
std(heritage_images)
subplot(1, 2, 1), histogram(heritage_images, 10, 'Normalization', 'probability');
axis([0 1 0 1])
title('Color values in given heritage image sample')
xlabel('Color Values')
ylabel('Probability')


mean(natural_images)
std(natural_images)
subplot(1, 2, 2), histogram(natural_images, 10, 'Normalization', 'probability');
axis([0 1 0 1])
title('Color values in given natual image sample')
xlabel('Color Values')
ylabel('Probability')


set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('q2_sample_histogram','-djpeg')

%% non-parametric testing - bootstraping, resampling method

combined = [heritage_images natural_images];


% now for each iteration resample, assign to x and y, compute the statistical difference.
ite = 1000;
n1 = numel(natural_images); % number of elements in each sample
n2 = numel(heritage_images);

% array to store distribution of test statistic
stat_arr = zeros(ite,1);

for i=1:ite
    
    % sample with replace n1+n2, permute then n1 to n2
    sample_with_rep = datasample(combined, n1+n2);
    
    sample_with_rep( randperm( length(sample_with_rep) ) ); % shuffled 
    
    X = sample_with_rep(1:n1);
    Y = sample_with_rep((n1+1):(n1+n2));
    
    % store difference of medians
    stat_arr(i)= median(X)- median(Y);
end

figure
histogram(stat_arr, 'Normalization', 'probability');
title('Distribution of difference in test statistic 1000 iterations')
xlabel('Difference of median (test statistic)')
ylabel('Frequency')

set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('q2_bootstrap','-djpeg')


% compute 2.5 and 97.5 th percentile

ci_lower = prctile(stat_arr,2.5)
ci_higher = prctile(stat_arr,97.5)

orig_median_diff = median(heritage_images)- median(natural_images)

hold on
line([ci_lower, ci_lower],[0,0.1],[0,0],'LineStyle','-','Color','r','LineWidth', 2);

hold on
line([ci_higher, ci_higher],[0,0.1],[0,0],'LineStyle','-','Color','r','LineWidth', 2);

hold on
line([orig_median_diff, orig_median_diff],[0,0.1],[0,0],'LineStyle','-','Color','g','LineWidth', 2);


%% non-parametric testing - permutation method


median(heritage_images)
median(natural_images)

