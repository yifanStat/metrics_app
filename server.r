library(shiny)

shinyServer(function(input, output, session){
  
  msg <- ""
  observe({
    message("input statistics:", input$statistics)
    message("input stock:", input$stocks)
    
    if (length(input$stocks) > 0){
      msg <- ""
      lk_series <- input$statistics
      lk_labels <- c(input$stocks)
      lk_dt <- stock_price[['stocks']][[lk_series]][, lk_labels, with=FALSE]
      lk_ylab = 'Price [$]'
      if (lk_series == 'Volume'){
        lk_ylab = 'Volume (LOG)'
        lk_dt <- log(lk_dt)
      }
      output$distPlot <- renderDygraph({
        dygraph(
          data = xts::xts(
            x = as.data.table(lk_dt), order.by = stock_price$date
          ), main = lk_labels,
          xlab = 'Date', ylab = lk_ylab
        ) %>% dyRangeSelector()
      })
    } else{
      msg <- 'Please select a stock.'
    }
  }) 
  
  output$msgTxt <- renderText({
    msg
  })
  
})
