# Sabemos que a m�dia do enem � 600 e o desvio padr�o � 100
# Dito isso, um cursinho afirma que melhora as notas do enem
# A m�dia dos alunos do cursinho � 618
# Isso � verdade?

# Passos para testar uma hip�tese
# 1-) Estruturar hip�tese nula
# 2-) Estruturar hip�tese alternativa
# 3-) Estruturar distribui��o se a hip�tese nula for v�lida
# 4-) Identificar as regi�es onde a hip�tese nula � aceita ou rejeitada
# 5-) Concluir o teste de signific�ncia da hip�tese nula

# Veja que s� temos a m�dia da amostra
# Vamos construir uma amostra para verificar a hip�tese
# A amostra ter� m�dia 618 e desvio 100

amostra = rnorm(100) # Pontos da distribui��o normal
amostra = (amostra-mean(amostra))/sd(amostra) # For�ando nosa amostra a ter m�dia 0 e desvio 1
amostra = amostra * 100 + 618 # Caracterizando a amostra
mean(amostra)
sd(amostra)

# Agora vamos usar a fun��o nativa do R para teste de hip�tese

# Teste unicaudal, veja que a hip�tese alternativa nesse caso � que a m�dia da amostra � maior que a da popula��o

t.test(amostra, mu = 600, alternative = "greater")

# Sobre o resultado apresentado pelo comando acima
## t -> Dist�ncia do limiar da hip�tese nula em unidades de erro padr�o (z)
## df -> Grau de liberdade
## p-value -> p-valor, probabilidade da hip�tese testada ser ao acaso

# Teste bicaudal, veja que a hip�tese alternativa nesse caso � que a m�dia � diferente da do enem

t.test(amostra, mu = 600, alternative = "two.sided")

# Usamos a fun��o nativa do R, agora, vamos fazer esse processo de forma mais manual

# 1) Hip�tese nula: mu_curso = mu_n�o curso

# 2) Hip�tese alternativa: mu_curso != mu_n�o curso

# 3) distrib hipotese nula

ep = 100 / sqrt(100) # Calculando erro padr�o das m�dias
# Escala real    mu=600, EP=sigma/n^0.5=100/100^0.5=10
# Escala EP      0       1                      


# 4-) Verificando regi�es de limiar da hip�tese

t_critico = qt( c(0.025,0.975) , df=99 )
t_critico # Mostrando os limiares na escala de erro padr�o

real_critico = t_critico * ep + 600
real_critico # Mostrando os limiares na escala real

# 5-) Verificando a signific�ncia da hip�tese nula. 
#     Evid�ncia emp�rica est� na regi�o de aceita��o ou rejei��o da hip�tese nula?

real_observado = 618 # M�dia amostral
t_observado = (618-600)/10 # M�dia amostral levada � escala do erro padr�o
t_observado

t_observado > min(t_critico) # O t_observado � maior do que o m�nimo do intervalo?
t_observado < max(t_critico) # O t_observado � maior do que o m�nimo do intervalo?
# Se o nosso t_observado estiver dentro do intervalo n�s aceitamos a hip�tese nula