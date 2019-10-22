#==========================================================================================
# Aula 21 da disciplina ce223 (03/06/2011)
# Expressões regulares
#                                                               Professor Walmes M. Zeviani
#                                                                     www.leg.ufpr.br/ce223
#==========================================================================================

#------------------------------------------------------------------------------------------
# alternância

x <- c("psicodelico", "psicadelico", "psicotico")
grep("psicodelico|psicadelico", x, value=TRUE)
grep("psic(a|o)delico", x, value=TRUE)
grep("psic[ao]delico", x, value=TRUE)

y <- c("associassão", "associação", "association")
grep("associa(ss|ç)ão", y, value=TRUE)

#------------------------------------------------------------------------------------------
# Quantificação: ?, *, +

x2 <- c("Danielle", "Gisele", "Renata", "Clarice", "Sofia")
grep("l?e", x2, value=TRUE) # o caracter anterior a "?" é opcional

x3 <- c("ação", "acção")
grep("ac?ção", x3, value=TRUE)

x4 <- c("ab", "ac", "abc", "abbc", "abbbc")
grep("ab*c", x4, value=TRUE) # "*" indica 0 ou mais ocorrências
grep("ab+c", x4, value=TRUE) # "+" indica 1 ou mais ocorrências

#------------------------------------------------------------------------------------------
# repartindo uma string

q <- "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.:;<>?~^´`()[]{}!@#$%*_-=+¹²³£¢¬§ªº°|ÇÃÁÀẼÉÈĨÍÌÕÓÒŨÚÙçãáàẽéèĩíìõóòũúù "
strsplit(q, "a")
strsplit(q, "0")
strsplit(q, "")               # cria uma lista com os caracteres separados
q <- unlist(strsplit(q, ""))  # unlist transforma lista em vetor

#------------------------------------------------------------------------------------------
# os conjuntos de strings

grep("[A-Z]", q, value=TRUE)
grep("[0-9]", q, value=TRUE)
grep("\\d", q, value=TRUE)    # retorna apenas os números
grep("\\D", q, value=TRUE)    # retorna tudo menos os números (complementar ao anterior)
grep("\\w", q, value=TRUE)    # retorna letras e números
grep("\\W", q, value=TRUE)    # retorna o complementar ao anterior
grep("\\s", q, value=TRUE)    # retorna o caracter "espaço"
grep("[^A-Z]", q, value=TRUE) # retorna todos os caracteres exceto os maiúsculos
grep("[^0-5]", q, value=TRUE) # retorna todos os caracteres exceto os números de 0 a 5

#------------------------------------------------------------------------------------------

r <- c("aacc","aabcc","aabbcc","aabbbcc","aabbbbcc")
grep("b", r, value=TRUE)            # possui b
grep("b*", r, value=TRUE)           # possui 0 ou mais b
grep("b+", r, value=TRUE)           # possui 1 ou mais b
grep("ba?", r, value=TRUE)          # possui b ou ba, a é opcional
grep("b{3}", r, value=TRUE)         # possui 3 ou mais b
grep("[^b]b{3}[^b]", r, value=TRUE) # possui apenas 3 b em sequência

#------------------------------------------------------------------------------------------
# juntando strings

paste(q, collapse="")               # une todos os caracteres
paste("Walmes", "Zeviani", sep=" ") # une as duas palavras e coloca o caracter "espaço" entre elas

#------------------------------------------------------------------------------------------
# formatando strings formadas por números

formatC(c(3, 30, 300), digits=2, format="fg", flag="0") # completa os números com o caracter "0" na frente
formatC(2, width=7, format="fg", flag="0")
formatC(c(3,30,300), digits=2, format="s")

#------------------------------------------------------------------------------------------
# o vetor abaixo possui mistura de CEP, telefone, data de nascimento e placa de carro

cep <- paste(formatC(floor( 100*runif(10)), digits=1, format="fg"), ".",
             formatC(floor(1000*runif(10)), digits=2, format="fg", flag="0"), "-",
             formatC(floor(1000*runif(10)), digits=2, format="fg", flag="0"), sep="")
cep

tel <- paste("(", formatC(floor(runif(10,10,90)), digits=1, format="fg"), ") ",
             formatC(floor(runif(10,0,9999)), digits=3, format="fg", flag="0"), "-",
             formatC(floor(runif(10,0,9999)), digits=3, format="fg", flag="0"), sep="")
tel

nas <- paste(formatC(floor(runif(10,1,28)), digits=1, format="fg", flag="0"), "/",
             formatC(floor(runif(10,1,12)), digits=1, format="fg", flag="0"), "/",
             formatC(floor(runif(10,1980,2000)), digits=3, format="fg", flag="0"), sep="")
nas

pla <- paste(paste(LETTERS[sample(26, 10, replace=TRUE)],
                   LETTERS[sample(26, 10, replace=TRUE)],
                   LETTERS[sample(26, 10, replace=TRUE)], sep=""), "-",
             formatC(floor(runif(10,0,10000)), digits=3, format="fg", flag="0"), sep="")

#------------------------------------------------------------------------------------------

