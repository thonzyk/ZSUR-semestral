%% --SEMESTRÁLNÍ PRÁCE Z PØEDMÌTU ZSUR-- %%

%% INICIALIZACE
clear 
clc
tic

rastr = 5; % èím menší, tím hustší vykreslení bodù
load_data
create_color_sequence

%% URÈENÍ POÈTU TØÍD
metoda_shlukove_hladiny
metoda_retezove_mapy
metoda_maxmin
pocet_trid = 3;

%% ROZTØÍDÌNÍ TRÉNOVACÍCH DAT
ner_binar_deleni
k_means

iterativni_optimalizace
my_iter_optimalizace

%% URÈENÍ KLASIFIKÁTORÙ
bayes
bayes_plot
minimalni_vzdalenost
nejblizsi_soused

%% KLASIFIKÁTORY S LDF
rosenblatt
konstantni_prirustky
upravene_konstantni_prirustky

toc
