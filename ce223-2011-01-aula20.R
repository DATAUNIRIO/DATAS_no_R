#==========================================================================================
# Aula 20 da disciplina ce223 (27/05/2011)
# Expressões regulares
#                                                               Professor Walmes M. Zeviani
#                                                                     www.leg.ufpr.br/ce223
#==========================================================================================

#------------------------------------------------------------------------------------------
# Busca por padrões de texto em conjunto de palavras
# Faz uso de metacaracteres [] . * ? + () {} ^ $ \b
# grep(padrão, texto)

help(regex, help_type="html")

#------------------------------------------------------------------------------------------
# busca de palavras

x <- colors()
grep("^w", x, value=TRUE)    # ^ procura inicio da palavra
grep("blue$", x, value=TRUE) # $ procura fim da palavra

#------------------------------------------------------------------------------------------
# busca e substituição de palavras

y <- grep("^c", x, value=TRUE)
gsub("^(c)", "C", y)      # procura letra "c" no início da palavra e substitui por "C"
gsub("^(c)a", "C", y)     # procura palavra com início "ca" e substitui "c" por "C" (erro)
gsub("(^c)a", "C", y)     # procura palavra com início "ca" e substitui "c" por "C" (erro)
gsub("(^ca)", "Ca", y)    # procura palavra com início "ca" e substitui "c" por "C"
y <- grep("blue$", x, value=TRUE)
gsub("(blue$)", "red", y) # procura palavra com "blue" no final e substitui por "red"
gsub("(blue)$", "red", y) # procura palavra com "blue" no final e substitui por "red"

#------------------------------------------------------------------------------------------
# importa dos dados alfabetizados para aplicar expressões nos nomes das cidades

require(gdata)
alfab <- read.xls("http://www.leg.ufpr.br/~walmes/ensino/ce223-2011-01/alfabetizados2000municipios.xls",
                  sheet=1, fileEncoding='latin1', encoding="latin1")

mun <- as.character(alfab$Município)           # cria um vetor com o nome dos municípios

grep("^W", mun, value=TRUE)                    # procura cidades com "W" no início do nome
grep("^W.*z$", mun, value=TRUE)                # (. qualquer coisa, um caracter) (* deixa "." espaço interno flexível)
grep("^P...o$", mun, value=TRUE)               # inicio com "P", tres caracteres no meio e termina com "o"
grep("P...o$", mun, value=TRUE)                # palavra com "P", tres espaços e "o" no final)
grep("^P.{3}o$", mun, value=TRUE)              # {} indica a quantidade de repetição do caracter anterior (idem anterior)
grep("^P.{3}[oa]$", mun, value=TRUE)           # final "o" ou "a"
grep("^[AEIOU].{3}s$", mun, value=TRUE)        # palavra com início em vogal, tres caracteres no meio e "s" no final
grep("^[AEIOU].{3}[a-g]$", mun, value=TRUE)    # final de "a" até "g"
grep("^[AEIOU].{3}[a-eo-z]$", mun, value=TRUE) # final de "a" até "e" ou de "o" até "z"
grep("\\.", mun, value=TRUE)                   # procura por "." ("\\" remove a função de metacaracter do ".")
grep(" . ", mun, value=TRUE)                   # palavra com uma letra isolada no meio
grep("\\bP.{4}$", mun, value=TRUE)             # palavra de 5 caracteres iniciando por "P" e no final
grep("\\bP.{4} *\\b", mun, value=TRUE)           # palavra de 5 caracteres iniciando por "P" em qualquer lugar

#------------------------------------------------------------------------------------------
# editando a formatação de datas

x <- c("01-11-08", "03-12-09")
grep("[0-9]{2}$", x, value=TRUE)
gsub("([0-9]{2})$", "20\\1", x) # procura ano com dois digitos e troca para quatro dígitos

x <- c("1-11-08", "31-12-09")
gsub("(^[0-9]-)", "0\\1", x)    # procura data com um dígito no início e substitui por dois digitos
gsub("^([0-9]-)", "0\\1", x)    # procura data com um dígito no início e substitui por dois digitos

#------------------------------------------------------------------------------------------
