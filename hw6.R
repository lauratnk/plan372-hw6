#load libraries
library(tidyverse)

#load data
data = read.csv("Data/TS3_Raw_tree_data.csv")



###Q1###
#group by City column, summarize by total count of each city
q1 = group_by(data, City) %>%
  summarise(count = n())

###Q2###
#view the unique values for the City colum
unique(data$City)
#filter dataset by SC and NC cities
filterdata = subset(data, City == c("Charleston, SC","Charlotte, NC")) 
                    
###Q3###
#create a new table where the scientific name column is split
filterdata2 = filterdata %>% separate(ScientificName,c('Genus', 'Species') )
#group by the Genus, summarize by average crown diameter
crown_by_tree = group_by(filterdata2, Genus) %>%
  summarise(avg_crown = mean(AvgCdia..m.))
                