

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Climate Change-Co2 emission trends "),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("emissions",
                        "Number of Co2 emissions:",
                        min = 1,
                        max = 8000,
                        value = 8000)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("scatterPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  Co2_dataset<-read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv") 
  
    output$scatterPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
      ggplot(Co2_dataset,aes(x=year,y=co2))+
        geom_point()

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
