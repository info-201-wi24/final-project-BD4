library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(bslib)
library(markdown)

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)