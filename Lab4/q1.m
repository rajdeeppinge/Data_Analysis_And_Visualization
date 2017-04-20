clear
close all
 
load('data_lab4.mat')
 
%%%%%%%%%%%%%%%%%% data set : population_normal %%%%%%%%%%%%%%
 
population = population_normal;
 
% normalize the data
mu = mean(population);
sigma = std(population);
population= (population - mu) / sigma; 
 
% number of iterations
N = 10000;
 
% array of sample sizes
sample_size = [50 1500 2500];
 
% array of JB test values
jb_arr= zeros(N,(length(sample_size)));
 
% prediction array 1 = Normal Dist, 0 = Not Normal
prediction_pop = zeros(length(sample_size), 1);
 
% loop over different sample sizes
for j = 1:length(sample_size)
    
    % iterate a large number of times
    for i = 1:N
 
        % this is valid in MATLAB 2015 or higher versions
        permindex= randperm(length(population),sample_size(j));
        sample = population(permindex);
 
        % for MATLAB 2010
        % sample the given data
        %sample = randsample(population, sample_size(j));
 
        mu = mean(sample);
        sigma = std(sample);
 
        skew = sum( ( (sample-mu)./sigma).^3 ) /sample_size(j);
        kurtosis = sum( ( (sample-mu)./sigma).^4 ) /sample_size(j);
 
        % calc the jb values
        jb_arr(i, j)= sample_size(j)/6*(skew*skew + (kurtosis-3)*(kurtosis-3)/4);
    end
 
    %%%%%plot histogramogram
    
    % matlab 2015
    %histogramogram(jb_arr);
 
    figure
    histogram(jb_arr(:, j));
    title('histogramogram for sample size = ')
    xlabel('JB value')
    ylabel('Frequency')
    
    
    % check from JB values whether the data follows normal distribution
    alpha = 0.05;
    
    chi2DistVal = 5.991;
    
    confidence = 0;
    
    for k = 1:N
        if jb_arr(k, j) <= chi2DistVal
            confidence = confidence + 1;
        end
    end
        
    confidence_level = confidence / N
    
    % if confidence level more, prediction = Normal Dist.
    if confidence_level >= (1-alpha)*100
        prediction_pop(j) = 1;
    end
    
    % plot CDF to determine whether sample is normally distributed or not
    figure
    cdfplot(jb_arr(:, j));
    
end
 
 
 
 
 
 
 
%%%%%%%%%%%%%%%%%% data set : sample_50k %%%%%%%%%%%%%%
 
population = sample_50k;
 
% normalize the data
mu = mean(population);
sigma = std(population);
population= (population - mu) / sigma; 
 
% number of iterations
N = 10000;
 
% array of sample sizes
sample_size = [50 1500 2500];
 
% array of JB test values
jb_arr= zeros(N,(length(sample_size)));
 
% prediction array 1 = Normal Dist, 0 = Not Normal
prediction_50k = zeros(length(sample_size), 1);
 
% loop over different sample sizes
for j = 1:length(sample_size)
    
    % iterate a large number of times
    for i = 1:N
 
        % this is valid in MATLAB 2015 or higher versions
        permindex= randperm(length(population),sample_size(j));
        sample = population(permindex);
 
        % for MATLAB 2010
        % sample the given data
        %sample = randsample(population, sample_size(j));
 
        mu = mean(sample);
        sigma = std(sample);
 
        skew = sum( ( (sample-mu)./sigma).^3 ) /sample_size(j);
        kurtosis = sum( ( (sample-mu)./sigma).^4 ) /sample_size(j);
 
        % calc the jb values
        jb_arr(i, j)= sample_size(j)/6*(skew*skew + (kurtosis-3)*(kurtosis-3)/4);
    end
 
    %%%%%plot histogramogram
    
    % matlab 2015
    %histogramogram(jb_arr);
 
    figure
    histogram(jb_arr(:, j));
    title('histogramogram for sample size = ')
    xlabel('JB value')
    ylabel('Frequency')
    
    
    % check from JB values whether the data follows normal distribution
    alpha = 0.05;
    
    chi2DistVal = 5.991;
    
    confidence = 0;
    
    for k = 1:N
        if jb_arr(k, j) <= chi2DistVal
            confidence = confidence + 1;
        end
    end
        
    confidence_level = confidence / N
    
    % if confidence level more, prediction = Normal Dist.
    if confidence_level >= (1-alpha)*100
        prediction_50k(j) = 1;
    end
    
    % plot CDF to determine whether sample is normally distributed or not
    figure
    cdfplot(jb_arr(:, j));
    
