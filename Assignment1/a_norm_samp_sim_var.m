% Author - Rajdeep Pinge
% Date - 03-03-2017

% Code to verify the role of two assumptions:
% 1. Assumption of Normality
% 2. Homogeneity of Variance
% required by the t-test so that the sampling distribution of t follows 
% the theoretical t-distribution with the corresponding degree of freedom.

% Here we use normal samples having similar variance

clear;
close all;

iterations = 1e3;    

t_arr = zeros(iterations, 1);        % array to score t values of each t test

for i = 1:iterations
    
    % generate first normally distributed sample 
    n1 = 1000;
    norm1 = normrnd(zeros(n1, 1), ones(n1, 1));

    mu1 = 10;
    sigma1 = 10;

    norm_dist_1 = norm1 * sigma1 + mu1;
    
    
    % generate second normally distributed sample
    n2 = 50;
    norm2 = normrnd(zeros(n2, 1), ones(n2, 1));
    
    mu2 = 10;
    sigma2 = 10;
    norm_dist_2 = norm2 * sigma2 + mu2;
    
    
    % perform t test
    t_arr(i) = calculate_t(mean(norm_dist_1), mean(norm_dist_2), std(norm_dist_1), std(norm_dist_2), n1, n2);
    
end


histogram(t_arr, 'Normalization', 'pdf')
hold on
plot((-4:4e-3:4), tpdf((-4:4e-3:4), n1+n2-2), 'LineWidth', 2);
title(['Normal samples with similar variances  n1 != n2, df = ' num2str(n1+n2-2)])
xlabel('X values')
ylabel('Probability density')
legend('experimental t dist', 'theoretical t dist')