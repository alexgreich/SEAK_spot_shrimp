##this script is for playing around with the shrimp dataset
###specifically with Upper Ernest Sound
####The imported data has be pre-filtered and is only stat area 107-20: upper ernest sound.
### the preliminary explorations for creating a lenght-based model for areas where we have fishery independent data


#Data has been deleted, does not matter

#get the earnest sound data
#names(Data)
#unique(Data$Area.Description)
##looking at the area discriptuons, there are these ones of interest
##Upper Ernest sound; Upper Ernest Sound; Ernest; Ernest Sound; Ernest SOund; Ervest Sound; Eernest Sound; 
##Ernest Sound-Niback/Bold Islands;2 other variations of this spelling;
##Earnest Sound
##107-20 is the area code for upper earnest sound, but check with biologists on this
##also there are no length data on that dataset
##but there are carapace length data here:
Specimens_with_potdata_1 <- read.csv("./Exploration/Data/Specimens_with_Pot_Data_1996_2003.csv")
Specimens_with_potdata_2 <- read.csv("./Exploration/Data/Specimens_with_Pot_Data_2004_2023.csv")
Specimens_without_potdata_1 <- read.csv("./Exploration/Data/Specimens_without_Pot_Data_1996_2006_107_20.csv")
Specimens_without_potdata_2 <- read.csv("./Exploration/Data/Specimens_without_Pot_Data_2007_2023.csv")

library(tidyverse)
Specimens_with_potdata<- bind_rows(Specimens_with_potdata_1, Specimens_with_potdata_2)
Specimens_without_potdata <- bind_rows(Specimens_without_potdata_1, Specimens_without_potdata_2)

#focus on the with pot data for now.
names(Specimens_with_potdata)


#graph the lengths
library(ggplot2)
library(viridis)

ggplot(Specimens_with_potdata) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year) +
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

