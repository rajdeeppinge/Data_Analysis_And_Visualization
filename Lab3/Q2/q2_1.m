clear;
close all;

load('data_lab3.mat')
arr = score_natural_model;
mean_arr = mean(arr);
std_arr = std(arr);


start = mean_arr-3*std_arr;
ending = mean_arr + 3*std_arr;

dt = 0.01;

x = start:dt:ending;
y = zeros(size(x));
for i = 1:size(x,2)
    y(i) = (1/(std_arr*sqrt(2*pi)))*exp(-0.5*((x(i) - mean_arr)/std_arr)^2);
end
figure
plot(x,y,'g');

y1 = zeros(size(score_test));
test = score_test;
outlier = zeros(size(test));
%lets assume the ones beyond 1.5*sigma as outliers

for i = 1:size(test,1) 
    hold on;
    
    if abs(test(i) - mean_arr) > 0.5*std_arr
        y1(i) = (1/(std_arr*sqrt(2*pi)))*exp(-0.5*((test(i) - mean_arr)/std_arr)^2);
        plot(test(i),y1(i),'r^');
        outlier(i) = 1;
    else
        y1(i) = (1/(std_arr*sqrt(2*pi)))*exp(-0.5*((test(i) - mean_arr)/std_arr)^2);
        plot(test(i),y1(i),'b^');
    end
   
    
end

outlier