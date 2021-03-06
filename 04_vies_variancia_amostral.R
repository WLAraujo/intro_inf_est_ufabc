# Verificando a acur�cia da estima��o dos par�metros mi e sigma^2 populacionais
# atrav�s da m�dia e da vari�ncia amostral

# O objetivo da atividade � verificar que o c�lculo da vari�ncia amostral com
# divis�o por n acaba levando a um vi�s e por isso a divis�o por n-1 � mais acurada

pop = c(rep(1,10000), rep(2,10000), rep(3,10000))

media_pop = sum(pop)/length(pop)

var_pop = sum((pop-media_pop)^2)/length(pop)

tam_amostra = 2


media_amostra = vector()
var_amostra_c_vies = vector()
var_amostra_s_vies = vector()

# Primeira amostra

i=1
amostra = sample(pop, tam_amostra, replace = F) # Amostra sem reposi��o
media_amostra[i] = sum(amostra)/tam_amostra
var_amostra_c_vies[i] = sum((amostra-media_amostra[i])^2)/tam_amostra
var_amostra_s_vies[i] = sum((amostra-media_amostra[i])^2)/(tam_amostra-1)

# Outras amostras

for(i in 2:10000){
  amostra = sample(pop, tam_amostra, replace = F)
  media_amostra[i] = sum(amostra)/tam_amostra
  var_amostra_c_vies[i] = sum((amostra-media_amostra[i])^2)/tam_amostra
  var_amostra_s_vies[i] = sum((amostra-media_amostra[i])^2)/(tam_amostra-1)
}

# Trabalhando com a m�dia das amostras

hist(media_amostra)
mean(media_amostra)
media_pop

# Veja que os valores da m�dia amostral e populacional s�o bem pr�ximos
# Isso porque a m�dia possui amostral possui boa acur�cia

# Analisando vari�ncia com vi�s

hist(var_amostra_c_vies)
mean(var_amostra_c_vies)
var_pop

# A vari�ncia com vi�s se dist�ncia muito da vari�ncia populacional

# Analisando vari�ncia sem vi�s

hist(var_amostra_s_vies)
mean(var_amostra_s_vies)
var_pop

# Veja como a vari�ncia sem vi�s se aproxima muito mais da vari�ncia populacional


