library(shiny)

shinyUI(fluidPage(

  titlePanel("Cacao T09"),
  
  sidebarLayout(
   sidebarPanel(
     selectInput("egrafico","Escoger gráfico",
                 list('Histograma'="gh",
                      'Polígono'="gp",
                      'Densidad'="gd",
                      'Boxplot'="gb")
                 ),
     selectInput("enumero","Número de gráficos",
                 list('1'="1",
                      '2'="2",
                      '3'="3",
                      '4'="4")
     ),
     radioButtons("radio", label=h3("Escoger variable"),choices=list("Largo"=1,"Ancho"=2, "Peso"=3, "Espesor"=4),selected=1),
     
  ),
  
  mainPanel(
    plotOutput(outputId="histograma")
  ))
))
