# Read data in to R
# read CSV - base functions
bp <- read.csv2("Desktop/R/data/BloodPressure_Data.csv") # no sepqration
# take a quick look at the data
head(bp)

bp <- read.csv2("Desktop/R/data/BloodPressure_Data.csv", sep = ",") # no sepqration
# take another look at the data
head(bp)
str(bp)

# readr functions
library(readr)

# Read the CSV file
bp_data <- read_csv("Desktop/R/data/BloodPressure_Data.csv")

# Take a quick look at the data
head(bp_data)
str(bp_data)

# Work with date
library(readr)
library("lubridate")

# read ALL data
bp <-  read.csv2("Desktop/R/data/BloodPressure_wDates.csv", sep = ",")

# Convert date column and extract year
bp$Date <- ymd(bp$Date)
bp$Year <- year(bp$Date)

# Filtering blood pressure patients by year and gender
subset(bp, Year == 2003 & Gender == "f")


# Conditions and loops
# If {} else {} statement 
if (condition) {
  # code if TRUE
} else {
  # code if FALSE
}

# If else example
age <- 55
if (age > 50) {
  print("Older patient")
} else {
  print("Younger patient")
}


# If {} else if {} else statement 

if (condition1) {
  # code if condition1 is TRUE
} else if (condition2) {
  # code if condition2 is TRUE
} else {
  # code if none are TRUE
}

# If else if example
age <- 35

if (age < 18) {
  print("Child")
} else if (age >= 18 & age < 60) {
  print("Adult")
} else {
  print("Senior")
}


# for loops
for (i in 1:5) {
  print(i)
}

# for loop example
patients <- c("P1", "P2", "P3")
for (p in patients) {
  print(paste("Processing:", p))
}

# the apply () family vs. loops
# Using a for loop
m <- matrix(1:9, nrow=3)
row_sums <- c()
for (i in 1:nrow(m)) {
  row_sums[i] <- sum(m[i, ])
}

# Using apply()
row_sums2 <- apply(m, 1, sum)


# the apply() family
# apply()
apply(m, 1, sum)   # row sums
apply(m, 2, mean)  # column means

# lapply()
lapply(list(1:3, 4:6), mean)

# sapply()
sapply(list(1:3, 4:6), mean)

# lapply()
lapply(list(1:3, 4:6), mean)

# tapply()
ages <- c(21, 25, 30, 40, 35)
gender <- c("M", "M", "F", "F", "M")
tapply(ages, gender, mean)   # mean age by gender


# mapply()
nums1 <- 1:5
nums2 <- 6:10
mapply(sum, nums1, nums2)   # adds 1+6, 2+7, … 5+10



