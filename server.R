library(shiny)
library(ggplot2)

# Set up the curve to guess
coefs <- c(runif(1,-50,50), runif(1,-25,25), runif(1, -5, 5), runif(1,-2, 2))
noise <- 50 * rnorm(1000);
x <- runif(1000, -5, 5)
y <- coefs[1] + coefs[2]*x + coefs[3]*x^2 + coefs[4]*x^3 + noise

# Define server logic required to draw the plots
shinyServer(function(input, output) {
    
  # Expression that generates a fit
  output$distPlot <- renderPlot({    
    fit <- input$a + input$b*x + input$c*x^2 + input$d*x^3;
    frame <- data.frame(x, y, fit)
        
    # draw the plot
    ggplot(frame, aes(x = x)) + 
      geom_line(aes(y = y, colour = "data")) + 
      geom_line(aes(y = fit, colour = "your guess"))
  })
  
  # Compute and show the RMS error
  output$rms <- renderText({
    fit <- input$a + input$b*x + input$c*x^2 + input$d*x^3;
    err <- sqrt(mean((y - fit)^2))
  })
  
})
