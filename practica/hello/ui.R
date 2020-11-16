
library(shiny)
library(RPostgres)

db <- 'cacao'
host_db <- 'localhost'
db_port <- '5432'
db_user <- 'postgres'
db_password <- '1223'

conn <- dbConnect(RPostgres::Postgres(), dbname=db, host=host_db, user=db_user, password=db_password)
res <- dbSendQuery(conn,'select * from planta')
dat <- dbFetch(res)
pe <- dat$id[2] +1
color <- dat$color[2]
#n <- 2

# Define UI for application that plots random distributions 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cacao"),
  
  # Sidebar with a slider input for number of observations
  sidebarLayout(
   sidebarPanel(
     #numericInput(inputId = "numero", "valor", value=10),
     radioButtons("radio", label=h3("Seleccione tipo"),choices=list("Tipo 1"=1,"Tipo 2"=2),selected=1),
     checkboxInput("caja_if",label="si o no", value=TRUE),
     textInput("txt_titulo","Ingrese Titulo",value="")
  ),
  
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput(outputId="histograma")
  ))
))
