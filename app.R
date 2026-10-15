library(shiny)

ui <- fluidPage(
  titlePanel("Git & Shiny Demo App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "bins",
        label = "Number of Bins:",
        min = 5,
        max = 50,
        value = 25
      ),
      textInput(
        inputId = "plot_title",
        label = "Plot Title:",
        value = "Old Faithful Eruptions"
      )
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(
      x,
      breaks = bins,
      col = "steelblue",
      border = "white",
      xlab = "Waiting time to next eruption (mins)",
      main = input$plot_title
    )
  })
}

shinyApp(ui = ui, server = server)
