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

output$sng_vs_alb_out <- renderPlotly({

    filtered_data <- dataset
    if (input$sng_vs_alb_select != "Both") {
      filtered_data <- dataset[dataset$is_single == (input$sng_vs_alb_select == "Single"), ]
    }
    
    p <- ggplot(filtered_data, aes(x = Followers, y = popularity)) +
      geom_point(aes(color = as.factor(is_single)), alpha = 0.5) +  
      scale_color_manual(values = c("TRUE" = "darkgreen", "FALSE" = "darkgrey"), labels = c("Single", "Album")) +
      labs(title = "Song Popularity vs. Artist Followers", x = "Number of Followers", y = "Popularity") +
      theme_minimal() +
      scale_x_log10() +  
      theme(axis.text.x = element_text(angle = 45, hjust = 1))  
    
    ggplotly(p)
  })
  
}
