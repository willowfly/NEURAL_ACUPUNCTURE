function [fs,res,idx] = fun_trim_data(inputfile,offset)
    load(inputfile); 
    fs = samplerate(1); 
    N_base = 10*60*fs; N_drug = 15*60*fs; N_acu  = 10*60*fs; N_reco = 10*60*fs;
    datastart
    point_acu = datastart(2); 
    point_reco = datastart(3);
    point_drug = point_acu - N_drug;
    point_base = point_drug - N_base;
    idx_base = [point_base:point_base+N_base-1];
    idx_drug = [point_drug:point_drug+N_drug-1];
    idx_acu  = [point_acu:point_acu+N_acu-1];
    idx_reco = [point_reco:point_reco+N_reco-1];
    if offset>0
        idx_acu = [point_acu:point_acu+N_acu-1]+240*fs;
        filter4 = 3*120*fs + (1:120*fs);
        new_filter = 3*120*fs + [60*fs+(1:60*fs), 1:60*fs];
        idx_acu(filter4) = idx_acu( new_filter );
    end

    data_base = data(idx_base);
    data_drug = data(idx_drug);
    data_acu  = data(idx_acu); 
    data_reco = data(idx_reco); 
    res = [data_base, data_drug, data_acu, data_reco];
    idx = [1, N_base-1; 
           N_base, N_base+N_drug-1;
           N_base+N_drug, N_base+N_drug+N_acu-1;
           N_base+N_drug+N_acu, N_base+N_drug+N_acu+N_reco];
end