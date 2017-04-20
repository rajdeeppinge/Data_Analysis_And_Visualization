clear;
close all;

load('data_lab4.mat');

ammonia = ammonia_concentration;
N = 60;


mu = mean(ammonia);
sigma = std(ammonia);

dx= 1e-2;

points= 6/dx;

experi_thresprob= zeros(points,1);
theori_thresprob= zeros(points,1);
mse=zeros(points,1);
% for a threshold compute theorti and experi probs

stan_ammo = ammonia;

stan_ammo = (stan_ammo - mu)/sigma;



i=1;
length= length(stan_ammo);

for thres=-5:dx:5
    
    % experimental prob less than thres
    %exam=find(stan_ammo<=0);
    %size(exam,1)
   experi_thresprob(i)= size((find(stan_ammo<=thres)),2) / length;
   
   p = normcdf([-10 thres]);
   theori_thresprob(i)= p(2)-p(1);
   
   mse(i)= experi_thresprob(i)- theori_thresprob(i);
   i= i+1;
end

%remember to reset i;

thres_range= -5:dx:5;
figure
plot(thres_range,experi_thresprob);
title('Experimental cumulative probability distribution');
xlabel('threshold');
ylabel('cumulative probability');

figure
plot(thres_range,theori_thresprob);

title('Theorical cumulative probability distribution');
xlabel('threshold');
ylabel('cumulative probability');

figure
plot(thres_range,mse);

disp('mse')
N= size(theori_thresprob,1);
sum((theori_thresprob-experi_thresprob).^2)/N