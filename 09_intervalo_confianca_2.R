# A m�dia e desvio padr�o de uma mostra de 10 elementos s�o 8.7 e 2.0
# Qual o IC da m�dia com n�vel 95%

rm(list=ls())

## Definindo vari�veis

n = 10

xbarra = 8.7

s = 2

## N�o podemos usar a fun��o t.test, pois as fun��es nativas do R exigem uma amostra, mas
## n�s s� temos as estat�sticas, n�o temos as amostras.

## Por isso, n�s vamos simular uma amostra usando as estat�sticas.

amostra = rnorm(10) # 10 elementos vindos de uma normal com m�dia 0 e desvio 1

## Observe os valores abaixo

mean(amostra)
sd(amostra)

## Vamos for�ar essa amostra a ter m�dia 0 e desvio 1 para depois adapt�-la para uma com nossas estatisticas

amostra = (amostra-mean(amostra))/sd(amostra)

## Agora, para obter uma amostra com mesmas estat�sticas que do exemplo basta fazer um c�lculo simples

amostra = amostra * s + xbarra

mean(amostra)

sd(amostra)

## Agora, conseguimos usar as fun��es nativas do R para calcular o intervalo de confian�a

t.test(amostra)

## Usando bootstrap

## Definindo intervalo de confian�a via bootstraping

xbarra_bs = vector()

## Repetindo diversas vezes amostragem

for (b in 1:10000) {
  amostra_bs = sample(amostra,length(amostra), replace = TRUE)
  xbarra_bs[b] = mean(amostra_bs)
}

## Visualizando a distribui��o de m�dias amostrais

hist(xbarra_bs)

## Visualizando os quantis respectivos para 95%

quantile(xbarra_bs, c(0.025, 0.975))

