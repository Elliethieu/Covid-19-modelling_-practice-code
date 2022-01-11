source('C:/Users/Local Admin/OneDrive/Documents/GitHub/essential-workers-vaccine/analysis/setup_play code.R')

# parameter space
pars3 <- crossing(R_1=c(1.05),R_2=c(1.15),R_3=c(1.32), 
 ve = c(0.33,0.51,0.81,0.87), vp = c(0.92, 0.94), scen=c(1))

pars4 <- crossing(R_1=c(1.00),R_2=c(1.05),R_3=c(1.32), R_4 =c (1.55),
                  daily_vax_1 = c(73000), daily_vax_2 = c(65000),
                  daily_vax_3 = c(50000), daily_vax_4 = c(50000),
                  ve = c(0.33,0.51,0.81,0.87), vp = c(0.92, 0.94), scen=c(1))

# RUN (according to piecewise scenario)
#res <- pars %>%  future_pmap_dfr(run_over_scen_2, .progress=TRUE)
#res3 <-   future_pmap_dfr(run_over_scen_3(R_1 = 1.05, R_2 = 1.3, R_3 = 1.55, 
#                                          ve = 0.75, vp= 0.9, scen = 1),
#                                          .progress=TRUE)
res3 <- pars3 %>% future_pmap_dfr(run_over_scen_3,
                 .progress = TRUE)

res4 <- pars4 %>% future_pmap_dfr(run_over_scen_4,
                                .progress = TRUE)


############################
# FIGURE 1 (trajectories)
#############################
# Look at trajectories

traj_3 <- sims(sim1 = filter(res3, scen ==1 & ve==0.33 & vp==0.92), 
              name1=labels[1], 
              startDate=startDate, 
              textsize = 16)

traj_4 <- sims(sim1 = filter(res4, scen ==1 & ve==0.33 & vp==0.92), 
               name1=labels[1], 
               startDate=startDate, 
               textsize = 16)


# Arrange
fig1 = ggarrange(plotlist=traj_4, nrow=1, ncol=3, widths = c(1))
                

ggarrange(fig1, nrow=1,heights = c(1, 1))


