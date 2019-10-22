
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

