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
                  # Usar la variable en memoria de forma segura
                  # Por ejemplo, para conectarse a una DB o API
                  print(paste0(":", api_key)),
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

  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x,
      breaks = bins, col = "darkgray", border = "white",
      xlab = "Espera próxima erupción en min.",
      main = paste0("Histograma de tiempo de espera", api_key)
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
