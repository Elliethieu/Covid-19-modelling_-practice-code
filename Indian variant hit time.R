source('C:/Users/Local Admin/OneDrive/Documents/GitHub/essential-workers-vaccine/analysis/setup_play code.R')

# parameter space
pars_variant <- crossing(R_1=c(1.32), R_2=c(1.32), R_3= c(1.32), 
                  ve = c(0.33,0.51,0.81,0.87), vp = c(0.92, 0.94), scen=c(1))

# RUN (according to piecewise scenario)
#res3 <-   future_pmap_dfr(run_over_scen_3(R_1 = 1.05, R_2 = 1.3, R_3 = 1.55, 
#                                          ve = 0.75, vp= 0.9, scen = 1),
#                                          .progress=TRUE)
res <- pars_variant %>% future_pmap_dfr(run_over_scen_variant,
                                 .progress = TRUE)


############################
# FIGURE 1 (trajectories)
#############################
# Look at trajectories
#trajA <- sims(sim1 = filter(res, R==1.3 & scen==1 & ve==0.75), 
#sim2=filter(res, R==1.3 & scen ==2 & ve==0.75),
#                     name1=labels[1], #name2=labels[2],
#                   startDate=startDate, 
#                     textsize = 16)
traj_3_variant <- sims(sim1 = filter(res, scen ==1 & ve==0.33 & vp==0.92), 
               name1=labels[1], 
               startDate=startDate, 
               textsize = 16)



# Arrange
fig1c =  ggarrange(plotlist=traj_3_variant, nrow=1, ncol=3, widths = c(1))
#ggarrange(plotlist=trajB, nrow=1, ncol=4, widths = c(1,1,1,1)),
#   nrow=1)

ggarrange(fig1c, nrow=1,heights = c(1, 1))

300 *100000/ pop_total 
246* 100000/ pop_total

