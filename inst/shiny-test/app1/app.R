library(shiny)
library(card.pro)


ui <- fluidPage(
  use.cardpro(theme = "a", fix.header = TRUE),
  moveable(
    tags$h2("   card.pro package: shiny 2.0 Built to your specifications..."),
    tags$hr(),
    card.pro(
      "This is the setup",
      tabs = list(
        tabEntry(
          "Main",
          sliderInput("bins",
            "Number of bins:",
            min = 1,
            max = 50,
            value = 30
          )
        ),
        tabEntry(
          "Values",
          textInput("nor1", "Enter name"), "Content for 1",
          textInput("nor1", "Enter name"), "Content for 1",
          actionButton("nor1", "Try click"), "sample"
        )
      ),
      title = "Analysis Setup",
      width = 3,
      header.bg = "darken",
      colorbtn = FALSE,
      editbtn = FALSE
    ),
    card.pro(
      plotOutput("distPlot"),
      sidebar = div(
        "Plot settings",
        textInput("testy", "Y-axis title", "Concentration"),
        textInput("testx", "X-axis title", "Time"),
        textInput("dpi", "Image dpi", "300"),
        textInput("strp", "Subset", "NA"),
        actionButton("test3", "Re-graph")
      ),
      title = "Plot output",
      width = 5,
      header.bg = "blue",
    ),
    card.pro(
      tableOutput("table1"),
      title = "Summary table",
      width = 4,
      header.bg = "red"
    )
  )
)

server <- function(input, output) {
  output$table1 <- renderTable({
    head(mtcars)
  })

  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x,
      breaks = bins, col = "darkgray", border = "white",
      xlab = input$testx,
      main = input$testy
    )
  })
}
# Run the application
shinyApp(ui = ui, server = server)
