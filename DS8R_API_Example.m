% Example usage of DS8R_class

level5 = DS8R_class;
level4 = DS8R_class;
level3 = DS8R_class;
level2 = DS8R_class;
level1 = DS8R_class;

set_DS8R(level5, 'Demand', 350, 'PulseWidth', 2000, 'Enabled', 1, 'Dwell', 10, 'Mode', 1, 'Polarity', 1, 'Source', 1, 'Recovery', 20)
set_DS8R(level4, 'Demand', 250, 'PulseWidth', 2000, 'Enabled', 1)
set_DS8R(level3, 'Demand', 200, 'PulseWidth', 2000,  'Enabled', 1)
set_DS8R(level2, 'Demand', 150, 'PulseWidth', 2000, 'Enabled', 1)
set_DS8R(level1, 'Demand', 100, 'PulseWidth', 2000,  'Enabled', 1)

exe_DS8R(level5)
pause(0.5)

exe_DS8R(level4)
pause(0.5)

exe_DS8R(level3)
pause(0.5)

exe_DS8R(level2)
pause(0.5)

exe_DS8R(level1)