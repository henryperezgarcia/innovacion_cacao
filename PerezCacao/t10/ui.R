library(shiny)

shinyUI(fluidPage(

  titlePanel("Cacao T10"),
  
  sidebarLayout(
   sidebarPanel(
     selectInput("egrafico","Escoger gráfico",
                 list('Histograma'="gh",
                      'Polígono'="gp",
                      'Densidad'="gd",
                      'Boxplot'="gb")
                 ),
     radioButtons("radio", label=h3("Escoger variable"),choices=list("Largo"=1,"Ancho"=2, "Peso"=3, "Espesor"=4),selected=1),
     actionButton("show", "Varios gráficos")
     
  ),
  
  mainPanel(
    plotOutput(outputId="histograma")
  ))
))
