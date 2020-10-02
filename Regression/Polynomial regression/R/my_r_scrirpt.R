dataset=read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

lin_reg=lm(formula=Salary~.,data=dataset)
summary(lin_reg)
dataset$level2=dataset$Level^2
dataset$level3=dataset$Level^3
dataset$level4=dataset$Level^4
poly_reg=lm(formula = Salary~.,data=dataset)
summary(poly_reg)
library('ggplot2')
ggplot()+geom_point(aes(x=dataset$Level,y=dataset$Salary),colour='red')+
geom_line(aes(x=dataset$Level,y=predict(lin_reg,newdata = dataset)), colour='blue')+
ggtitle('Truth or Bluff (Linear Regression)')+
xlab('Level')+
ylab('Salary')
x_grid=seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+geom_point(aes(x=dataset$Level,y=dataset$Salary),colour='red')+
  geom_line(aes(x=x_grid,y=predict(poly_reg,
                                          newdata = data.frame(Level=x_grid,
                                                               level2=x_grid^2,
                                                               level3=x_grid^3,
                                                               level4=x_grid^4))),
            colour='blue')+
  ggtitle('Truth or Bluff (Polynomial Regression)')+
  xlab('Level')+
  ylab('Salary')

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             level2 = x_grid^2,
                                                             level3 = x_grid^3,
                                                             level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')


predict(lin_reg,data.frame(Level=6.5))

predict(poly_reg,data.frame(Level=6.5,
                            level2=6.5^2,
                            level3=6.5^3,
                            level4=6.5^4))
