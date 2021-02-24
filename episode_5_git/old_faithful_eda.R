library(tidyverse)

# load dataset
df <- faithful

# summary stats
summary(df)

# histograms
hist(df$eruptions)
hist(df$waiting)

# scatterplot
plot(df)


### modelling

library(Rmixmod)
# mixmodCluster fits a Gaussian mixture model
# nbCluster is the number of mixture components. 
mod1 <- mixmodCluster(faithful, nbCluster=1, criterion="ICL")
summary(mod1)

mod1@bestResult@criterionValue

mod2 <- mixmodCluster(faithful, nbCluster=2, criterion="ICL")
summary(mod2)

mod2@bestResult@criterionValue

mod3 <- mixmodCluster(faithful, nbCluster=3, criterion="ICL")
summary(mod3)

mod3@bestResult@criterionValue

nos<-vector()
values<-vector()
for (i in 1:10){
  print(i)
  mod<-mixmodCluster(faithful, nbCluster=i, criterion="ICL")
  value<-mod@bestResult@criterionValue
  nos<-c(nos, i)
  values<-c(values, value)
}
mods<-data.frame(nos, values)

plot(mods)
str(mods)

plot(mod1)

plot(mod2)

plot(mod3)
