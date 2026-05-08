library(shiny)

api_key <- Sys.getenv("PASSWORD")

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Primer App en Connect Cloud 1"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
        "Número de bins:",
        min = 1,
        max = 50,
        value = 30
      )
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # Usar la variable en memoria de forma segura
  # Por ejemplo, para conectarse a una DB o API
  print(api_key)

  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x,
      breaks = bins, col = "darkgray", border = "white",
      xlab = "Espera próxima erupción en min.",
      main = "Histograma de tiempo de espera"
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
