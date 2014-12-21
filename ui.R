library(shiny)

# Define the UI for the application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Guess the polynomial fit!"),
  p("Try to find the polynomial that best fits the shown scattered data. The polynomial is given by y = a + bx + cx^2 + dx^3."),
  p("To help you the RMS error between the fit and the data is also shown, so try to minimize this value!"),
  p("To get started and get a feeling of the influence of the coefficients, play around with the sliders below."),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("a",
                  "a",
                  min = -50,
                  max = 50,
                  step = 0.1,
                  value = 0),
      sliderInput("b",
                  "b",
                  min = -25,
                  max = 25,
                  step = 0.1,
                  value = 0),
      sliderInput("c",
                  "c",
                  min = -5,
                  max = 5,
                  step = 0.1,
                  value = 0),
      sliderInput("d",
                  "d",
                  min = -2,
                  max = 2,
                  step = 0.1,
                  value = 0)
    ),
    
    # Show a plot of the scatter data and the fit
    mainPanel(
      plotOutput("distPlot"),
      verbatimTextOutput("rms")
    )
  )
))