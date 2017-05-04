% function to calculate degree of freedom and t value for given set of data

function [t, df] = calculate_t(x1, x2, s1, s2, n1, n2)
    
% parameters
    % x1 : mean of first distribution
    % x2 : mean of second distribution
    % s1 : standard deviation of first distribution
    % s2 : standard deviation of second distribution
    % n1 : number of sample points of first distribution
    % n2 : number of sample points of second distribution

% return values
    % df : degrees of freedom
    % t : t value of the data
    
    
    % calculating degrees of freedom
    df = n1 + n2 - 2;
    
    % calculating t value
    t = (x1 - x2) / ( sqrt( ((s1*s1*(n1-1) + s2*s2*(n2-1))/df) * (1/n1 + 1/n2) ) );
end