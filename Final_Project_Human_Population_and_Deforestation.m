%% Reading in Data
filename = 'forest-area-as-share-of-land-area.csv';
ForestTable = readtable(filename);
Countries = ForestTable.Entity;
Brazil = Countries({'Brazil'},:)

%%
filename = 'Pop_Data.csv';
PopTable = readtable(filename);
PopData = table2array(PopTable)

%%
filename = 'GDPpercapita.csv';
GDPTable = readtable(filename);
