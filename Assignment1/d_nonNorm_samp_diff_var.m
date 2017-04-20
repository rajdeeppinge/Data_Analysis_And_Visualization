% Author - Rajdeep Pinge
% Date - 03-03-2017

% Code to verify the role of two assumptions:
% 1. Assumption of Normality
% 2. Homogeneity of Variance
% required by the t-test so that the sampling distribution of t follows 
% the theoretical t-distribution with the corresponding degree of freedom.

% Here we use non normal samples having difference in variance (non
% homogenious variance)

clear;
close all;

iterations = 1e3;    

t_arr = zeros(iterations, 1);        % array to score t values of each t test

for i = 1:iterations
    
    % generate first poisson distributed sample 
    n1 = 1000;
    norm1 = poissrnd(ones(n1, 1));

    lambda1 = 7;
    norm_dist_1 = norm1 * lambda1;
    
    
    % generate second poisson distributed sample
    n2 = 1000;
    norm2 = poissrnd(ones(n2, 1));
    
    lambda2 = 2;
    norm_dist_2 = norm2 * lambda2;
    
    
    % perform t test
    t_arr(i) = calculate_t(mean(norm_dist_1), mean(norm_dist_2), std(norm_dist_1), std(norm_dist_2), n1, n2);

end


histogram(t_arr, 'Normalization', 'pdf')
hold on
plot((-4:4e-3:4), tpdf((-4:4e-3:4), n1+n2-2), 'LineWidth', 2);
title(['Non-normal samples with very different variances  n1 = n2, df = ' num2str(n1+n2-2)])
xlabel('X values')
ylabel('Probability density')
legend('experimental t dist', 'theoretical t dist')