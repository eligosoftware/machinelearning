# k-means clustering
dataset=read.csv("Mall_Customers.csv")
x<-dataset[4:5]
set.seed(6)
# the elbow method
wcss<-vector()
for(i in 1:10) wcss[i]<-sum(kmeans(x,i)$withinss)
plot(1:10,wcss,type="b",main = paste("Clusters of clients"),xlab = "Number of clusters",ylab = "WCSS")

# applying kmeans to mall dataset
set.seed(29)
kmeans<-kmeans(x,centers = 5,iter.max = 300, nstart = 10)

# Visualising
library(cluster)
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         plotchar = FALSE,
         span = TRUE,
         main = 'Clusters of clients',
         xlab = "Annual Income",
         ylab = "Spending Score")