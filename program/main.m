%% SEMESTR�LN� PR�CE Z P�EDM�TU ZSUR

clear 
clc

tic;

load_data

%class_identity = zeros(length(data), 1);

metoda_shlukove_hladiny

fprintf('Po�et t��d dle metody shlukov� hladiny je: %d\n', pocet_trid_MSH)

toc