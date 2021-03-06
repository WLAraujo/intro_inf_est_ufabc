# Medidas de tend�ncia central

x <- c(101, 109, 109, 113, 187, 187)

# M�dia

mean(x)

# Mediana

median(x)

# Moda - N�o existe fun��o, construir tabela de frequ�ncias ou fun��o

table(x)
names(table(x))
names(table(x))[table(x) == max(table(x))]

moda = function(input){
  saida = names(table(input))[table(input) == max(table(input))]
  saida = as.numeric(saida)
  return(saida)
}
moda(x)

# M�dia com trim

mean(x, trim=0.2)

# Range dos dados

range(x)
max(range(x)) - min(range(x))
diff(range(x))

# Vari�ncia

var(x)

# Desvio padr�o

sd(x)

# Intervalo interquartil

quantile(x, c(0.25, 0.75))
diff(quantile(x, c(0.25, 0.75)))
