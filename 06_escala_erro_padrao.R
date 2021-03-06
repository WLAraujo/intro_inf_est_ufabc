# Gerando n�meros aleat�rios que vem de uma distribui��o normal com m�dia 0 e desvio 1

plot(1:100, rnorm(100))

# Gerando fun��o de densidade de probabilidade na normal

plot(seq(-4,4,by=0.1), dnorm(seq(-4,4,by=0.1)))

# Plotando densidade de probabilidade acumulada

plot(seq(-4,4,by=0.1), pnorm(seq(-4,4,by=0.1))) # Veja que no zero da 50%

# Vendo o valor de z, mesma coisa que o gr�fico acima mas com os eixos invertidos

plot(seq(0,1,by=0.025), qnorm(seq(0,1,by=0.025)))

# Qual a probabilidade acumulada de se estar em -1.96 e 1.96?

pnorm(c(-1.96,1.96))

# Qual � o Z associado � probabilidade acumulada de 0.025 e 0.975?

qnorm(c(0.025, 0.975))

# Personalizando a normal -> Multiplica pelo desvio padr�o e soma � m�dia

pop_altura = 170 + 15 * rnorm(1000000)


