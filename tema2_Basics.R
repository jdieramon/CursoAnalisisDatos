## ========================================================================
## Chapter 2. Fundamentos Basicos de R (I)
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
colors = as.numeric(ChickWeight$Diet)
points(mydata$weight ~ jitter(as.numeric(mydata$Diet)), 
       col= alpha(colors, 0.4),
       pch=19) 
