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
  ),

  textInput("test2", "Input change"),
  actionButton("test3", "Click to save"),
  textInput("test2", "Input change"),
  actionButton("test3", "Click to save"),
  HTML("Lorem ipsum odor amet, consectetuer adipiscing elit. In donec vel morbi sem litora mus. Ad interdum semper congue ultricies maecenas sodales enim ut. Leo facilisis varius egestas bibendum; quis litora purus. Varius penatibus nulla volutpat tortor tristique vivamus nostra nisi suspendisse. Eros per taciti magna consequat phasellus; eget varius. Maximus sociosqu nisl sem risus finibus vivamus? Mi id lectus; rutrum amet montes interdum.

Nibh etiam urna est; potenti a montes imperdiet volutpat vivamus. Augue litora venenatis eleifend maecenas, platea purus. Neque iaculis efficitur est erat nascetur urna consectetur laoreet. Consectetur leo vehicula velit, parturient metus commodo. Hendrerit suspendisse hac magnis fusce facilisi fusce duis. Ullamcorper euismod ullamcorper maecenas; himenaeos arcu arcu lectus. Dui donec eros etiam lacus bibendum nulla.
<p>
Magnis duis congue commodo sodales dictum amet quam. Elementum rhoncus feugiat netus nisl himenaeos hac. Sodales vivamus ullamcorper mauris at torquent aliquam. Nisl egestas dapibus venenatis; imperdiet imperdiet lacinia malesuada accumsan. Scelerisque habitasse efficitur cubilia purus primis euismod non sed. Luctus nisi neque fringilla rhoncus eros. Viverra volutpat senectus curae accumsan finibus. Imperdiet fringilla ridiculus nunc porta amet ut parturient conubia.
</p>
Rutrum tincidunt gravida facilisi; ornare cras nascetur parturient. Auctor accumsan libero nullam facilisi conubia lacinia. Interdum senectus platea dui parturient in. Vivamus elit nunc sociosqu ornare curae enim. Facilisis senectus commodo imperdiet quis platea dolor senectus. Et non felis venenatis nulla neque luctus. Velit ante auctor nostra venenatis, vehicula ipsum volutpat risus. Massa sem mollis metus montes adipiscing eros odio viverra suspendisse. Velit dignissim cubilia neque vehicula lacus nibh sagittis aptent.

Libero fringilla himenaeos quis etiam convallis penatibus pharetra vitae. Mattis habitasse felis feugiat amet eget adipiscing massa pharetra. Ac malesuada consectetur quisque cras penatibus per magnis. Elementum nullam imperdiet nam sagittis rhoncus quisque. Efficitur pulvinar lectus egestas pellentesque eleifend nam inceptos luctus. Consequat nec ad est; vitae felis euismod magnis. Cras posuere nibh sit enim lorem pretium class eros morbi. Maecenas per donec tortor lorem nec vel. Taciti efficitur tempor ligula; nascetur quis aptent."),

  footerPanel("Hellow", rightContent = "Find me", bg.col = "brown")
)

# Run the application
shinyApp(ui = ui, server = empty.server)
