# Basic plotting in R
# Plot multiple panels in one plot
par(mfrow = c(3, 1))
layout(matrix(c(1, 1, 2, 3), nrow = 2, byrow = TRUE))

# Histogram of Blood Pressure
hist(bp_data$BloodPressure, main="Blood Pressure Distribution",
     xlab="Blood Pressure", col="lightblue")

# Boxplot of BP by Gender
boxplot(BloodPressure ~ Gender, data=bp_data,
        main="BP by Gender", xlab="Gender", ylab="Blood Pressure")

# Scatterplot Age vs BP
plot(bp_data$Age, bp_data$BloodPressure,
     main="Age vs Blood Pressure", xlab="Age", ylab="BP")


# ggplot2

# example syntax 
#ggplot(data, aes(x, y)) + geom_*()

library(ggplot2)
# Scatterplot: Age vs Blood Pressure
ggplot(bp_data, aes(x=Age, y=BloodPressure)) +
  geom_point()

# boxplot
ggplot(bp_data, aes(x=Group, y=BloodPressure)) +
  geom_boxplot()


# Customizing ggplot2
ggplot(bp_data, aes(x = Age, y = BloodPressure)) +
  geom_point(color = "blue") +
  labs(
    title = "Age vs Blood Pressure",
    x = "Patient Age",
    y = "BP (mmHg)"
  ) +
  theme_minimal() 

# Save last plot as PNG
ggsave("Age_BP_Scatter.png", width=6, height=4)

# Save specific plot object
p <- ggplot(bp_data, aes(x=Age, y=BloodPressure)) +
  geom_point()
ggsave("data/scatter_plot.png", plot=p)

