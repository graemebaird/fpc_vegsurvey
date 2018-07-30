library(png)
library(grid)

shinyServer(function(input, output, session) {
  
  # Generate an image with black lines every 10 pixels
  output$image1 <- renderImage({
    list(src = "img/Balch_1.png",
         height=500,
         alt = "This is alternate text")
  },deleteFile = FALSE)
  
  output$click_info <- renderPrint({
    cat("input$image_click:\n")
    str(input$image_click)
  })
  output$hover_info <- renderPrint({
    cat("input$image_hover:\n")
    str(input$image_hover)
  })
  output$dblclick_info <- renderPrint({
    cat("input$image_dblclick:\n")
    str(input$image_dblclick)
  })
  output$brush_info <- renderPrint({
    cat("input$image_brush:\n")
    str(input$image_brush)
  })
  
}

)