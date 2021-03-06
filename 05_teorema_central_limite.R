# Limpando ambiente

rm(list=ls())

# Definindo valores de popula��o

pop = c(0,1) # Moeda
#pop = 1:6 # Dado
#pop = 3.5 + 1.71 * rnorm(100000) # Normal com m�dia 3.5 e desvio 1.71

# Histograma de frequ�ncia da popula��o

hist(pop, xlim = range(pop), col='gray',
     breaks = seq(min(pop), max(pop), length = 30))

# M�dia e desvio

mu = mean(pop)

sigma = sqrt(sum((pop-mu)^2)/length(pop)) # Desvio padr�o de popula��o e n�o de amostra

# Criando 5000 amostras de tamanho 25 e analisando elas

n = 25

medias = vector() # Vetor que armazenar� m�dias de v�rias amostragens

for (amostragem in 1: 5000) {
  amostra = sample(pop, n, replace = T)
  medias[amostragem] = mean(amostra)
}

hist(medias, xlim = range(pop), col = "gray",
     breaks = seq(min(pop), max(pop), length = 50))

mean(medias) # Verifique que essa m�dia � pr�xima da m�dia da popula��o

mean(pop)

sd(medias) # Verifique que esse desvio se aproxima do desvio da popula��o divido por ra�z do tamanho da amostra

sigma/(n^0.5)

# Criando 5000 amostras para diversas tamanhos de amostra
# Estamos fazendo isso para calcular a m�dia das m�dias e desvio das m�dias

n_vec = c(1,2,3,4,9,16,25,36,49,64,81,100,225,400)

media_medias <- vector() # Vetor para calcular m�dia das m�dias

desvio_medias <- vector() # Vetor para calcular m�dia dos desvios

for (tamanho in 1:length(n_vec)){
  media = vector()
  for (amostragem in 1: 5000) {
    amostra = sample(pop, n_vec[tamanho], replace = T)
    media[amostragem] = mean(amostra)
  }
  media_medias[tamanho] = mean(media)
  desvio_medias[tamanho] = sd(media)
}

# Visualizando as m�dias das nossas amostragens e a m�dia da popula��o

plot(n_vec, media_medias, xlab = "Tamanho da amostra", col = 'gray',
     xlim = range(n_vec), ylim = range(pop), ylab = "M�dia das m�dias amostras")

par(new = T) # Nos permite plotar um gr�fico por cima do gr�fico atual

plot(range(n_vec), mu*c(1,1), type = 'l', col = 'red', xlab = "", ylab = "",
     lwd = 2, xlim = range(n_vec), ylim = range(pop), axes = F)

# Visualizando os desvios de nossas amostragens e o desvio da popula��o

plot(n_vec, desvio_medias, xlab = "Tamanho da amostra", col = 'gray',
     xlim = range(n_vec), ylim = c(0, max(desvio_medias)), ylab = "Desvio das m�dias amostras")

par(new = T) 

plot(n_vec, sigma/sqrt(n_vec), type = 'l', col = 'red', xlab = "", ylab = "",
     lwd = 2, xlim = range(n_vec), ylim = c(0, max(desvio_medias)), axes = F)

# Raz�o entre desvio padr�o e sigma/raiz da amostra

plot(n_vec, desvio_medias/(sigma/sqrt(n_vec)), xlim = range(n_vec),
     ylim = c(0,2))

par(new = T)

plot(range(n_vec), c(1,1), xlab = "", ylab = "", type = "l", col = "red",
     lwd = 2, xlim = range(n_vec), ylim = c(0, 2), axes = F)