# Covid-19-modelling_-practice-code
figuring out the code source of the paper "vaccinating essential workers early"  
the filename_play code are files that we run, based on the original files.  

# Notation:   
IHR = vector contains hospitalization rate per age group (old variant)  
IFR = vector contains death rate per age group (old variant)  
H   = vector contains vaccine hesitation rate per age group (taken from a survey)  
vp = vaccine efficacy against serious illness (~92-94% for Pfizer/ Moderna, for either one or two doses)
ve = vaccine efficacy against symptomatic infection 
R  = transmission rate

for one dose, ve = 33 per cent protection against symptomatic infection from B.1.617.2 variant from India, and 51 per cent against B.1.1.7. variant from the U.K  
for two doses, ve = 81 per cent protection against symptomatic infection the B.1.617.2 variant found in India, and 87 per cent against the B.1.1.7 variant from the U.K  
(according to the Public Health England data that was presented to a meeting of the government’s New and Emerging Respiratory Virus Threats Advisory Group (Nervtag). 

R in India = 1.55
R in the UK = 1.32

Hence, we temporarily set the transmission rates of the three phases as R1 = 1.05, R2 = 1.32, R3 = 1.55.  

# main code: 
run_over_scen_3 is our main function.   

Change the number of daily vaccination for each stage:  
In setup_ play code, in the function run_over_scen_3, for each stage, n is the number of daily vaccination. You can change them manually here, then run the file setup_play code again, then run figure1_play code to generate the graph.  
in figure1_play code, you can set ve and vp as you wish (in both pars2 and traj_3 needed. pars was the original code, I used to see how to set up pars2)  

T1, T2, T3 are respectively Phase 1, phase 2, phase 3 of the opening plan.    



Note: please change the file paths accordingly when you run the code. These files were pulled from my computer and hence have the absolute paths as in my computer.
