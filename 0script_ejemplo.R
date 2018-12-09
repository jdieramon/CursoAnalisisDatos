## ========================================================================
## Tema 1. Fundamentos Basicos de R
## ========================================================================

## Mi primer script
## -----------------------------------------------------------------------

# Load datasets library
library(datasets)

# Read data set 
mydata = ChickWeight

# Plot weight over diets
boxplot(mydata$weight ~ mydata$Diet, 
        xlab = "Diet", ylab = "chick weight (g)")


# Overlay points
boxplot(mydata$weight ~ mydata$Diet, 
        xlab = "Diet", ylab = "chick weight (g)")
colors = as.numeric(ChickWeight$Diet)
points(mydata$weight ~ jitter(as.numeric(mydata$Diet)), 
       col= adjustcolor(colors, alpha.f = 0.4),
       pch=19) 


