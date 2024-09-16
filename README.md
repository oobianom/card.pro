# card.pro: Lightweight and highly customizable card component for shiny

<p align="center">

![](https://cardpro.rpkg.net/assets/image5.jpg)

![](https://cardpro.rpkg.net/assets/image4.jpg)

</p>

This high customization _card.pro()_ component provides a flexible and extensible content container with multiple variants and options. It allows shiny app developers to display content in an organized and uniform manner in the form of cards. 

While is merely a flexible div with a lot of options for customization, You can add images, text, lists and other content inside. It allows options to help style the title and text respectively. 

For layout, you can stack multiple cards within a _moveable()_ container and make them moveable by the user.

There are options for you to include toolbars that extensively improve the card functionality.


__A great feature of this package is that you are able to rearrange the cards on the page, change titles, change header color, expand cards. When you refresh the page, the changes are preserved across refresh and various sessions.__


## Example shiny app code

```
install.package("card.pro")
library(shiny)
library(card.pro)


ui <- fluidPage(
  
  titlePanel("Advanced Card: Expand, Edit, Rearrange and Refresh"),
  
  use.cardpro(theme = "b"), # import scripts
  
  # add card
  moveable(
    card.pro("History something",title = "A random content"),
    card.pro("Card B","cONTENT 2", title = width = 4),
    card.pro("Card C","cONTENT 3", width = 8, header.bg = "red"),
    
    card.pro(
      "Lorem ipsum odor amet.",
      title = "Box 1",
      width = 12,
      icon = icon("fire"),
      tabs = list(
        tabEntry("Tab 1",
                 textInput("nor1", "Enter name"), "Content for 1"),
        tabEntry("Tab 2",
                 actionButton("nor1", "Try click"), "sample")
      )
    )
  )
  
)

shinyApp(ui = ui, server = empty.server)

```


![](https://cardpro.rpkg.net/assets/image2.jpg)

