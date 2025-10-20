#Hands on Day1 Mod1B

# Task 1
# Patients younger than 20
subset(ALL_df, age < 20)

# Task 2
# Age and Sex for patients with BT = "B2"
subset(ALL_df, BT == "B2", select = c(age, sex))

# Task 3
# Male patients older than 40
subset(ALL_df, sex == "M" & age > 40)

# Female OR Relapse = Yes
subset(ALL_df, sex == "F" | relapse == T)

# Mini-Challenge
# Male + Relapse + Age > 30
subset(ALL_df, sex == "M" & relapse == T & age > 30)

#OR
ALL_df[ALL_df$sex == "M" & ALL_df$relapse == T & ALL_df$age > 30, ]
