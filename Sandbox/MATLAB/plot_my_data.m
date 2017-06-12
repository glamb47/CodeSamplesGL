% Garret Lamb
clear; % clear workspace
clf; % clear figure
pop = xlsread('vetpop', 'Table 1L', 'B20:V20');
% xlsread('filename', 'sheet', 'range')
bar(pop)
Labels = {'2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2030', '2031', '2032', '2033'};
set(gca, 'XTick', 1:21, 'XTickLabel', Labels);
xlabel('Year'), ylabel('Population in 10 Millions')
title({'Predicted Veteran Population 2013-2033' 'http://www.va.gov/vetdata/Veteran_Population.asp'})
