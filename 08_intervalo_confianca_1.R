# Examinadas 500 pe�as encoutrou-se 260 defeituosas
# Qual � o IC 95% da propor��o defeituosa?
# O c�lculo da vari�ncia da propor��o � dado por p(1-p)

## Amostrando, 1 representa defeituosa e 0 representa funcional

amostra = c(rep(1,260), rep(0,240))

## Calculando tamanho da amostra, m�dia amostral e desvio amostral

n = length(amostra)

xbarra = mean(amostra)

s = sd(amostra)

## Calculando desvio a partir da f�rmula, tem que ser igual a s

sqrt(xbarra*(1-xbarra))

## Verificando valor do z usando a distribui��o normal e a distribui��o t

z = qnorm(0.975)

t = qt(0.975, n-1) # Quando seu grau de liberdade � gigante a t aproxima muito bem a normal

## Calculando intervalo de confian�a usando a normal

z_x_erro_padrao = z * s/sqrt(n)

intervalo_xbarra_z = xbarra + c(-1,1) * z_x_erro_padrao

## Calculando intervalo de confian�a usando a 

t_x_erro_padrao = t * s/sqrt(n)

intervalo_xbarra_t = xbarra + c(-1,1) * t_x_erro_padrao

## Usando a fun��o nativa do r para calcular intervalo de confian�a da m�dia

t.test(amostra)

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

## Comparando com o calculado

intervalo_xbarra_z 
