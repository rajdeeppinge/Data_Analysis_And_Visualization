% function to calculate degree of freedom and t value for given set of data

function [t, df] = calculate_t(x1, x2, s1, s2, n1, n2)
    
% parameters
    % x1 : mean of first sample
    % x2 : mean of second sample
    % s1 : standard deviation of first sample
    % s2 : standard deviation of second sample
    % n1 : number of sample points of first sample
    % n2 : number of sample points of second sample

% return values
    % df : degrees of freedom
    % t : t value of the data
    
    
    % calculating degrees of freedom
    df = n1 + n2 - 2;
    
    % calculating t value
    t = (x1 - x2) / ( sqrt( ((s1*s1*(n1-1) + s2*s2*(n2-1))/df) * (1/n1 + 1/n2) ) );
end