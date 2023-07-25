##this script is for playing around with the shrimp dataset
###specifically with Upper Ernest Sound
####The imported data has be pre-filtered and is only stat area 107-20: upper ernest sound.
### the preliminary explorations for creating a lenght-based model for areas where we have fishery independent data

##107-20 is the area code for upper ernest sound

#read in data
Specimens_with_potdata_1 <- read.csv("./Exploration/Data/Specimens_with_Pot_Data_1996_2003.csv")
Specimens_with_potdata_2 <- read.csv("./Exploration/Data/Specimens_with_Pot_Data_2004_2023.csv")

library(tidyverse)
Specimens_with_potdata<- bind_rows(Specimens_with_potdata_1, Specimens_with_potdata_2)


#clean data
library(lubridate)
#Specimens_with_potdata_int <- Specimens_with_potdata %>%
 # mutate()
  
Specimens_with_potdata_int <- Specimens_with_potdata %>%
  mutate(Soak.Time = ymd_hms(Time.Lift.Begin) - ymd_hms(Time.Set.Begin))

Specimens_with_potdata_c <- Specimens_with_potdata_int %>% 
  filter(Sample.Type=="Size") %>%
  filter(Species=="Spot shrimp") %>%
  filter(Pot.Condition=="Normal") %>%
  filter(Soak.Time >= 16 & Soak.Time <= 24) %>%
  filter(Number.of.Specimens != 0)

#Done with filtering the things out of the dataset
#Now I will need to expand the dataset rows to represent one measurement per observation(shrimp)
#?pivot_longer
#?gather
#?separate_rows
#?separate_longer_delim
#?separate_longer_position


#as of 07/25/23 the code below is out of date.
#####################################33

#graph the lengths
library(ggplot2)
library(viridis)

ggplot(Specimens_with_potdata_c) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year) +
  theme_bw()#+scale_fill_viridis_d()

ggplot(Specimens_with_potdata) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year, ncol=2) +
  theme_bw()

ggplot(Specimens_with_potdata_1) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year, ncol=1) +
  theme_bw() #allows us to see an age class, sort of

Specimens_with_potdata_2.1 <- Specimens_with_potdata_2 %>%
  filter(Year >= 2014)

Specimens_with_potdata_2.2 <- Specimens_with_potdata_2 %>%
  filter(Year < 2014)

ggplot(Specimens_with_potdata_2.1) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year, ncol=1) +
  theme_bw()#allows us to see an age class, sort of

ggplot(Specimens_with_potdata_2.2) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year, ncol=1) +
  theme_bw()#allows us to see an age class, sort of

