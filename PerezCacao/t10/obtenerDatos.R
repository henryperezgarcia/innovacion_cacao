library(RPostgres)
retData<-function(){
  set.seed(111)
  db <- 'cacao'
  host_db <- 'localhost'
  db_port <- '5432'
  db_user <- 'postgres'
  db_password <- '1223'

  conn <- dbConnect(RPostgres::Postgres(), dbname=db, host=host_db, user=db_user, password=db_password)
  creci <- dbSendQuery(conn,'select largo, ancho, peso, espesor from prop_fisicas')
  data <- dbFetch(creci)
  return(data)
}