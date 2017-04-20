% Author - Rajdeep Pinge
% Date - 28-02-2017

% Code to statistically compare two algorithms of image grading using 
% CI method for difference of population mean and using paired t test

clear;
close all;

load('data_lab7');

% find mean of samples
mean_psnr1 = mean(psnr1);
mean_psnr2 = mean(psnr2);

% find standard deviation of samples
s1 = std(psnr1);
s2 = std(psnr2);

% find variance of samples
var1 = s1*s1;
var2 = s2*s2;

n1 = length(psnr1);
n2 = length(psnr2);

% degree of freedom
df = n1+n2-2;

% t scores using calculator
t_score_95 = 2.228;
t_score_99 = 3.169;

% find the limits of CI

% significance level = 0.05
CI_95_high = mean_psnr1 - mean_psnr2 + t_score_95 * sqrt( ((var1*(n1-1) + var2*(n2-1))/df) * (1/n1 + 1/n2) );
CI_95_low = mean_psnr1 - mean_psnr2 - t_score_95 * sqrt( ((var1*(n1-1) + var2*(n2-1))/df) * (1/n1 + 1/n2) );

% significance level = 0.01
CI_99_high = mean_psnr1 - mean_psnr2 + t_score_99 * sqrt( ((var1*(n1-1) + var2*(n2-1))/df) * (1/n1 + 1/n2) );
CI_99_low = mean_psnr1 - mean_psnr2 - t_score_99 * sqrt( ((var1*(n1-1) + var2*(n2-1))/df) * (1/n1 + 1/n2) );

% Plot CIs

axis([1 3 CI_99_low-1 CI_99_high+1]) 
line([2-0.25,2+0.25],[CI_99_high,CI_99_high],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2-0.25,2+0.25],[CI_99_low,CI_99_low],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2,2],[CI_99_low,CI_99_high],[0,0],'LineStyle','-','Color','r','LineWidth',2);
hold on
plot([2,2], mean_psnr1 - mean_psnr2, 'ro','LineWidth',2)
title('Confidence intervals using difference in mean method')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval values')
legend('significance level = 0.01'); 

figure
axis([4 6 CI_99_low-1 CI_99_high+1])
line([5-0.25,5+0.25],[CI_95_high,CI_95_high],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5-0.25,5+0.25],[CI_95_low,CI_95_low],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5,5],[CI_95_low,CI_95_high],[0,0],'LineStyle','-','Color','b','LineWidth',2);
hold on
plot([5,5], mean_psnr1 - mean_psnr2, 'bo','LineWidth',2)
title('Confidence intervals using difference in mean method')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval values')
legend('significance level = 0.05'); 


%%%%%%%%%%%% Check using t test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% paired t test because underlying 6 images are same %%%%%%%%%%

% take difference of sample values
diff_psnr = psnr1 - psnr2;

% find mean of difference of sample values
mean_psnr = mean(diff_psnr);

% find standard deviation of difference of sample values
sd_psnr = std(diff_psnr);

% calculate degree of freedom for the paired test sample which is (n-1)
deg_of_freedom = length(diff_psnr) - 1;

% calculate effect size
effect_size = mean_psnr / sd_psnr

% find t value for paired t test
paired_t = effect_size * sqrt(deg_of_freedom + 1)


% p value as calculated on the t score calculator
pval = 0.0342

%%% The p value is well within the significant level range
