
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(tidyverse)
library(plotly)
ui<-fluidPage(
   h1("CO2 Trends Compared to Years:Histogram"), 
  h5("This interactive Graph is a histogram and we are using this to see the a visual representation of the frequency distrubution of Co2 levels in comparison with years.We nee noticed that it was skewed to the left, meaning that more of the values are concentrated towards the left, thus indicatin that there has been an increase co2 levels in the later years.This graph is reflective because this generation uses cars for transportation, more plastics, and more fossil fuels, thus causing co2 levels to increase significantly."),
  titlePanel("Co2 Trends compared to Years"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="year",label="Select year",choices=c("1800","1900","2000","2010"),selected="2000"),
    
  
      
    ),
   ),
      sliderInput(inputId = "bins",
                  label = "number of bins:",
                  min=1,
                  max=50,
                  value=50),
  mainPanel(
    plotOutput(outputId = "distPlot")
  )
    )
    
    
  
  
server<-function(input,output){
  Co2_dataset<-read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv") 
  output$value <- renderPrint({ input$select })
  
}
  output$distPlot<-renderPlot({
    x <- Co2_dataset$year
    y<-Co2_dataset$co2
    bins<-seq(min(x),max(x),length.out=input$bins + 1)
    hist(x,breaks=bins,col="#75AADB",border="white",
         xlab="year",
         ylab="co2",
         main="histogram of Co2 levels")
  })


shinyApp(ui=ui, server=server)
