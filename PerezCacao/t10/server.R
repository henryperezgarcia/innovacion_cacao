library(shiny)
source("/srv/shiny-server/cacao/innovacion_cacao/PerezCacao/t10/grafico.R")
source("/srv/shiny-server/cacao/innovacion_cacao/PerezCacao/t10/obtenerDatos.R")
source("/srv/shiny-server/cacao/innovacion_cacao/PerezCacao/t10/vent_modal.R")

shinyServer(function(input, output) {

  data<-retData() 
  dataModal <- function(failed = FALSE) {
    modalDialog(
      checkboxGroupInput("iconso", "Escoger gráficos",
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
  observeEvent(input$show, {
    showModal(dataModal())
  })
  observeEvent(input$egrafico, {
    output$histograma <- renderPlot({
      individuales(data, input$radio, input$egrafico)
    })
  })
  observeEvent(input$ok, {
    data<-retData()  
    lis<-NULL
    lis<-append(lis,input$iconso)
    if(length(lis)>1){
      output$histograma <- renderPlot({
        variable<-obt_varible(input$radio, data)
        descr<-obt_decs(input$radio)
        nvari<-obt_nvari(input$radio)
        agrupa(lis, data, variable, descr, nvari)
      })
    }else{
      output$histograma <- renderPlot({
        individuales(data, input$radio, input$iconso)
      })
    }
    removeModal()
  })
  output$histograma <- renderPlot({
    individuales(data, input$radio, input$egrafico)
  })
})
