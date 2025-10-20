# Module 1A - Examples
# Create 2 numeric variables and assigne values for each
x = 10
y = 6

# Calculate the sum of them
total = x + y

# Calculate the square root of the total
sr = sqrt(total)

# Data Structures 
# Vector
v <- c(1,2,3,4)
#Matrix
m <- matrix(1:6, nrow = 2)
#Dataframe
df <- data.frame(age=c(25,30), name=c("Mo","Tom"), group=c("A", "B"))
#List
lst <- list(numbers=v, info=df)

# Install BioconductoT packages
install.packages("BiocManager")
library(BiocManager)
BiocManager::install("ALL")
library("ALL")
data(ALL)
