% Author - Rajdeep Pinge
% Date - 28-02-2017

% Code to statistically compare two algorithms of image grading using
% separate CI calculation for each sample

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
df1 = n1-1;
df2 = n2-1;

% t scores using calculator
t_score_95 = 2.571;
t_score_99 = 4.032;


% find the limits of CI for 1st sample
% significance level = 0.05
CI_95_high_1 = mean_psnr1 + t_score_95 * s1/sqrt(n1);
CI_95_low_1 = mean_psnr1 - t_score_95 * s1/sqrt(n1);
% significance level = 0.01
CI_99_high_1 = mean_psnr1 + t_score_99 * s1/sqrt(n1);
CI_99_low_1 = mean_psnr1 - t_score_99 * s1/sqrt(n1);


% find the limits of CI for 2nd sample
% significance level = 0.05
CI_95_high_2 = mean_psnr2 + t_score_95 * s2/sqrt(n2);
CI_95_low_2 = mean_psnr2 - t_score_95 * s2/sqrt(n2);
% significance level = 0.01
CI_99_high_2 = mean_psnr2 + t_score_99 * s2/sqrt(n2);
CI_99_low_2 = mean_psnr2 - t_score_99 * s2/sqrt(n2);


% plot CI of both for significance level = 0.01
line([2-0.25,2+0.25],[CI_99_high_1,CI_99_high_1],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2-0.25,2+0.25],[CI_99_low_1,CI_99_low_1],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2,2],[CI_99_low_1,CI_99_high_1],[0,0],'LineStyle','-','Color','r','LineWidth',2);
hold on
plot([2,2], mean_psnr1, 'ro','LineWidth',2)
text(2+0.1,mean_psnr1,'Algorithm 1')

line([5-0.25,5+0.25],[CI_99_high_2,CI_99_high_2],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5-0.25,5+0.25],[CI_99_low_2,CI_99_low_2],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5,5],[CI_99_low_2,CI_99_high_2],[0,0],'LineStyle','-','Color','b','LineWidth',2);
hold on
plot([5,5], mean_psnr2, 'bo','LineWidth',2)
text(5+0.1,mean_psnr2,'Algorithm 2')
title('Confidence intervals  significance level = 0.01')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval values')


% plot CI of both for significance level = 0.05
figure
line([2-0.25,2+0.25],[CI_95_high_1,CI_95_high_1],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2-0.25,2+0.25],[CI_95_low_1,CI_95_low_1],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2,2],[CI_95_low_1,CI_95_high_1],[0,0],'LineStyle','-','Color','r','LineWidth',2);
hold on
plot([2,2], mean_psnr1, 'ro','LineWidth',2)
text(2+0.1,mean_psnr1,'Algorithm 1')

line([5-0.25,5+0.25],[CI_95_high_2,CI_95_high_2],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5-0.25,5+0.25],[CI_95_low_2,CI_95_low_2],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5,5],[CI_95_low_2,CI_95_high_2],[0,0],'LineStyle','-','Color','b','LineWidth',2);
hold on
plot([5,5], mean_psnr2, 'bo','LineWidth',2)
text(5+0.1,mean_psnr2,'Algorithm 2')
title('Confidence intervals  significance level = 0.05')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval values')