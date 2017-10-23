

fluidPage(
  
  # Application title
  titlePanel("Stock Price for Major Tech Companies."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # 1. choose a statistics to show
      radioButtons("statistics",
                   label = h3('Choose a statistics:'),
                   choices = list('Open', 'Close', 'High', 'Low', 'Volume'),
                   selected = 'Close'),
      
      # 2. choose a stock to display
      checkboxGroupInput("stocks",
                         label = h3('Choose a stock:'),
                         choices = list('GOOG', 'AMZN', 'FB', 'MSFT', 'AAPL', 'NFLX'),
                         selected = 'GOOG')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      shiny::textOutput("msgTxt"),
      dygraphOutput("distPlot")
    )
  )
)