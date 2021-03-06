rm(list=ls())

# Temos acesso � verdade sobre os riscos de sa�de relacionados perfume X.
# Popula��o em geral: expectativa de vida � mu=60 anos e sigma=10 anos
# Popula��o perfume: mu=57 anos e sigma=10 anos
# Um estudo foi conduzido amostrando n=100 pessoas de cada grupo
# Usando n�vel de signific�ncia alfa=0.05,
# Qual � a taxa de erro tipo I e II?  Qual � o poder do experimento?

# Definindo vari�veis com valores conhecidos

sigma_hip_0 = 10
n = 100 
erro_padrao = sigma_hip_0/sqrt(n) 

# �rea de aceita��o de h0 na escala de erro padr�o

alfa = 0.05
intervalo = c(alfa/2,1-alfa/2) # Intervalo dos limiares considerando alfa

escala_t = qt(intervalo, df=n-1) * erro_padrao + 60 # Quais s�o os limiares para os valores reais
escala_t # Limites da �rea de aceita��o da hip�tese nula

###############################################################################

# Vamos produzir uma amostra usando a popula��o que usa perfume
# Vamos usar essa amostra para testar se ocorre ou n�o um erro tipo 2, isso para uma amostra
# Lembrando que erro tipo 2 � falso negativo (Ha real, H0 conclu�do)
# Mas s� podemos afirmar isso, pois sabemos que o perfume de fato reduz a expectativa de vida

amostra = rnorm(100) * sigma_hip_0 + 57
xbarra = mean(amostra) # Expectativa de vida da amostra

# Abaixo fazemos o teste da m�dia amostral em compara��o com nosso intervalo
if ( xbarra > min(escala_t)  &  xbarra < max(escala_t) ){
  print("Aceita a hip�tese nula que sabemos que � incorreta")
  erro_tipo_2 = 1
} else {
  print("Rejeita a hip�tese nula que sabemos que � incorreta")
  erro_tipo_2 = 0
} 

# Agora vamos repetir o experimento realizado acima para 10000 amostras

rm(list=ls())

sigma_pop = 10
n = 100
erro_padrao = sigma_pop/sqrt(n)

alfa = 0.05
intervalo = c(alfa/2,1-alfa/2)

intervalo_real = qt( intervalo, df=n-1) * erro_padrao + 60 # Intervalo de limiares real

erro_tipo_2 = rep(0,10000) # Vetor para guardar se ocorreu erro tipo 2 (falso negativo)

# Repeti��o da cria��o de uma amostra e teste para ver se acusa erro tipo 2
for (i in 1:10000){
  amostra = rt(n, df=n-1)* sigma_pop + 57
  xbarra = mean(amostra)
  if ( xbarra > min(intervalo_real)  &  xbarra < max(intervalo_real) ){
    erro_tipo_2[i] = 1
  } 
}

# Calculando taxa de erro e poder
taxa_de_erro_tipo_2 = mean(erro_tipo_2)
taxa_de_erro_tipo_2
poder = 1 - taxa_de_erro_tipo_2
poder