end
 
 
 
 
 
 
 
%%%%%%%%%%%%%%%%%% data set : ammonia_concentration %%%%%%%%%%%%%%
 
population = ammonia_concentration;
 
% normalize the data
mu = mean(population);
sigma = std(population);
population= (population - mu) / sigma; 
 
% number of iterations
N = 10000;
 
% array of sample sizes
sample_size = [50 100 500];
 
% array of JB test values
jb_arr= zeros(N,(length(sample_size)));
 
% prediction array 1 = Normal Dist, 0 = Not Normal
prediction_ammo = zeros(length(sample_size), 1);
 
% loop over different sample sizes
for j = 1:length(sample_size)
    
    % iterate a large number of times
    for i = 1:N
 
        % this is valid in MATLAB 2015 or higher versions
        permindex= randperm(length(population),sample_size(j));
        sample = population(permindex);
 
        % for MATLAB 2010
        % sample the given data
        %sample = randsample(population, sample_size(j));
 
        mu = mean(sample);
        sigma = std(sample);
 
        skew = sum( ( (sample-mu)./sigma).^3 ) /sample_size(j);
        kurtosis = sum( ( (sample-mu)./sigma).^4 ) /sample_size(j);
 
        % calc the jb values
        jb_arr(i, j)= sample_size(j)/6*(skew*skew + (kurtosis-3)*(kurtosis-3)/4);
    end
 
    %%%%%plot histogramogram
    
    % matlab 2015
    %histogramogram(jb_arr);
 
    figure
    histogram(jb_arr(:, j));
    title('histogramogram for sample size = ')
    xlabel('JB value')
    ylabel('Frequency')
    
    
    % check from JB values whether the data follows normal distribution
    alpha = 0.05;
    
    chi2DistVal = 5.991;
    
    confidence = 0;
    
    for k = 1:N
        if jb_arr(k, j) <= chi2DistVal
            confidence = confidence + 1;
        end
    end
        
    confidence_level = confidence / N
    
    % if confidence level more, prediction = Normal Dist.
    if confidence_level >= (1-alpha)*100
        prediction_ammo(j) = 1;
    end
    
    % plot CDF to determine whether sample is normally distributed or not
    figure
    cdfplot(jb_arr(:, j));
    
end
 
 
 
 
 
 
 
 
 
%%%%%%%%%%%%%%%%%% data set : score_natural_model %%%%%%%%%%%%%%
 
population = score_natural_model;
 
% normalize the data
mu = mean(population);
sigma = std(population);
population= (population - mu) / sigma; 
 
% number of iterations
N = 10000;
 
% array of sample sizes
sample_size = [50 1500 2500];
 
% array of JB test values
jb_arr= zeros(N,(length(sample_size)));
 
% prediction array 1 = Normal Dist, 0 = Not Normal
prediction_sco = zeros(length(sample_size), 1);
 
% loop over different sample sizes
for j = 1:length(sample_size)
    
    % iterate a large number of times
    for i = 1:N
 
        % this is valid in MATLAB 2015 or higher versions
        permindex= randperm(length(population),sample_size(j));
        sample = population(permindex);
 
        % for MATLAB 2010
        % sample the given data
        %sample = randsample(population, sample_size(j));
 
        mu = mean(sample);
        sigma = std(sample);
 
        skew = sum( ( (sample-mu)./sigma).^3 ) /sample_size(j);
        kurtosis = sum( ( (sample-mu)./sigma).^4 ) /sample_size(j);
 
        % calc the jb values
        jb_arr(i, j)= sample_size(j)/6*(skew*skew + (kurtosis-3)*(kurtosis-3)/4);
    end
 
    %%%%%plot histogramogram
    
    % matlab 2015
    %histogramogram(jb_arr);
 
    figure
    histogram(jb_arr(:, j));
    title('histogramogram for sample size = ')
    xlabel('JB value')
    ylabel('Frequency')
    
    
    % check from JB values whether the data follows normal distribution
    alpha = 0.05;
    
    chi2DistVal = 5.991;
    
    confidence = 0;
    
    for k = 1:N
        if jb_arr(k, j) <= chi2DistVal
            confidence = confidence + 1;
        end
    end
        
    confidence_level = confidence / N
    
    % if confidence level more, prediction = Normal Dist.
    if confidence_level >= (1-alpha)*100
        prediction_sco(j) = 1;
    end
    
    % plot CDF to determine whether sample is normally distributed or not
    figure
    cdfplot(jb_arr(:, j));
    
