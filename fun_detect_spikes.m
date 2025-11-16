function [maxloc,maxX] = fun_detect_spikes(x, threshold, windowsize)
    point = find(x>threshold);
    maxloc = zeros(length(point),1);
    maxX   = zeros(length(point),1);
    ii = 0; jj = 0; current_p = -windowsize; 
    while ii <= length(point)-1
        ii = ii + 1;
        if point(ii)-current_p > windowsize
            jj = jj + 1;
            current_p = point(ii);
            current_p_later = min( current_p+windowsize-1,length(x) );
            [value,loc] = max( x(current_p:current_p_later) );
            maxloc(jj) = current_p+loc-1;
            maxV(jj) = value;
        end
    end
    maxloc = maxloc(1:jj);
    maxV = maxV(1:jj);
end