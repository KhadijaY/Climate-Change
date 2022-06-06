library(dplyr)
library(shiny)
library(fmsb)
library(tidyverse)

#load the dataset
Co2_dataset<-read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
#Introduction Page 
#What is the average value of my variable across all the countries, in 2019?
Avg_Co2_counties<-Co2_dataset %>% 
  group_by(country) %>% 
  filter(year==2019) %>% 
  summarise(Co2_data_sum=sum(co2))
#What is the avg value of Co2 per capita across all the countries, in 2019?
Avg_Co2_per_capita<-Co2_dataset %>% 
  group_by(country) %>% 
  filter(year==2019) %>% 
  summarise(Co2_data_sum=sum(co2_per_capita))
#What is the average value of co2 emissions in Russia?
Avg_Co2_Russia<-Co2_dataset %>% 
  drop_na() %>% 
  filter(country=="Russia") %>% 
  summarise(co2_data_sum=sum(co2))
#What year had the highest Co2? 
year_highest_Co2<-Co2_dataset %>% 
  drop_na() %>% 
  filter(co2==max(co2)) %>% 
  pull(year)
#What country had the highest Co2? 
country_with_highest_co2_emissions<-Co2_dataset %>% 
  drop_na() %>% 
  filter(co2==max(co2)) %>% 
  pull(country)