end
 
 
 
 
 
 
 
 
 
%%%%%%%%%%%%%%%%%% data set : data4 %%%%%%%%%%%%%%
 
population = data4;
 
% normalize the data
mu = mean(population);
sigma = std(population);
population= (population - mu) / sigma; 
 
% number of iterations
N = 10000;
 
% array of sample sizes
sample_size = [10 50 500];
 
% array of JB test values
jb_arr= zeros(N,(length(sample_size)));
 
% prediction array 1 = Normal Dist, 0 = Not Normal
prediction_d4 = zeros(length(sample_size), 1);
 
% loop over different sample sizes
for j = 1:length(sample_size)
    
    % iterate a large number of times
    for i = 1:N
 
        % this is valid in MATLAB 2015 or higher versions
        permindex= randperm(length(population),sample_size(j));
        sample = population(permindex);
 
        % for MATLAB 2010
        % sample the given data
        %sample = randsample(population, sample_size(j));
 
        mu = mean(sample);
        sigma = std(sample);
 
        skew = sum( ( (sample-mu)./sigma).^3 ) /sample_size(j);
        kurtosis = sum( ( (sample-mu)./sigma).^4 ) /sample_size(j);
 
        % calc the jb values
        jb_arr(i, j)= sample_size(j)/6*(skew*skew + (kurtosis-3)*(kurtosis-3)/4);
    end
 
    %%%%%plot histogramogram
    
    % matlab 2015
    %histogramogram(jb_arr);
 
    figure
    histogram(jb_arr(:, j));
    title('histogramogram for sample size = ')
    xlabel('JB value')
    ylabel('Frequency')
    
    
    % check from JB values whether the data follows normal distribution
    alpha = 0.05;
    
    chi2DistVal = 5.991;
    
    confidence = 0;
    
    for k = 1:N
        if jb_arr(k, j) <= chi2DistVal
            confidence = confidence + 1;
        end
    end
        
    confidence_level = confidence / N
    
    % if confidence level more, prediction = Normal Dist.
    if confidence_level >= (1-alpha)*100
        prediction_d4(j) = 1;
    end
    
    % plot CDF to determine whether sample is normally distributed or not
    figure
    cdfplot(jb_arr(:, j));
    
end
 
 
 
 
 
 
 
 
 
 
 
%%%%%%%%%%%%%%%%%% data set : sample_50 %%%%%%%%%%%%%%
 
population = sample_50;
 
% normalize the data
mu = mean(population);
sigma = std(population);
population= (population - mu) / sigma; 
 
% number of iterations
N = 10000;
 
% array of sample sizes
sample_size = [5 10 25];
 
% array of JB test values
jb_arr= zeros(N,(length(sample_size)));
 
% prediction array 1 = Normal Dist, 0 = Not Normal
prediction_50 = zeros(length(sample_size), 1);
 
% loop over different sample sizes
for j = 1:length(sample_size)
    
    % iterate a large number of times
    for i = 1:N
 
        % this is valid in MATLAB 2015 or higher versions
        permindex= randperm(length(population),sample_size(j));
        sample = population(permindex);
 
        % for MATLAB 2010
        % sample the given data
        %sample = randsample(population, sample_size(j));
 
        mu = mean(sample);
        sigma = std(sample);
 
        skew = sum( ( (sample-mu)./sigma).^3 ) /sample_size(j);
        kurtosis = sum( ( (sample-mu)./sigma).^4 ) /sample_size(j);
 
        % calc the jb values
        jb_arr(i, j)= sample_size(j)/6*(skew*skew + (kurtosis-3)*(kurtosis-3)/4);
    end
 
    %%%%%plot histogramogram
    
    % matlab 2015
    %histogramogram(jb_arr);
 
    figure
    histogram(jb_arr(:, j));
    title('histogramogram for sample size = ')
    xlabel('JB value')
    ylabel('Frequency')
    
    
    % check from JB values whether the data follows normal distribution
    alpha = 0.05;
    
    chi2DistVal = 5.991;
    
    confidence = 0;
    
    for k = 1:N
        if jb_arr(k, j) <= chi2DistVal
            confidence = confidence + 1;
        end
    end
        
    confidence_level = confidence / N
    
    % if confidence level more, prediction = Normal Dist.
    if confidence_level >= (1-alpha)*100
        prediction_50(j) = 1;
    end
    
    % plot CDF to determine whether sample is normally distributed or not
    figure
    cdfplot(jb_arr(:, j));
    
end