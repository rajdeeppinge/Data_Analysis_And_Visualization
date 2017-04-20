clear
close all

load('data_lab3.mat');

ammo_conc= ammonia_concentration;

boxplot(ammo_conc)
title('Box plot for ammonia concentration(mg/L)')
ylabel('concentration (mg/L)')

figure
histogram(ammo_conc,25) % orig none
title('Histogram for ammonia concentration(mg/L)')
xlabel('concentration (mg/L)')
ylabel('Frequency')


mu= mean(ammo_conc)
sigma= std(ammo_conc)
med= median(ammo_conc)
mode= mode(ammo_conc)

prob_greater40 = length(find(ammo_conc > 40)) / length(ammo_conc)

stan_ammo = ammo_conc;

stan_ammo = (stan_ammo - mu)/sigma; % standardzied

x = (40 - mu)/sigma  

%mean(stan_ammo)
%std(stan_ammo) succ standardized

p = normcdf([-10 x])
p_less40= p(2)-p(1)
p_more40= 1- p_less40
