# Data Wrangling Exercises
# Topics: Filtering, Arranging, Selecting, Mutating, Summarising, Grouping and Working with Factors


## Data Import and Filtering

library(tidyverse)
library(readxl)

ima<-read_excel("Example-02 for data wrangling.xlsx")
view(ima)

# Select observations from the year 1970
ima_1970<-filter(ima, year==1970)
view(ima_1970)

# Select observatons from Lawes
ima_locate<-filter(ima, loc=="Lawes")
view(ima_locate)

# Select Lawes observations with yield greater than 3.2
ima_multiple<-filter(ima, yield>3.2, loc=="Lawes")
view(ima_multiple)

# Filtering Multiple Locations
filter(example02, loc == "Lawes" | loc == "Brookstead")


##Practical A

library(readr)

example02 <-read.csv("Example-02 for data wrangling.csv")
view(example02)

# Select observations from Nambour and Redland Bay
example02_location <-filter(example02, loc=="Nambour" | loc=="RedlandBay")
view(example02_location)

# Select G01, G57 and G58 from the 1970 trials
example02_genotype <- filter(
  example02, gen == "G01" | gen == "G57" | gen == "G58", year == 1970)
view(example02_genotype)

# Select Lawes observations with yield between 2 and 3 
# and oil greater than 22
example02_locyield <- filter(
  example02, loc == "Lawes", yield >= 2 & yield <= 3, oil > 22)
view(example02_locyield)


## Arranging Data

# Arrange by year, location and genotype
example02_arr<-arrange(example02, year, loc, gen)
view(example02_arr)

# Arrange yield from highest to lowest
example02_des<-arrange(example02, desc(yield))
view(example02_des)

## Selecting Variables

# Select key variables
example02_short<-select(example02, loc, year, gen, yield, height)
view(example02_short)

# Move year to the first column
example02_select<-select(example02, year, everything())
view(example02_select)

# Creating a new variable

# Convert yield to kg/ha
example02_mut <- mutate(example02_short, yield_kg_ha = yield * 1000)
view(example02_mut)


## Summarising Data


# Calculate the overall mean yield 
example02_arize<-summarize(example02, yield_all = mean(yield, na.rm = TRUE))
view(example02_arize)


## Grouping and Summarising 

# Calculate mean yield by location
by_location <-group_by(example02, loc)
summarise(by_location, yield_location = mean(yield, na.rm = TRUE))
example02 %>% group_by(loc) %>% summarise(yield_location = mean(yield, na.rm = TRUE))
example02 %>% group_by(loc) %>% summarise(yield_location = mean(yield, na.rm = TRUE))

# Count observations by location
example02 %>% group_by(loc) %>% summarise(n = n())


## Working with Factors

example02$env <-as.factor(example02$env)
view(example02$env)


as.numeric(example02$env)

example02$loc <-as.factor(example02$loc)
example02$gen <-as.factor(example02$gen)

levels(example02$loc)
nlevels(example02$loc)


##Practical B


example03<-read_excel("Example-03.xlsx")
view(example03)

# Number of observations by location
example03 %>% group_by(loc) %>% summarise(n = n())

# Count numeric and non-numeric variables
example03 %>% summarise(numeric = sum(sapply(., is.numeric)),non_numeric = sum(!sapply(., is.numeric)))


# Convert location and genotype to factors 
example03$loc <-as.factor(example03$loc)
example03$gen <-as.factor(example03$gen)


# Number of observations by location and genotype
example03 %>% group_by(loc) %>% summarise(n = n())
example03 %>% group_by(gen) %>% summarise(n = n())

# Displaying the levels of location and genotype
levels(example03$loc)
levels(example03$gen)

# Display observations where the yield is less than 150
filter(example03, yield < 150)


# Mean of ear height by genotype, from highest to lowest
example03 %>% group_by(gen) %>% summarise(mean_earht = mean(earht, na.rm = TRUE)) %>% arrange(desc(mean_earht))


# Select variables and create a new flowering variable
example03.short <- example03 %>% select(loc, gen, yield, flower) %>% mutate(flower_new = flower - 10)


##Practical C


exampel02<-read.csv2("practical c.csv")

# Number of observations by year and location
example02 %>% group_by(year, loc) %>% summarise(n = n())


# Summary statistics for size by location and year
example02 %>% group_by(loc, year) %>% summarise(n = n(), min_size = min(size, na.rm = TRUE), max_size = max(size, na.rm = TRUE), mean_size = mean(size, na.rm = TRUE), var_size = var(size, na.rm = TRUE), sd_size = sd(size, na.rm = TRUE))


# Select Brookstead observations based on oil and lodging,
# then arrange height from highest to lowest
example02 %>% filter(oil > 20, lodging < 3, loc == "Brookstead") %>% arrange(desc(height))







