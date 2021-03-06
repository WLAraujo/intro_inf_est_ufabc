# Exerc�cio: 
# A distribui��o de scores de QI populacional � normal com m�dia 100 e desvio 15
# Selecionamenos aleatoriamente 100 indiv�duos e avaliamos seus QIs
# Qual � a chance de obtermos a m�dia da amostra 104 ou mais alta?

# Para fazermos isso temos que fazer a distribui��o em quest�o chegar na distribui��o padr�o

# Calculando o valor de Z = (medida-media)/erro padr�o
# Lembrando que erro padr�o = desvio/raiz(amostra)

erro_padrao = 15/(100^0.5)

z = (104-100)/erro_padrao

prob_acumulada = pnorm(z)

prob_maior_104 = 1 - prob_acumulada

# prob_maior_104 = 0.0038

# A forma que acabamos de calcular foi usando o Teorema Central do Limite
# Vamos provar que se fizermos muitas amostras a porcentagem delas com m�dia mior que 104 � um valor parecido

# Limpando as vari�veis

rm(list=ls())

# Calculando v�rios pontos na normal do problema

pop = 100 + 15 * rnorm(100000)

# Plotando histograma dessa popula��o

hist(pop, xlim = range(pop), co = 'gray', breaks = seq(min(pop), max(pop), length=100),
     xlab = "QI")

# Pegando 10000 amostras

n = 100

media_amostra = vector()

for (amostragem in 1:10000){
  amostra = sample(pop, n, replace = T)
  media_amostra[amostragem]=mean(amostra)
}

hist(media_amostra, xlim = range(pop), co = 'gray', 
     breaks = seq(min(pop), max(pop), length=100))

# Verificando a probabilidade

media_amostra >= 104

mean(media_amostra >= 104)

# Valores apresentados giram em torno de 0.0039 a 0.0045
