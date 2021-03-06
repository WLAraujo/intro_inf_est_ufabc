# Inten��o de voto - 2897 entrevistados
# Covas - 23
# Boulos - 14
# Fran�a - 8
# Russomano - 6
# A margem de erro m�xima da pesquisa � de 2 pontos
# O n�vel de confian�a � 95%

# Vamos calcular o intervalo de confian�a para os valores do Covas

rm(list = ls())

n = 2897

prob = 0.23

desvio = sqrt(prob*(1-prob)) # F�rmula de desvio da propor��o

t = qt(c(0.025, 0.975), df = n-1) # Obtendo o valor de t

erro_padrao = desvio / sqrt(n)

IC95 = prob + t * erro_padrao

## Calculando a margem de erro a partir do intervalo de confian�a

IC95 - prob # A margem de erro deu um pouco normal, lembrando que para cada candidato temos um teste

# Fizemos o processo de maneira bem manual, tamb�m podemos fazer ele usando uma fun��o do r

## Criando amostra

amostra = c(rep(1,prob*n), rep(0, (1-prob)*n))

## Usando t.test

t.test(amostra)