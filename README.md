# card.pro: Lightweight and highly customizable card component for shiny

![](https://cardpro.rpkg.net/assets/image4.png)

This highly customizable _card.pro()_ component provides a flexible and extensible content container with multiple variants and options. It allows shiny app developers to display content in an organized and uniform manner in the form of cards. 

While is merely a flexible div with a lot of options for customization, You can add images, text, lists and other content inside. It allows options to help style the title and text respectively. 

For layout, you can stack multiple cards within a _moveable()_ container and make them moveable by the user.

There are options for you to include toolbars that extensively improve the card functionality.



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
    card.pro("History something","A random content"),
    card.pro("Card B","cONTENT 2", width = 4),
    card.pro("Card C","cONTENT 3", width = 8, header.bg = "red")
  )
  
)

shinyApp(ui = ui, server = empty.server)

```


![](https://cardpro.rpkg.net/assets/image2.png)

