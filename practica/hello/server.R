library(shiny)
library(RPostgres)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot

  output$histograma <- renderPlot({
    set.seed(111)
    db <- 'cacao'
    host_db <- 'localhost'
    db_port <- '5432'
    db_user <- 'postgres'
    db_password <- '1223'
    
    conn <- dbConnect(RPostgres::Postgres(), dbname=db, host=host_db, user=db_user, password=db_password)
    
    creci <- dbSendQuery(conn,'select * from crecimiento')
    cre <- dbFetch(creci)
    plot( cre$mes,cre$tamanio, main=input$txt_titulo)
    
  })

})
