library(shiny)
library(card.pro)


ui <- fluidPage(
  use.cardpro(theme = "a", fix.header = TRUE),
  moveable(
    tags$h2("   card.pro package: shiny 2.0 Built to your specifications..."),
    tags$h4(class ="c-purple","drag, resize, rearrage and refresh. your settings preserved!"),
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
      header.bg = "purple",
      colorbtn = FALSE,
      editbtn = FALSE
    ),
    card.pro(
      HTML('<p class="alert alert-info no-margin"> All progress bars contain a base class of <code> .progress </code> . Control the size of the progress bar with <code> .progress-xs </code> , <code> .progress-sm </code> , <code> .progress-lg </code> or leave as is for the default size. </p>'),
      plotOutput("distPlot"),
      plotOutput("distPlot2"),
      xtra.header.content = div(class="c-red","Downloading graph..."),
      sidebar = div(
        "Plot settings",
        textInput("testy", "Y-axis title", "Concentration"),
        textInput("testx", "X-axis title", "Time"),
        textInput("dpi", "Image dpi", "300"),
        textInput("strp", "Subset", "NA"),
        actionButton("test3", "Re-graph")
      ),
      title = "Plot output",
      width = 6,
      header.bg = "yellow",
    ),
    card.pro(
      tableOutput("table1"),
      title = "Summary table",
      width = 3,
      header.bg = "red",
      footer = "Here is a sample footer for descriptions"
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
  output$distPlot2 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    plot(bins,quickcode::number(length(bins)))
  })
}
# Run the application
shinyApp(ui = ui, server = server)
