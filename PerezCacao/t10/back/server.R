library(shiny)
source("/srv/shiny-server/cacao/innovacion_cacao/PerezCacao/t10/grafico.R")
source("/srv/shiny-server/cacao/innovacion_cacao/PerezCacao/t10/obtenerDatos.R")

shinyServer(function(input, output) {

  data<-retData()  
  
  
  
  dataModal <- function(failed = FALSE) {
    modalDialog(
      checkboxGroupInput("iconso", "Choose icons:",
                         list('Histograma'="histograma",
                              'Poligono'="poligono",
                              'Densidad'="densidad",
                              'Boxplot'="boxplot")
      ),
      footer = tagList(
        modalButton("Cancel"),
        actionButton("ok", "OK")
      )
    )
  }
  variable<-"null"
  desc<-"null"
  observeEvent(input$enumero, {
    if(input$enumero!=1){
      showModal(dataModal())
    }else{
      output$histograma <- renderPlot({
        
        
        switch(
          input$radio,
          "1"=variable<- data$largo,
          "2"=variable<- data$ancho,
          "3"=variable<- data$peso,
          "4"=variable<- data$espesor
        )
        switch(
          input$radio,
          "1"=desc<- "Análisis de variable largo",
          "2"=desc<-"Análisis de variable ancho",
          "3"=desc<-"Análisis de variable peso",
          "4"=desc<-"Análisis de variable espesor" 
        )
        switch(
          input$radio,
          "1"=nvari<- "Largo",
          "2"=nvari<-"Ancho",
          "3"=nvari<-"Peso",
          "4"=nvari<-"Espesor" 
        )
        
        switch(
          input$egrafico,
          "gh"=gh(data, variable, "HISTOGRAMA", desc, nvari),
          "gp"=gp(data, variable, "POLÍGONO", desc, nvari),
          "gd"=gd(data, variable, "DENSIDAD", desc, nvari),
          "gb"=gb(data, variable, "BOXPLOT", desc, nvari)
        )
      })
    }
    
  })
  observeEvent(input$ok, {
    data<-retData()  
    lis<-NULL
    lis<-append(lis,input$iconso)
    output$histograma <- renderPlot({
      switch(
        input$radio,
        "1"=variable<- data$largo,
        "2"=variable<- data$ancho,
        "3"=variable<- data$peso,
        "4"=variable<- data$espesor
      )
      switch(
        input$radio,
        "1"=descr<- "Análisis de variable largo",
        "2"=descr<-"Análisis de variable ancho",
        "3"=descr<-"Análisis de variable peso",
        "4"=descr<-"Análisis de variable espesor" 
      )
      switch(
        input$radio,
        "1"=nvari<- "Largo",
        "2"=nvari<-"Ancho",
        "3"=nvari<-"Peso",
        "4"=nvari<-"Espesor" 
      )
      agrupa(lis, data, variable, descr, nvari)
    })
    removeModal()
  })
  
})
