library(ggplot2)
library(plotly)
library(bslib)
library(markdown)


dataset <- read.csv("top_songs_and_country.csv")

country_col_name <- colnames(dataset)

our_theme <- bs_theme(bg = "#FFFFFF", #background
                     fg = "#191414", #foreground color
                     primary = "#1ED760" # primary color
)

## OVERVIEW TAB INFO

overview_tab <- tabPanel("Introduction",
   h1("Analysis of Spotify Music Trends and Geographical Location"),
   h5("By Alex Han, Nimrod Tsegay, Torian Thirdgill-Lewis"),
   includeMarkdown("intro_text.md"),
   img(src="unnamed.png")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Countries"),
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

viz_1_tab <- tabPanel("Country vs. Song Energy Level",
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
  h2("Countries"),
  selectInput(
    inputId = "viz_3_country",
    label = "Country to Analyze",
    choices = dataset$country,
    selected = "US",
    multiple = TRUE
  ),
  radioButtons(
    inputId = "viz_3_explicit",
    label = "Explicit or Not Explicit",
    choices = c("Explicit", "Not Explicit"),
    selected = "Explicit"
  )
  
)

viz_3_main_panel <- mainPanel(
  h2("Country and Number of Explicit Songs"),
  plotlyOutput(outputId = "country_explicit_plot")
)

viz_3_tab <- tabPanel("Country and Explicit Songs",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion",
 h1("Final Observations"),
 includeMarkdown("conclusion_text.md")
)



ui <- navbarPage("Geographical Spotify Analysis",
  theme = our_theme,
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)
