install.packages("factoextra")
library(factoextra)

iris

cluster = kmeans(iris[1:4], centers = 3)
cluster
table(iris$Species, cluster$cluster)

plot(iris$Sepal.Length, iris$Sepal.Width, col = cluster$cluster, pch = 20, main = "iris")
plot(iris[,1:4], col=cluster$cluster, main="Iris")

g2 = fviz_cluster(cluster, data=iris[1:4], ellipse.type = "norm", ggtheme = theme_dark(), main = "Cluster")
plot(g2)

iris2 = iris
iris2['grupos'] = cluster$cluster
iris2