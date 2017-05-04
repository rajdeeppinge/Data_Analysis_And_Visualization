% Author - Rajdeep Pinge
% Date 7th March, 2017

% Code to compare the two objective methods: PSNR and SSIM of measuring image quality
% using the help of their correlation factor with MOS subjective
% measurement taken from observers.

% Here the local correlation factors are computed for a large number of iterations 
% by taking 20% of the total samples each time, finding their correlation
% factors and then taking the mean as the correlation coefficient of the
% whole process. The CIs are found out and the results are compared with
% part 1

clear;
close all;

load('data_lab8');

mos_mat = MOS';
psnr_mat = PSNR';
ssim_mat = SSIM';

iterations = 20000;

% calculate total size
n = numel(mos_mat);

% calculate 20% size
n_20perc = ceil(0.2 * n);

% create matrices to store correlation coefficients in each iteration
r_psnr_arr = zeros(iterations, 1);
r_ssim_arr = zeros(iterations, 1);

% Iterate 20000 times to remove the effect of randomness
for i = 1:iterations
    
    % find samples randomly
    index_20perc = randperm(n, n_20perc);
    
    mos_vals = mos_mat(index_20perc);
    psnr_vals = psnr_mat(index_20perc);
    ssim_vals = ssim_mat(index_20perc);
    
    % find correlation coefficient for psnr
    r_psnr_arr(i) = corr(mos_vals, psnr_vals);

    % find correlation coefficient for ssim
    r_ssim_arr(i) = corr(mos_vals, ssim_vals);

end

% take mean of the stored values as the actual correlation coefficient
r_psnr = mean(r_psnr_arr);

r_ssim = mean(r_ssim_arr);

% use Fischer transformation
f_psnr = 0.5 * log( (1+r_psnr) / (1-r_psnr) );
f_ssim = 0.5 * log( (1+r_ssim) / (1-r_ssim) );

% generate CI of r for psnr for alpha = 0.05, df = 173
% NOTE: since underlying images on which the tests have been performed is
% same, the degree of freedom = n-1
t_0_975 = 1.974;        % alpha = 0.05, df = 173

% find bounds of f value
f_lower_psnr = f_psnr - t_0_975 / sqrt(n_20perc-3);
f_upper_psnr = f_psnr + t_0_975 / sqrt(n_20perc-3);

% Find lower and upper bound for CI
r_lower_psnr = (exp(2*f_lower_psnr) - 1) / (exp(2*f_lower_psnr) + 1);
r_upper_psnr = (exp(2*f_upper_psnr) - 1) / (exp(2*f_upper_psnr) + 1);



% generate CI of r for ssim for alpha = 0.05, df = 173
t_0_975 = 1.974;        % alpha = 0.05, df = 173

% find bounds of f value
f_lower_ssim = f_ssim - t_0_975 / sqrt(n_20perc-3);
f_upper_ssim = f_ssim + t_0_975 / sqrt(n_20perc-3);

% Find lower and upper bound for CI
r_lower_ssim = (exp(2*f_lower_ssim) - 1) / (exp(2*f_lower_ssim) + 1);
r_upper_ssim = (exp(2*f_upper_ssim) - 1) / (exp(2*f_upper_ssim) + 1);


% plot CI of both for significance level = 0.05
figure
line([2-0.25,2+0.25],[r_upper_psnr, r_upper_psnr],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2-0.25,2+0.25],[r_lower_psnr,r_lower_psnr],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2,2],[r_lower_psnr,r_upper_psnr],[0,0],'LineStyle','-','Color','r','LineWidth',2);
hold on
plot([2,2], r_psnr, 'ro','LineWidth',2)
text(2+0.1,r_psnr,'PSNR')

line([5-0.25,5+0.25],[r_upper_ssim, r_upper_ssim],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5-0.25,5+0.25],[r_lower_ssim,r_lower_ssim],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5,5],[r_lower_ssim,r_upper_ssim],[0,0],'LineStyle','-','Color','b','LineWidth',2);
hold on
plot([5,5], r_ssim, 'bo','LineWidth',2)
text(5+0.1,r_ssim,'SSIM')
title('95% CI for correlation coefficients on 20% of samples for 20000 iterations')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval values')
