# ggplot hands on tasks
library(lubridate)
library(ggplot2)
library(patchwork)

# Load data
bp_data <- read.csv2("data/BloodPressure_wDates.csv", sep = ",")

# Get the year in a new column
bp_data$Year <- year(bp_data$Date)

# ggplot hands on tasks
# 1. Bar plot: patient counts per group
ggplot(bp_data, aes(x=Group)) +
  geom_bar(fill="steelblue") +
  labs(title="Number of Patients per Group", x="Group", y="Count")

# 2. Histogram: Age distribution
ggplot(bp_data, aes(x=as.numeric(Age)))  +
  geom_histogram(binwidth=5, fill="lightgreen", color="black") +
  labs(title="Age Distribution of Patients", x="Age", y="Frequency")

# 3. Scatterplot: Age vs BloodPressure, colored by Group
ggplot(bp_data, aes(x=Age, y=BloodPressure, color=Group)) +
  geom_point() +
  labs(title="Age vs Blood Pressure by Group", 
       x="Age", y="Blood Pressure")



# Bonus hands on
library(ggplot2)
library(patchwork)   # install.packages("patchwork") if needed

# 1. Bar plot
p1 <- ggplot(bp_data, aes(x = Gender, y = BloodPressure, fill = Gender)) +
  stat_summary(fun = "mean", geom = "bar") +
  labs(title = "Average BP by Gender") +
  theme_minimal()

# 2. Histogram
p2 <- ggplot(bp_data, aes(x=as.numeric(Age)))  +
  geom_histogram(binwidth=5, fill="lightgreen", color="black") +
  labs(title="Age Distribution of Patients", x="Age", y="Frequency")

# 3. Boxplot
p3 <- ggplot(bp_data, aes(x = Group, y = BloodPressure, fill = Group)) +
  geom_boxplot() +
  labs(title = "BP by Group") +
  theme_minimal()

# Combine plots into one figure
# horizontal layout
(p1 | p2 | p3)   

# vertical layout
(p1 / p2 / p3)   

# 2x2 grid
(p1 | p2) / p3
