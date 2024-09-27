
# DATAS no R

# Expressoes regulares no R

Fontes: 
http://material.curso-r.com/stringr/  
http://www.leg.ufpr.br/~walmes/ensino/ce223-2011-01/ce223-2011-01-aula20.R  
http://www.leg.ufpr.br/~walmes/ensino/ce223-2011-01/ce223-2011-01-aula21.R   
http://www.leg.ufpr.br/%7Ewalmes/ensino/ce223-2011-01/ce223-2011-01-aula22.R  
================================================================================================

------------------------------------------------------------------------------------------
uma string que representa uma data precisa ser convertido para data, usando as.Date()  
  
  
Vetor de datas no formato brasileiro ( dd/mm/aaaa)    
dados<-data.frame(datas = c("10/01/1980","21/08/1963","03/09/1957","26/09/1981") ,  
                  valor = c(3,7,1,9),stringsAsFactors = FALSE)   
dados   
  
------------------------------------------------------------------------------------------  
converte para o formato aaaa-mm-dd  
dados$datas <- as.Date(dados$datas, "%d/%m/%Y")  

------------------------------------------------------------------------------------------  
dados$dias<-(Sys.Date()- dados$datas)  
dados$idade<-dados$dias/365.25  
dados$idade<-as.numeric(dados$idade)  
dados$idade<-round(dados$idade,1)   

------------------------------------------------------------------------------------------
Faz um gráfico  
plot(dados)  
abline(h=mean(dados$valor),col="red")  
ou  
barplot(dados$valor,names.arg=format(dados$datas,"%d/%m/%Y"),col="royalblue")  

------------------------------------------------------------------------------------------
 vetor do dia de hoje 
hoje <- as.Date(Sys.time())
hojes<-rep(hoje,4)

------------------------------------------------------------------------------------------
Diferença de datas (Calculo da idade)   
  
Para dias  
z<-difftime(hojes,dados$datas,units="days")  

Para anos:
z<-difftime(hojes,dados$datas,units="days")/365.25   

z<-round(z)  
z  

------------------------------------------------------------------------------------------   
 Formatacao de datas     


format(Sys.Date(),"%d/%m/%Y")   
# ou   
format(Sys.Date(), "%d %b %Y")    
   
------------------------------------------------------------------------------------------    
codigo do José de Jesus Filho no telegram   
library(magrittr)

"Jan-89" %>% 
  paste0("15-",.) %>% 
  lubridate::dmy()

------------------------------------------------------------------------------------------

library(tibble)
library(janitor)

banco_complementar$data_baixa = excel_numeric_to_date(as.numeric(as.character(banco_complementar$`Data baixa`)), date_system = "modern") 
difftime(banco_complementar$data_baixa,banco_complementar$`Data de autuação`,units="days")                        
