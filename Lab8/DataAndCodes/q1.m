% Author - Rajdeep Pinge
% Date 7th March, 2017

% Code to compare the two objective methods: PSNR and SSIM of measuring video quality
% using the help of their correlation factor with MOS subjective
% measurement taken from observers.

clear;
close all;

data_q1 = xlsread('Results_Raw_Data_24obs.xls');

observer_data = data_q1(1:end, 1:24);
mos_vals = data_q1(1:end, 26);
a_vals = data_q1(1:end, 27);
b_vals = data_q1(1:end, 28);


% find correlation coefficient for method A
r_a = corr(mos_vals, a_vals)

% find correlation coefficient for method B
r_b = corr(mos_vals, b_vals)


% use Fischer transformation
f_a = 0.5 * log( (1+r_a) / (1-r_a) );
f_b = 0.5 * log( (1+r_b) / (1-r_b) );


% generate CI of r for method A for alpha = 0.05, df = 143
% NOTE: since underlying images on which the tests have been performed is
% same, the degree of freedom = n-1
n = numel(mos_vals);
t_0_975 = 1.977;        % alpha = 0.05, df = 143

f_lower_a = f_a - t_0_975 / sqrt(n-3);
f_upper_a = f_a + t_0_975 / sqrt(n-3);

r_lower_a = (exp(2*f_lower_a) - 1) / (exp(2*f_lower_a) + 1);
r_upper_a = (exp(2*f_upper_a) - 1) / (exp(2*f_upper_a) + 1);



% generate CI of r for b
n = numel(mos_vals);
t_0_975 = 1.977;        % alpha = 0.05, df = 865

f_lower_b = f_b - t_0_975 / sqrt(n-3);
f_upper_b = f_b + t_0_975 / sqrt(n-3);

r_lower_b = (exp(2*f_lower_b) - 1) / (exp(2*f_lower_b) + 1);
r_upper_b = (exp(2*f_upper_b) - 1) / (exp(2*f_upper_b) + 1);


% plot CI of both for significance level = 0.05
figure
line([2-0.25,2+0.25],[r_upper_a, r_upper_a],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2-0.25,2+0.25],[r_lower_a,r_lower_a],[0,0],'LineStyle','-','Color','r','LineWidth',2);
line([2,2],[r_lower_a,r_upper_a],[0,0],'LineStyle','-','Color','r','LineWidth',2);
hold on
plot([2,2], r_a, 'ro','LineWidth',2)
text(2+0.1,r_a,'a')

line([5-0.25,5+0.25],[r_upper_b, r_upper_b],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5-0.25,5+0.25],[r_lower_b,r_lower_b],[0,0],'LineStyle','-','Color','b','LineWidth',2);
line([5,5],[r_lower_b,r_upper_b],[0,0],'LineStyle','-','Color','b','LineWidth',2);
hold on
plot([5,5], r_b, 'bo','LineWidth',2)
text(5+0.1,r_b,'b')
title('95% CIs for correlation coefficients of A and B with MOS')
xlabel('X-axis (No significance)')
ylabel('Confidence Interval range')


%%%%%%%%%%%% calculate %age of outliers in CI of MOS %%%%%%%%%%%%%%%%%%%%

% first calculate CI for each MOS and check if the corresponding A and B
% values lie in that CI

[numVideos,numObservers] = size(observer_data);

a_outliers = 0;
b_outliers = 0;

for video = 1:numVideos
    df = numObservers - 1;
    t_score_95 = 2.069;
    
    sample = observer_data(video, :);
    
    % find mean of sample
    mean_sample = mean(sample);

    % find standard deviation of sample
    sd = std(sample);

    % find variance of sample
    var1 = sd*sd;
     
    % find the limits of CI for the sample
    % significance level = 0.05
    sample_upper = mean_sample + t_score_95 * sd/sqrt(df+1);
    sample_lower = mean_sample - t_score_95 * sd/sqrt(df+1);
    
    
    if (a_vals(video) > sample_upper) || (a_vals(video) < sample_lower)
        a_outliers = a_outliers + 1;
    end
    if (b_vals(video) > sample_upper) || (b_vals(video) < sample_lower)
        b_outliers = b_outliers + 1;
    end
     
end

a_outlier_perc = a_outliers * 100 / n;
b_outlier_perc = b_outliers * 100 / n;