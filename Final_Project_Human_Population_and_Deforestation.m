%% Reading in Land Cover Data
filename = 'forest-area-as-share-of-land-area.csv';
ForestTable = readtable(filename);
Countries = ForestTable.Entity;

idx = find(strcmp('Brazil', Countries));
Forest_BRA = table2array(ForestTable(idx, 3:4));

idx = find(strcmp('United States', Countries));
Forest_US = table2array(ForestTable(idx, 3:4));
idx = find(Forest_US(:,1) >= 1990);
Forest_US = Forest_US(idx);

idx = find(strcmp('Liberia', Countries));
Forest_LIB = table2array(ForestTable(idx, 3:4));

%% Population Data
filename = 'Pop_Data.csv';
PopTable = readtable(filename);
years = 1990:1:2020;
years = years';
Pop_BRA = table2array(PopTable(1,5:35))';
Pop_US = table2array(PopTable(3,5:35))';
Pop_LIB = table2array(PopTable(2,5:35))';

%% GDP Data
filename = 'GDPpercapita.csv';
GDPTable = readtable(filename);

GDP_BRA = table2array(GDPTable(1,5:34))';
GDP_US = table2array(GDPTable(3,5:34))';
GDP_LIB = table2array(GDPTable(2,5:34))';

%% Preliminary Data Analysis
F_Av_BRA = mean(Forest_BRA);
F_Av_US = mean(Forest_US(2,:);
F_Av_LIB = mean(Forest_LIB);
