obt_varible<-function(val, data){
  
  switch(
    val,
    "1"=variable<- data$largo,
    "2"=variable<- data$ancho,
    "3"=variable<- data$peso,
    "4"=variable<- data$espesor
  )
  return(variable)
}

obt_decs<-function(val){
  switch(
    val,
    "1"=descr<- "Análisis de variable largo",
    "2"=descr<-"Análisis de variable ancho",
    "3"=descr<-"Análisis de variable peso",
    "4"=descr<-"Análisis de variable espesor" 
  )
  return(descr)
}

obt_nvari<-function(val){
  switch(
    val,
    "1"=nvari<- "Largo",
    "2"=nvari<-"Ancho",
    "3"=nvari<-"Peso",
    "4"=nvari<-"Espesor" 
  )
  return(nvari)
}