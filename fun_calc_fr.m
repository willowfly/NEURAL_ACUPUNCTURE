function [fr] = fun_calc_fr(data,window_in_seconds,fs)
    window_size = window_in_seconds*fs;
    N = floor(length(data)/window_size); 
    data = reshape(data(1:window_size*N),window_size,N);
    firing_num = sum(data);
    fr = firing_num / window_in_seconds; % spikes/second, or Hz
end