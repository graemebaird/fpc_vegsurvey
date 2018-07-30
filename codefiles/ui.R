library(shiny)
library(leaflet)
library(RColorBrewer)


fluidPage(
  # Some custom CSS for a smaller font for preformatted text
  tags$head(
    tags$style(HTML("
                    pre, table.table {
                    font-size: smaller;
                    }
                    "))
    ),
  
  fluidRow(
    column(width = 2),
    column(width = 6,
           br(),
           # In a imageOutput, passing values for click, dblclick, hover, or brush
           # will enable those interactions.
           imageOutput("image1", height = 500,
                       # Equivalent to: click = clickOpts(id = "image_click")
                       click = "image_click",
                       dblclick = dblclickOpts(
                         id = "image_dblclick"
                       ),
                       hover = hoverOpts(
                         id = "image_hover"
                       ),
                       brush = brushOpts(
                         id = "image_brush"
                       )
           ),
           br()
    )
  ),
  fluidRow(
    column(width = 3,
           verbatimTextOutput("click_info")
    ),
    column(width = 3,
           verbatimTextOutput("dblclick_info")
    ),
    column(width = 3,
           verbatimTextOutput("hover_info")
    ),
    column(width = 3,
           verbatimTextOutput("brush_info")
    )
  )
    )