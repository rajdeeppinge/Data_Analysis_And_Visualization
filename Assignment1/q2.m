% code to find out the quality difference between two video streaming
% approaches

clear;
close all;

load('data_lab5');

% finding mean for each data set

%%%%% bit rate 3 MB/s %%%%%%%%%%%%%
% full HD data set
mean3_hd = mean(src1_fullHD_3Mb);
% 720p data set
mean3_scaled = mean(src1_720p_upscaled_3Mb);

%%%%% bit rate 9 MB/s %%%%%%%%%%%%%
% full HD data set
mean9_hd = mean(src1_fullHD_9Mb);
% 720p data set
mean9_scaled = mean(src1_720p_upscaled_9Mb);


% finding standard deviation of each data set

%%%%% bit rate 3 MB/s %%%%%%%%%%%%%
% full HD data set
sd3_hd = std(src1_fullHD_3Mb);
% 720p data set
sd3_scaled = std(src1_720p_upscaled_3Mb);

%%%%% bit rate 9 MB/s %%%%%%%%%%%%%
% full HD data set
sd9_hd = std(src1_fullHD_9Mb);
% 720p data set
sd9_scaled = std(src1_720p_upscaled_9Mb);


% size of each data set
size_arr = length(src1_720p_upscaled_3Mb);
n1 = size_arr;
n2 = size_arr;


% calculate t value and degrees of freedom

%%%%% bit rate 3 MB/s %%%%%%%%%%%%%
[t3, df3] = calculate_t(mean3_hd, mean3_scaled, sd3_hd, sd3_scaled, n1, n2)

%%%%% bit rate 9 MB/s %%%%%%%%%%%%%
[t9, df9] = calculate_t(mean9_hd, mean9_scaled, sd9_hd, sd9_scaled, n1, n2)