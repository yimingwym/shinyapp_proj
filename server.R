library(shiny)

shinyServer(function(input, output){

    output$taxiplot1 <- renderImage({
      filename <- normalizePath(file.path(
                                paste0(paste(input$day_type1, input$d_n1, input$pk_dp, sep = '_'), '.png')))
      list(src = filename,
           alt = 'Nothing',
           width = 600,
           height = 600
           )
      }, deleteFile = FALSE)
    
    output$taxiplot2 <- renderImage({
      filename <- normalizePath(file.path(
                                          paste0(paste(input$day_type2, input$d_n2, sep = '_'), '.png')))
      list(src = filename,
           alt = 'Nothing',
           width = 600,
           height = 600
      )
    }, deleteFile = FALSE)
      
    output$taxiplot3 <- renderImage({
      filename <- normalizePath(file.path(
                                          paste0(input$from, '.png')))
      list(src = filename,
           alt = 'Nothing',
           width = 600,
           height = 600
      )
    }, deleteFile = FALSE)
    
    output$taxiplot4 <- renderImage({
      filename <- normalizePath(file.path(
                                          paste0(input$cost_per_minute, '.png')))
      list(src = filename,
           alt = 'Nothing',
           width = 600,
           height = 600
      )
    }, deleteFile = FALSE)
    
    output$taxiplot5 <- renderImage({
      filename <- normalizePath(file.path(
                                          paste0(input$miles_per_trip, '.png')))
      list(src = filename,
           alt = 'Nothing',
           width = 600,
           height = 600
      )
    }, deleteFile = FALSE)
    
    output$taxiplot6 <- renderImage({
      filename <- normalizePath(file.path('rides_per_second.png'))
      list(src = filename,
           alt = 'Nothing',
           width = 600,
           height = 600
      )
    }, deleteFile = FALSE)
    
})