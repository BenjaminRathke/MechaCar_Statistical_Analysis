#Deliverable 1
library("dplyr")
MechaCar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) #read in the csv file
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df)) #generate summary statistics

#Deliverable 2
SuspCoi_tbl <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- SuspCoi_tbl %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table
lot_summary <- SuspCoi_tbl %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table by lot

#Deliverable 3
t.test((lot_summary$Mean), mu=mean(total_summary$Mean)) #compare means
t.test((subset(SuspCoi_tbl, Manufacturing_Lot == "Lot1")$PSI), mu=mean(total_summary$Mean)) #Compare Lot1 Mean to Population Mean
t.test((subset(SuspCoi_tbl, Manufacturing_Lot == "Lot2")$PSI), mu=mean(total_summary$Mean)) #Compare Lot2 Mean to Population Mean
t.test((subset(SuspCoi_tbl, Manufacturing_Lot == "Lot3")$PSI), mu=mean(total_summary$Mean)) #Compare Lot3 Mean to Population Mean
