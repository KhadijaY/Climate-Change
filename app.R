#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(hrbrthemes)
library(ggplot2)
Co2_dataset<-read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Climate Change-Co2 emission trends in Russia"),

    # Sidebar with a slider input for number of bins 
    mainPanel(),
    sidebarLayout(
        sidebarPanel(
            sliderInput("Co2 emission",
                        "Number of co2 emissions in Russia:",
                        min = 1,
                        max = 8000,
                        value = 30)
        ), 
        mainPanel(plotOutput("newScatter")))
    )
scatter_plot<-ggplot(Co2_dataset,aes(x=year,y=co2))+
        geom_point()+
        geom_smooth(method = lm,color="red",fill="#69b3a2",se=TRUE)+
        theme_ipsum()

    




# Run the application
shinyApp(ui,server)
