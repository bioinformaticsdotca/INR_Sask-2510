# Install BioconductoT packages
install.packages("BiocManager")
library(BiocManager)
# install the ALL package
BiocManager::install("ALL")
library("ALL")

# View patient metadata
data("ALL")
df2 <- pData(ALL)

# Quick summary
#summary(pData(ALL)[, c("age", "sex", "BT", "relapse")])
summary(df2[, c("age", "sex", "BT", "relapse")])

# str() and dim() functions
dim(df2)
str(df2)

# the table() function

af <- table(df2$age)
barplot(af, main = "Age frec.")

# mean and median age
mn <- mean(df2$age) # this will return NA
md <- median(df2$age) # this will return NA

mn <- mean(df2$age, na.rm = TRUE) # this will work
md <- median(df2$age, na.rm = TRUE) # this will work


# standard deviation and variance
std <- sd(df2$age, na.rm = TRUE)
vr <- var(df2$age, na.rm = TRUE)

# Extremes
mxx <- max(df2$age, na.rm = T)
mnn <- min(df2$age, na.rm = T)

# Table and (Frequency)
age_dit <- table(df2$age)

# Quick summary
summary(df2[, c("age", "sex", "BT", "relapse")])

# Patients older than 40
older_patients <- subset(df2, age > 40)

# Patients who relapsed
relapsed_patients <- subset(df2, relapse == TRUE)

# Subsetting and Filtering
# subset()
subset(df2, age > 40 & relapse == TRUE)

# Indexing with [
df2[df2$age > 40, ]                # filter rows
df2[df2$age > 40 & df2$relapse, ]   # multiple conditions (same as df$Relapse == T)
df2[, c("age", "BT")]             # select columns
df <- df2[df2$sex == "F", ] # female patients only (#Assignment with condition)

# with()
dfrt2 <- with(df2, df2[age > 40 & relapse == TRUE, ]) #for cleaner syntax
df2[which(df2$age > 40 & df2$relapse == TRUE), ] # more cleanr syntax

#match() / %in% (matching values)
dfrt <- df2[df2$BT %in% c("B2", "B3"), ]

# Logical indexing directly
df2[df2$relapse == F | df2$sex == "F", ]

