% Author - Rajdeep Pinge
% Date 7th March, 2017

% Code to compare the two objective methods: PSNR and SSIM of measuring image quality
% using the help of their correlation factor with MOS subjective
% measurement taken from observers.

clear;
close all;


load('data_lab8');

mos_vals = MOS';
psnr_vals = PSNR';
ssim_vals = SSIM';

% find correlation coefficient for psnr
r_psnr = corr(mos_vals, psnr_vals);

% find correlation coefficient for ssim
r_ssim = corr(mos_vals, ssim_vals);

% use Fischer transformation
f_psnr = 0.5 * log( (1+r_psnr) / (1-r_psnr) );
f_ssim = 0.5 * log( (1+r_ssim) / (1-r_ssim) );


% generate CI of r for psnr for alpha = 0.05, df = 865
% NOTE: since underlying images on which the tests have been performed is
% same, the degree of freedom = n-1
n = numel(mos_vals);
t_0_975 = 1.963;        % alpha = 0.05, df = 865

% find bounds of f value
f_lower_psnr = f_psnr - t_0_975 / sqrt(n-3);
f_upper_psnr = f_psnr + t_0_975 / sqrt(n-3);

% Find lower and upper bound for CI
r_lower_psnr = (exp(2*f_lower_psnr) - 1) / (exp(2*f_lower_psnr) + 1);
r_upper_psnr = (exp(2*f_upper_psnr) - 1) / (exp(2*f_upper_psnr) + 1);



% generate CI of r for ssim
n = numel(mos_vals);
t_0_975 = 1.963;        % alpha = 0.05, df = 865

% find bounds of f value
f_lower_ssim = f_ssim - t_0_975 / sqrt(n-3);
f_upper_ssim = f_ssim + t_0_975 / sqrt(n-3);

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
title('95% CIs for correlation coefficients of PSNR and SSIM with MOS')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval values')
