# Covid-19-modelling_-practice-code
figuring out the code source of the paper "vaccinating essential workers early"

# Notation:   
IHR = vector contains hospitalization rate per age group (old variant)  
IFR = vector contains death rate per age group (old variant)  
H   = vector contains vaccine hesitation rate per age group  

# main code: 
run_over_scen_3 is our main function.   

Change the number of daily vaccination for each stage:  
In setup_ play code, in the function run_over_scen_3, for each stage, n is the number of daily vaccination. You can chnage them manually here, then run the file setup_play code again, then run figure1_play code to generate the graph.  
in figure1_play code, you can set ve and vp as you wish (in both pars2 and traj_3 needed. pars was the original code, I used to see how to set up pars2)  

T1, T2, T3 are respectively Phase 1, phase 2, phase 3 of the opening plan.    



Note: please change the file paths accordingly when you run the code. These files were pulled from my computer and hence have the absolute paths as in my computer.
