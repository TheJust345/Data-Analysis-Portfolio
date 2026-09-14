# R Basics Exercises
# Topics: Vectors, Sequences, Repetition, and Data Import
## 1 Create an object named v1 that receives the following numbers

#1 Creating the object v1
v1 <- c(1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6, 3.8, 4)

# 1.1 To view the content of v1
v1

# 1.2 This can also be written with the short command
v1 <- seq(1, 4, by = 0.2)

# 2 What does the following command do?

c(rep(1, 5), rep(2, 10))

# 2.1 It creates a single vector containing the number 1 repeated 5 times and the number 2 repeated 10 times. Generally, this command uses the c() function to combine multiple separate vectors into a single, unified vector.

## 3 Generate the following sequence: 1 2 3 4 5 1 2 3 4 5

# 3.1 
rep(seq(from = 1, to = 5, by = 1), times = 2)

# 3.2 This can also be generated using 
seq(from = 0, to = 9) %% 5 + 1

# 3.2.1 This can also be written shortly as 
(0:9) %% 5 + 1

#Importing a CSV dataset
library(tidyverse)
library(readr)

my_data <- read.csv("C:/Users/DELL PC/Desktop/example1 data.csv.csv")

view(my_data)
str(my_data)
dim(my_data)
