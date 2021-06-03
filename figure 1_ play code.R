source('C:/Users/Local Admin/OneDrive/Documents/GitHub/essential-workers-vaccine/analysis/setup_play code.R')

# parameter space
pars <- crossing(R=c(1.3, 1.5), ve = c(0.75,0.9), vp = 0.9, scen=c(1,2,3,4,5))
pars2 <- crossing(R_1=c(1.05),R_2=c(1.3),R_3=c(1.55), 
 ve = c(0.4,0.5), vp = c(0.4, 0.88), scen=c(1,2,3,4,5))

# RUN (according to piecewise scenario)
#res <- pars %>%  future_pmap_dfr(run_over_scen_2, .progress=TRUE)
#res3 <-   future_pmap_dfr(run_over_scen_3(R_1 = 1.05, R_2 = 1.3, R_3 = 1.55, 
#                                          ve = 0.75, vp= 0.9, scen = 1),
#                                          .progress=TRUE)
res <- pars2 %>% future_pmap_dfr(run_over_scen_3,
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
traj_3 <- sims(sim1 = filter(res, scen ==1 & ve==0.5 & vp==0.88), 
              #sim2=filter(res, R==1.3 & scen ==2 & ve==0.75),
              name1=labels[1], #name2=labels[2],
              startDate=startDate, 
              textsize = 16)


#trajB <- compare_sims(sim1 = filter(res, R==1.3 & scen==3 & ve==0.75), 
#                      sim2=filter(res, R==1.3 & scen==4 & ve==0.75),
#                      name1=labels[3], name2=labels[4], startDate=startDate, 
#                      textsize = 16)

# Look at number vaccinated
#gg_vax <- res %>% 
#  filter(R==1.15) %>% # note: all R values will give approx. the same plot
#  group_by(type)%>% 
#  nest()%>%
#  summarize(plot=map(data, display_prop_vax, startDate, type, textsize=16))


#fig1a = ggarrange(gg_vax$plot[[1]]+ggtitle("A: oldest first"),
#                  gg_vax$plot[[2]]+ggtitle("B: 80+, 20-79"),
#                  gg_vax$plot[[3]]+ggtitle("C: 80+, EW, 70-79,..."),
#                  gg_vax$plot[[4]]+ggtitle("D: 80+, EW, 20-79"),
#                  ncol=4, nrow=1, common.legend=TRUE, legend="bottom")


# Arrange
fig1b = #ggarrange(
  ggarrange(plotlist=traj_3, nrow=1, ncol=3, widths = c(1))#,
                  #ggarrange(plotlist=trajB, nrow=1, ncol=4, widths = c(1,1,1,1)),
               #   nrow=1)

ggarrange(fig1b, nrow=1,heights = c(1, 1))
#ggsave(paste0("../essential-workers-vaccine/figures/fig-trajectories_most optimistic.pdf"), width = 15, height = 10)      


