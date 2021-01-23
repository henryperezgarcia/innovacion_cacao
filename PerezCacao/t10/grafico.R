library(ggplot2)
library(gridExtra)
gh<-function(data, arre, tit, sub, nvari){
  g<-ggplot(data = data,aes(x = arre)) + 
    geom_histogram(aes(y=..density..), bins=30, fill="black")+
    labs(title=tit,
         subtitle=sub, 
         x=nvari,
         color=NULL)
  return(g)
}
gp<-function(data, arre, tit, sub, nvari){
  ale<-round(runif(length(arre), min=0, max=2),4)
  variable<-arre
  g<-ggplot(data = data,aes(x = arre, y=ale, fill=variable)) + 
    geom_polygon()+ 
    labs(title=tit,
         subtitle=sub, 
         x=nvari,
         y="Aleatorio",
         color=NULL)
  return(g)
}

gd<-function(data, arre, tit, sub, nvari){
  g<-ggplot(data = data,aes(x = arre)) + 
    geom_density(alpha=0.5, size=0.30, fill="red", color="sky blue")+
    labs(title=tit,
         subtitle=sub, 
         x=nvari,
         color=NULL)
  return(g)
}

gb<-function(data, arre, tit, sub, nvari){
  g<-ggplot(data = data,aes(x = arre)) + 
    geom_boxplot(aes(y=..y..-0.40),size=0.20)+
    labs(title=tit,
         subtitle=sub, 
         x=nvari,
         color=NULL)
  return(g)
}

agrupa<-function(graficos, data, vari, desc, nvari){
  g1<-NULL
  g2<-NULL
  g3<-NULL
  g4<-NULL
  est<-c("histograma", "poligono", "densidad", "boxplot")
  if(length(graficos)==2){
    for(i in 1:length(graficos)){
      for(j in 1:length(est)){
        if(graficos[i]==est[j]){
          if(i==1){
            switch (j,
                    "1" = g1<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g1<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g1<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g1<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
          if(i==2){
            switch (j,
                    "1" = g2<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g2<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g2<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g2<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
        }
      }
    }
    
    grid.arrange(g1, g2, ncol=1, nrow=2)
  }
  if(length(graficos)==3){
    for(i in 1:length(graficos)){
      for(j in 1:length(est)){
        if(graficos[i]==est[j]){
          if(i==1){
            switch (j,
                    "1" = g1<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g1<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g1<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g1<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
          if(i==2){
            switch (j,
                    "1" = g2<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g2<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g2<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g2<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
          if(i==3){
            switch (j,
                    "1" = g3<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g3<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g3<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g3<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
        }
      }
    }
    
    grid.arrange(g1, g2,g3, ncol=2, nrow=2)
  }
  if(length(graficos)==4){
    for(i in 1:length(graficos)){
      for(j in 1:length(est)){
        if(graficos[i]==est[j]){
          if(i==1){
            switch (j,
                    "1" = g1<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g1<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g1<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g1<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
          if(i==2){
            switch (j,
                    "1" = g2<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g2<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g2<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g2<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
          if(i==3){
            switch (j,
                    "1" = g3<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g3<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g3<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g3<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
          if(i==4){
            switch (j,
                    "1" = g4<-gh(data, vari, "HISTOGRAMA", desc, nvari),
                    "2"= g4<-gp(data, vari, "POLÍGONO", desc, nvari),
                    "3"= g4<-gd(data, vari, "DENSIDAD", desc, nvari),
                    "4"= g4<-gb(data, vari, "BOXPLOT", desc, nvari)
            )
          }
        }
      }
    }
    
    grid.arrange(g1, g2, g3, g4, ncol=2, nrow=2)
  }
}

individuales<-function(data, val, graf){
  switch(
    graf,
    "histograma"=graf<-"gh",
    "poligono"=graf<-"gp",
    "densidad"=graf<-"gd",
    "boxplot"=graf<-"gb"
  )
  variable<-obt_varible(val, data)
  desc<-obt_decs(val)
  nvari<-obt_nvari(val)
  
  switch(
    graf,
    "gh"=gh(data, variable, "HISTOGRAMA", desc, nvari),
    "gp"=gp(data, variable, "POLÍGONO", desc, nvari),
    "gd"=gd(data, variable, "DENSIDAD", desc, nvari),
    "gb"=gb(data, variable, "BOXPLOT", desc, nvari)
  )
}