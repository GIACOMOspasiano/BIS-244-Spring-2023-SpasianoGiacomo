library (dplyr)
print(getwd())
setwd("~/Git Repos/BIS 244/BIS-244-Spring-2023-spasianogiacomo/Covid-19_Project/covid-19-data")
us_states <- read.csv("us-states.csv")
print(us_states)

temp <- us_states %>%
    filter(state == "pennsylvania")

size <- length(temp$date)
temp$incr_deaths <- 1
temp$incr_cases <- 1

for(k in 2:size)
  temp$incr_deaths[k] <- (temp$cases[k]-temp$cases[k-1])
  temp$incr_cases[k] <- (temp$deaths[k]-temp$deaths[k-1])
  
print(temp)
sd_incr_cases <- sd(temp$incr_cases)
cat("The standard deviation of incremental cases in Pennsylvania is:", sd_incr_cases, "\n")
  
  
