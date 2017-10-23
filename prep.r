
stock_price <- fread('data/stocks_prices.csv', header=T)
sp <- list()
sp$symbols <- unique(stock_price$stock)
sp$date <- as.Date(stock_price[stock == 'GOOG', date])
sp$metrics <- c('Open', 'Close', 'High', 'Low', 'Volume')

sp$stocks <- list()
for (l in sp$metrics){
  for (st in sp$symbols){
    eval(parse(text = paste('sp$stocks$', l, "$", st,"<- stock_price[stock == '", st, "',", l,"]", sep='')
    )) 
  }
}

for (s in sp$metrics){
  eval(parse(text = paste("sp$stocks$", s, "<- as.data.table(sp$stocks$", s, ")", sep="")
               ))
}
saveRDS(sp, 'data/stock_price.rds')



