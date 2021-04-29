%% Reading in Land Cover Data
filename = 'forest-area-as-share-of-land-area.csv';
ForestTable = readtable(filename);
Countries = ForestTable.Entity;

idx = find(strcmp('Brazil', Countries));
Forest_BRA = table2array(ForestTable(idx, 4));

idx = find(strcmp('United States', Countries));
Forest_US = table2array(ForestTable(idx, 3:4));
idx = find(Forest_US(:,1) >= 1990);
Forest_US = Forest_US(idx,2);

idx = find(strcmp('Liberia', Countries));
Forest_LIB = table2array(ForestTable(idx, 4));

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
%% Forest Cover Basic Statistics
F_Av_BRA = mean(Forest_BRA);
F_Av_US = mean(Forest_US);
F_Av_LIB = mean(Forest_LIB);

F_Rate_BRA = gradient(Forest_BRA);
F_Rate_US = gradient(Forest_US);
F_Rate_LIB = gradient(Forest_LIB);

F_Rate_Av_BRA = mean(F_Rate_BRA);
F_Rate_Av_US = mean(F_Rate_US);
F_Rate_Av_LIB = mean(F_Rate_LIB);

F_Av_90s_BRA = mean(Forest_BRA(1:10));
F_Av_90s_US = mean(Forest_US(1:10));
F_Av_90s_LIB = mean(Forest_LIB(1:10)); 

F_Av_00s_BRA = mean(Forest_BRA(11:20));
F_Av_00s_US = mean(Forest_US(11:20));
F_Av_00s_LIB = mean(Forest_LIB(11:20));

% includes 2020
F_Av_10s_BRA = mean(Forest_BRA(21:31));
F_Av_10s_US = mean(Forest_US(21:31));
F_Av_10s_LIB = mean(Forest_LIB(21:31));

%For F_DecAvs, the rows are Brazil, US, and Liberia in order from top to bottom and the columns are 1990s, 2000s, and 2010s in order from left to right 
% the 2010s includes data from 2020
F_DecAvs = NaN(3,3);
for i = 1:3
    if i == 1
        idx = 1:10;
        F_DecAvs(1,1) = mean(Forest_BRA(idx));
        F_DecAvs(2,1) = mean(Forest_US(idx));
        F_DecAvs(3,1) = mean(Forest_LIB(idx));
    end
    if i == 2
        idx = 11:20;
        F_DecAvs(1,2) = mean(Forest_BRA(idx));
        F_DecAvs(2,2) = mean(Forest_US(idx));
        F_DecAvs(3,2) = mean(Forest_LIB(idx));
    end
   if i == 3
        idx = 21:31;
        F_DecAvs(1,3) = mean(Forest_BRA(idx));
        F_DecAvs(2,3) = mean(Forest_US(idx));
        F_DecAvs(3,3) = mean(Forest_LIB(idx));
   end
end

%% Population Basic Statistics
P_Av_BRA = mean(Pop_BRA);
P_Av_US = mean(Pop_US);
P_Av_LIB = mean(Pop_LIB); 

Pop_Rate_BRA = gradient(Pop_BRA);
Pop_Rate_US = gradient(Pop_US);
Pop_Rate_LIB = gradient(Pop_LIB);

Pop_Rate_Av_BRA = mean(Pop_Rate_BRA);
Pop_Rate_Av_US = mean(Pop_Rate_US);
Pop_Rate_Av_LIB = mean(Pop_Rate_LIB);

%For Pop_DecAvs, the rows are Brazil, US, and Liberia in order from top to bottom and the columns are 1990s, 2000s, and 2010s from left to right
% the 2010s includes data from 2020
Pop_DecAvs = NaN(3,3);
for i = 1:3
    if i == 1
        idx = 1:10;
        Pop_DecAvs(1,1) = mean(Pop_BRA(idx));
        Pop_DecAvs(2,1) = mean(Pop_US(idx));
        Pop_DecAvs(3,1) = mean(Pop_LIB(idx));
    end
    if i == 2
        idx = 11:20;
        Pop_DecAvs(1,2) = mean(Pop_BRA(idx));
        Pop_DecAvs(2,2) = mean(Pop_US(idx));
        Pop_DecAvs(3,2) = mean(Pop_LIB(idx));
    end
   if i == 3
        idx = 21:31;
        Pop_DecAvs(1,3) = mean(Pop_BRA(idx));
        Pop_DecAvs(2,3) = mean(Pop_US(idx));
        Pop_DecAvs(3,3) = mean(Pop_LIB(idx));
   end
end

%% GDP Basic Statistics
GDP_Av_BRA = mean(GDP_BRA);
GDP_Av_US = mean(GDP_US);
GDP_Av_LIB = nanmean(GDP_LIB); 

GDP_Rate_BRA = gradient(GDP_BRA);
GDP_Rate_US = gradient(GDP_US);
GDP_Rate_LIB = gradient(GDP_LIB);

GDP_Rate_Av_BRA = mean(GDP_Rate_BRA);
GDP_Rate_Av_US = mean(GDP_Rate_US);
GDP_Rate_Av_LIB = nanmean(GDP_Rate_LIB);

% For GDP_DecAvs, the rows are Brazil, US, and Liberia in order from top to
% bottom and the columns are 1990s, 2000s, and 2010s from left to right
% the 2010s does not include data from 2020
% missing data for Liberia during 1990s
GDP_DecAvs = NaN(3,3)
for i = 1:3
    if i == 1
        idx = 1:10;
        GDP_DecAvs(1,1) = mean(GDP_BRA(idx));
        GDP_DecAvs(2,1) = mean(GDP_US(idx));
        GDP_DecAvs(3,1) = mean(GDP_LIB(idx));
    end
    if i == 2
        idx = 11:20;
        GDP_DecAvs(1,2) = mean(GDP_BRA(idx));
        GDP_DecAvs(2,2) = mean(GDP_US(idx));
        GDP_DecAvs(3,2) = mean(GDP_LIB(idx));
    end
   if i == 3
        idx = 21:30;
        GDP_DecAvs(1,3) = mean(GDP_BRA(idx));
        GDP_DecAvs(2,3) = mean(GDP_US(idx));
        GDP_DecAvs(3,3) = mean(GDP_LIB(idx));
   end
end
        
%% 
figure (1)
yyaxis left
plot(years, (100-Forest_BRA))
yyaxis right
plot(years, Pop_BRA)

figure (2); clf
yyaxis left
plot(years, (100-Forest_US))
yyaxis right
plot(years, Pop_US)

figure (3); clf
yyaxis left
plot(years, (100-Forest_LIB))
yyaxis right
plot(years, Pop_LIB)

%%
[~,~, ~, ~, stats] = regress(Pop_BRA, (100-Forest_BRA));
PopF_R2_BRA = stats(1,1);

[~,~, ~, ~, stats] = regress(Pop_US, (100-Forest_US));
PopF_R2_US = stats(1,1);

[~,~, ~, ~, stats] = regress(Pop_LIB, (100-Forest_LIB));
PopF_R2_LIB = stats(1,1);

