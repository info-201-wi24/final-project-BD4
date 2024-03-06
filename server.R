library(ggplot2)
library(plotly)
library(dplyr)


dataset <- read.csv("top_songs_and_country.csv")

server <- function(input, output){
  
  # TODO Make outputs based on the UI inputs here
  output$country_energy_plot <- renderPlotly({
    
    filtered_dataset <- dataset %>% filter(country %in% input$viz_1_x_axis)
    
                                
    my_plot <- ggplot(filtered_dataset) +
      geom_boxplot(mapping = aes(
        x = country,
        y = energy
      )) +
        labs(title = "Distribution of Energy Level per Song by Country")
    return(ggplotly(my_plot))
  })
  
}