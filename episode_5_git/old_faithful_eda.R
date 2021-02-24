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
