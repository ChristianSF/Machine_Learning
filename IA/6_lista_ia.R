install.packages("factoextra")
library(factoextra)

dados = read.csv("C:/Users/chris/OneDrive/Documentos/Christian/Faculdade/3_Ano/1_Semestre/IA/dados/ibge_completo.csv")

#Visualizando primeiros elementos do dataset
head(dados)

#Visualizando ultimos elementos do dataset
tail(dados)

#Visualizando medidas estatisticas do dataset
summary(dados)

colnames(dados)

x = dados[,3:6]
head(x)

y = dados[,7:8]
head(y)

#Escalando variáveis
x_novo = scale(x, center = T)
head(x_novo)

y_novo = scale(y, center = T)
head(y_novo)

#Histograma variáveis escaladas
hist(x_novo)

hist(y_novo)

#Criação do modelo
modelo = kmeans(x_novo, 20)
modelo

#plot(x_novo, col=modelo$modelo, main="dados")

plot(x_novo, col=modelo$centers+1, main="Clusters", pch=20, cex=5)

g2 = fviz_cluster(modelo, data=x_novo, ellipse.type = "norm", ggtheme = theme_dark(), main = "Clusters")
plot(g2)

