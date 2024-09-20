library(shiny)
library(card.pro)


ui <- fluidPage(
  use.cardpro(theme = "a"),
  titlePanel2("shinyappstore.com Data"),
  moveable(
    card.pro(
      "Lorem ipsum odor amet.",
      title = "Box 1",
      icon = icon("fire"),
      tabs = list(
        tabEntry("Tab 1",
                 textInput("nor1", "Enter name"), "Content for 1"),
        tabEntry("Tab 2",
                 actionButton("nor1", "Try click"), "sample")
      )
    ),
    card.pro(
      "Another something",
      title = "Box 2",
      width = 6,
      header.bg = "blue",
      alert.text = "Its an alert!",
      colorbtn = FALSE,
      editbtn = FALSE
    ),
    card.pro(
      "A plot for test",
      textInput("test6", "Plot title"),
      actionButton("test9", "Make plot"),
      title = "Box 3",
      width = 6,
      header.bg = "red",
      collapsed = TRUE,
      sortable = FALSE
    ),
    card.pro(
      "Box 4 content",
      "shinyappstore.com",
      title = "Box 1",
      width = 8,
      header.bg = "red",
      sidebar = div(
        "My settings",
        textInput("test2", "Input change"),
        actionButton("test3", "Click to save")
      )
    )
  )
)

# Run the application
shinyApp(ui = ui, server = empty.server)
