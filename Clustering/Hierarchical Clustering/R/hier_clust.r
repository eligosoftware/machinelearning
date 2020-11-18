# Hierarchical clustering

dataset=read.csv('Mall_Customers.csv')
X=dataset[4:5]

dendrogram=hclust(dist(X,method = 'euclidean'),method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distances')
hc=hclust(dist(X,method = 'euclidean'),method = 'ward.D')
y_hc=cutree(hc,5)
# Visualising
#library(cluster)
#clusplot(dataset,
#         y_hc,
#         lines = 0,
#         shade = TRUE,
#         color = TRUE,
#         plotchar = FALSE,
#         span = TRUE,
#         main = 'Clusters of clients',
#         xlab = "Annual Income",
#         ylab = "Spending Score")

install.packages('factoextra')

library(factoextra)

fviz_cluster(list(data=X,cluster=y_hc))+ggtitle("Clusters of Customers")+
  
  xlab("Annual Income")+
  
  ylab("Spending Score")

