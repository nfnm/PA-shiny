# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Titanic Survivability"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("Gender", "Gender of survivor",
                  c("All", "Female", "Male"))
    ),

    # Show a plot of the survivors
    mainPanel(
      plotOutput("chart")
    )
  )
))
