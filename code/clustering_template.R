# CLUSTERING IRIS.R
#
#
# Version:
#
# Date:
# Author:
#sdfdf
#TOC> ==========================================================================
#TOC>
#TOC>   Section  Title                                            Line
#TOC> --------------------------------------------------------------------------
#TOC>   1        Packages
#TOC>   2        Dataset exploration
#TOC>   3        Clustering
#TOC>   4        Multidimensional clustering
#TOC> ==========================================================================

# ====    1  Packages  =========================================================

if (!require(ggplot2, quietly = TRUE)) {
    install.packages("ggplot2")
    library(ggplot2)
}

# ====    2 Dataset exploration  ===============================================

iris_data <- iris

# Let's explore the dataset
str(iris_data)

summary(iris_data$Petal.Length)

# Let's explore the distribution of petal length across the different species

qplot(
    Petal.Length,
    data = iris_data,
    geom = 'density',
    color = Species,
    fill = Species
)

# ====    3 Clustering  ========================================================

# Can we exctract the different species into clusters using petal lenght?

iris_data2<-iris_data[,"Petal.Length"]

num_cluster<-3

set.seed(12345)

result<-kmeans(iris_data2,num_cluster,nstart = 20)
# Let's see how the original species have been assigned into clusters

table(result$cluster,iris_data$Species)

# Let's plot sepal lenght per cluster
qplot(Petal.Length,
      data = iris_data,
      fill=factor(result$cluster),)


# ====    4 Multidimensional clustering  =======================================

# Can we exctract the different species into clusters using 2 attributes?

iris_data2<-iris_data[,c("Petal.Length","Petal.Width")]

num_cluster<-3

set.seed(12345)

result<-kmeans(iris_data2,num_cluster,nstart = 20)
# Let's see how the original species have been assigned into clusters

table(result$cluster,iris_data$Species)

# Let's plot sepal lenght per cluster
qplot(Petal.Length,Petal.Width,
      data = iris_data,
      col=factor(result$cluster),)


# Let's plot sepal lenght and petal width per cluster


