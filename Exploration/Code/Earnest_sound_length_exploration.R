##this script is for playing around with the shrimp dataset
###specifically with Upper Earnest Sound
### the preliminary explorations for creating a lenght-based model for areas where we have fishery independent data


#Data has been deleted, does not matter

#get the earnest sound data
names(Data)
unique(Data$Area.Description)
##looking at the area discriptuons, there are these ones of interest
##Upper Ernest sound; Upper Ernest Sound; Ernest; Ernest Sound; Ernest SOund; Ervest Sound; Eernest Sound; 
##Ernest Sound-Niback/Bold Islands;2 other variations of this spelling;
##Earnest Sound
##107-20 is the area code for upper earnest sound, but check with biologists on this
##also there are no length data on that dataset
##but there are carapace length data here:
Specimens_with_potdata_1 <- read.csv("./Exploration/Data/Specimens_with_Pot_Data_1996_2003.csv")
Specimens_with_potdata_2 <- read.csv("./Exploration/Data/Specimens_with_Pot_Data_2004_2023.csv")
Specimens_with_potdata <- 
Specimens_without_potdata <- read.csv("./Exploration/Data/Specimens_without_Pot_Data_2004_2023.csv")

#focus on the with pot data for now.
library(tidyverse)
names(Specimens_with_potdata)
unique(Specimens_with_potdata$Stat.Area)
Upper_ernest_sound_spec_w_potdata <- Specimens_with_potdata %>% filter(Stat.Area=="107-20")


#graph the lengths
library(ggplot2)
library(viridis)

ggplot(Upper_ernest_sound_spec_w_potdata) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year) +
  theme_bw() + scale_fill_viridis_d()

#hmm we only have three years?
unique(Upper_ernest_sound_spec_w_potdata$Year) #yep...


###how many years do we hace of the not pot data?
Upper_ernest_sound_spec_wout_potdata <- Specimens_without_potdata %>% filter(Stat.Area=="107-20")
unique(Upper_ernest_sound_spec_wout_potdata$Year)
##we only have three years of data...
#graphing
ggplot(Upper_ernest_sound_spec_wout_potdata) + aes(x=Carapace.Length.Millimeters, fill=Year, alpha=0.5) + geom_density() + facet_wrap(~Year) +
  theme_bw() + scale_fill_viridis_d() #this looks the same. Maybe the same dataset with less info


#how many years are in this dataset?
unique(Specimens_with_potdata$Year)
##hmm. something in the data is messed up?
View(Upper_ernest_sound_spec_w_potdata)


#somethign is wrong with the data. Hidden little angry message at the end of the csv. Something glitched up in the download