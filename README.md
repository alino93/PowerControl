# PowerControl
Simuating Wind Machine Power control using H-infinity and Sliding mode controllers

### Reference
Please cite this paper: Nouriani, A. and Moradi, H., 2021. Variable speed wind turbine power control: A comparison between multiple MPPT based methods. International Journal of Dynamics and Control, pp.1-14. https://rdcu.be/cDLEI

## Sliding mode:

1-Install FAST

2-add your FAST bin folder to MATLAB directories: addpath('Your_CD_Drive:\Simulink\FAST\bin');

3-Run Run_closedloop.m for running simulation

4-Open Closedloop.slx to see results

(run Run_img_closedloop.m for mathematical model)


## H-infinity:

1-Run Run_me.m

2-Open Closedloop2.slx to see results

3-Run Robustness.m to see results.


## Backstepping:

1-Install FAST

2-add your FAST bin folder to MATLAB directories: addpath('Your_CD_Drive:\Simulink\FAST\bin');

3-Run Run_closedloop.m for running closed-loop simulation (run Run_img_closedloop.m for closed-loop mathematical model)

4-Open Closedloop.slx to see results

5- For open-loop modeling run Run_openloop.m (run Run_img_openloop.m for open-loop mathematical model)



## Install FAST from here:
https://www.nrel.gov/wind/nwtc/fast.html
