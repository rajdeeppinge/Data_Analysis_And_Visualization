load('data_lab9.mat')


%% performing t test
std(traditional)
std(new)
[t3, df3] = calculate_t(mean(traditional), mean(new), std(traditional), std(new), numel(traditional), numel(new))

%% non parametric test - bootstrapping

combined= [traditional new];


% now for each itera resample, assign to x and y, compute the stat diff.
ite=10000;
n1= size(traditional,2); % columns of trad
n2= size(new,2);

stat_arr= zeros(ite,1);

for i=1:ite
    
    % sample with replace n1+n2, permute then n1 to n2
    sample_with_rep= datasample(combined,n1+n2);
    
    sample_with_rep( randperm( length(sample_with_rep) ) ); % shuffled 
    
    X= sample_with_rep(1:n1);
    Y= sample_with_rep((n1+1):(n1+n2));
    
    stat_arr(i)= median(X)- median(Y);
end

histogram(stat_arr);

% compute 2.5 and 97.5 th percentile

ci_lower=prctile(stat_arr,2.5)
ci_higher= prctile(stat_arr,97.5)

orig_median_diff= median(traditional)- median(new)