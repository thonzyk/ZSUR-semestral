%% --SEMESTR�LN� PR�CE Z P�EDM�TU ZSUR-- %%

%% INICIALIZACE
clear 
clc
tic

rastr = 5; % ��m men��, t�m hust�� vykreslen� bod�
load_data
create_color_sequence

%% UR�EN� PO�TU T��D
metoda_shlukove_hladiny
metoda_retezove_mapy
metoda_maxmin
pocet_trid = 3;

%% ROZT��D�N� TR�NOVAC�CH DAT
ner_binar_deleni
k_means

iterativni_optimalizace
my_iter_optimalizace

%% UR�EN� KLASIFIK�TOR�
bayes
bayes_plot
minimalni_vzdalenost
nejblizsi_soused

%% KLASIFIK�TORY S LDF
rosenblatt
konstantni_prirustky
upravene_konstantni_prirustky

toc
