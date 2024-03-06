library(ggplot2)
library(plotly)
library(bslib)


dataset <- read.csv("top_songs_and_country.csv")

country_col_name <- colnames(dataset)

our_theme <- bs_theme(bg = "#FFFFFF", #background
                     fg = "#1ED760", #foreground color
                     primary = "#000000", # primary color
)

## OVERVIEW TAB INFO

overview_tab <- tabPanel("Music Trends and Genre",
   h1("Some title"),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
  selectInput(
    inputId = "viz_1_x_axis",
    label = "Country to Analyze",
    choices = dataset$country,
    selected = "US",
    multiple = TRUE
  )
)

viz_1_main_panel <- mainPanel(
  h2("Country and Dist. of Energy Levels"),
  plotlyOutput(outputId = "country_energy_plot")
)

viz_1_tab <- tabPanel("Viz 1 tab title",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO
viz_2_sidebar <- sidebarPanel(
  h2("Song Popularity by Release Type"),
  radioButtons(inputId = "sng_vs_alb_select",
               label = "Song Type",
               choices = list("Both" , "Single" , "Album" ),
               selected = "Single")
)

viz_2_main_panel <- mainPanel(
  h2("Do single releases become more popular than songs in album releases?"),
  plotlyOutput(outputId = "sng_vs_alb_out")
)

viz_2_tab <- tabPanel("Singles vs. Album Songs",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("Viz 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion Tab Title",
 h1("Some title"),
 p("some conclusions")
)



ui <- navbarPage("Example Project Title",
  theme = our_theme,
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)
