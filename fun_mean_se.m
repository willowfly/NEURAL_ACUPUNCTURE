function [m,sd,se] = fun_mean_se(X,method)

    if method==1
        X = X(:); 
    end

    if method==2
        X = mean(X,2); X = X(:);
    end

    if method==3
        X = mean(X,1); X = X(:);
    end 
    m = mean(X); sd = std(X); se = sd/sqrt(length(X)); 
end

