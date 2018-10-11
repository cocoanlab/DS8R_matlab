# Control of Digitimer DS8R using Matlab
The files provided here enable control of [Digitimer DS8R](https://digitimer.com/products/human-neurophysiology/peripheral-stimulators-2/ds8/) current stimulator using Matlab. The codes were tested on a computer with 64-bit Windows 10.1 and Matlab R2018a.  

Files provided here include:  
  
  * `D128RProxy.dll` - a 64-bit file provided by Digitimer
  * `DS8R_API.exe` - compiled C++ code based on a modified example code originally provided by Digitimer
  * `DS8R_class.m` - Matlab class including functions for the control of the device
  * `DS8R_API_Example.m` - example use of the provided functions
  * `DS8R_API_manual.pdf` - simple guidelines for practical use of the codes  
  
  
**Important:** Before use, make sure you have installed the original DS8R software, and saved all the files in one folder.  

The code for the DS8R control using Matlab should be implemented using three basic parts as follows (refer to `DS8R_API_Example.m` for an example use):  
    
```      
obj = DS8R_class; %create an empty object of DS8R_class 
set_DS8R(obj, 'parameter_name', value) %set desired parameters and their values 
exe_DS8R(obj) %apply parameters and trigger  
```
If you have any questions or comments, please contact Sungwoo Lee: sungwoo320@gmail.com