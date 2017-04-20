clear
close all
load('data_lab2.mat');

w= 1.5; 

% box plot - acr unscaled 
acr =ACR; 
[acr_q1,acr_q2,acr_q3]= my_box_plot(acr,1,2,10,10)
title('Box plot ACR- unscaled ');

% fences for outlier check -acr
lf_acr= acr_q1 - w*(acr_q3-acr_q1) 
uf_acr= acr_q3 +w*(acr_q3-acr_q1)

% check for outliers
n_outliers_acr = length(find(acr>uf_acr | acr<lf_acr ))


figure

% box plot - samviq unscaled 
samviq = SAMVIQ;
[samviq_q1,samviq_q2,samviq_q3]= my_box_plot(samviq,1,2,10,100);
title('Box plot SAMVIQ- unscaled ')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %fences for outlier check -samviq
lf_samviq= samviq_q1 - w*(samviq_q3-samviq_q1) 
uf_samviq= samviq_q3 +w*(samviq_q3-samviq_q1)

% check for outliers
n_outliers_samviq = length(find(samviq>uf_samviq | samviq< lf_samviq ))

figure

% comparision between SAMVIQ and ACR scaled up to 10 to 90

acr_scaled= acr.*20 - 10 ;
my_box_plot(acr_scaled,1,2,10,100);

samviq = SAMVIQ;
my_box_plot(samviq,5,6,10,150);

title('Comparision between SAMVIQ and ACR scaled up to 10 to 90')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

figure

% Comparision between normalized ACR and SAMVIQ 
acr_normal = acr./5; 
my_box_plot(acr_normal,1,2,10,1);

samviq_normal = samviq./100; 
my_box_plot(samviq_normal,5,6,10,1);
title('comparision between normalized ACR and SAMVIQ')

% std
disp('standard deviations of normalized acr and samviq')
std_acr_normalized=std(acr_normal)
std_samviq_normalized=std(samviq_normal)

% irq

%%%%%%%555555555%%%%%%%%%%%5 q3 



figure

histogram(acr,16) % orig none
xlabel('Average ACR')
ylabel('Frequency')
title('Histogram for Average ACR ratings')

figure

histogram(samviq,25)
xlabel('Average SAMVIQ')
ylabel('Frequency')
title('Histogram for Average SAMVIQ ratings')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d)

disp('Mean values of complete acr and samviq dataset')
mean_acr=mean(acr)
mean_samviq=mean(samviq)

% to store mean value of the half samples taken in the current iteration
meanlog_acr= zeros(1,100);
meanlog_samviq= zeros(1,100);

for i= 1:100
   
    % pick random sample of size 96
   acr_curr_sample = randsample(acr,96)  ;
    samviq_curr_sample = randsample(samviq,96)  ;
    
    meanlog_acr(i)= mean(acr_curr_sample);
    meanlog_samviq(i)= mean(samviq_curr_sample);
    
end

figure


plot(meanlog_acr)
title('Mean value of ACR sample of 96')

figure

plot(meanlog_samviq)
title('Mean value of SAMVIQ sample of 96')


asr_average= ones(1,100)*3.4975;
samviq_average= ones(1,100)*52.0036;


samviq_average= ones(1,100)*52.0036;

figure
plot (asr_average - meanlog_acr);
title('Difference between true mean and sample mean- ASR')
xlabel('iteration')
ylabel('error')
figure

plot (samviq_average - meanlog_samviq);
title('Difference between true mean and sample mean- SAMVIQ')
xlabel('iteration')
ylabel('error')