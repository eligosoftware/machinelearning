# Regression template

# Importing the dataset
dataset=read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

# Splitting the dataset into the training and testing sets
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split=sample.split(dataset$Profit, SplitRatio = 0.8)
# training_set=subset(dataset,split==TRUE)
# test_set=subset(dataset,split==FALSE)
# Feature scaling
# training_set=scale(training_set)
# test_set=scale(test_set)

# Filling Linear Regression to the dataset
lin_reg=lm(formula=Salary~.,data=dataset)

# Filling Polynomial Regression to the dataset
# Create your regressor here

# Predicting a new result with Polynomial Regression
y_pred=predict(regressor,data.frame(Level=6.5))

# Visualising the Polynomial Regression results
# install.package('ggplot2)
library(ggplot2)
ggplot()+geom_point(aes(x=dataset$Level,y=dataset$Salary),colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)), colour='blue')+
  ggtitle('Truth or Bluff (Regression Model)')+
  xlab('Level')+
  ylab('Salary')

# Visualising the Polynomial Regression results (for higher resolution and smoother curve)
# install.package('ggplot2)
library(ggplot2)
x_grid=seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+geom_point(aes(x=dataset$Level,y=dataset$Salary),colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = data.frame(Level=x.grid))), colour='blue')+
  ggtitle('Truth or Bluff (Regression Model)')+
  xlab('Level')+
  ylab('Salary')


