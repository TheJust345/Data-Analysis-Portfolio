# Data Visualization and Linear Regression
# Data visualization, exploratory analysis, correlation,
# and linear regression using agricultural datasets


## Data Visualization: Soybean Data

library(tidyverse)
library(readxl)

dat <- read_csv("australia.soybean.csv")
str(dat)

dat$year <- as.factor(dat$year)
dat

# Scatter plot of oil content and soybean yield
ggplot(dat) + aes(x = oil, y = yield) + geom_point()

# Add titles and axis labels
p <- ggplot(dat) + aes(x = oil, y = yield) + geom_point()

p <- p + labs(title = "Soybeans, Yield and Oil in Australia", subtitle = "Period 1970-1971", caption = "Data: agridat::Australia.soybean", x = "Oil (%)", y = "Yield (metric tons/hectare)")

p

# Display observations by environment
p <- ggplot(dat) + aes(x = oil, y = yield, color = env) + geom_point()

p <- p + labs(title = "Soybeans, Yield and Oil in Australia", subtitle = "Period 1970-1971", caption = "Data: agridat::Australia.soybean", x = "Oil (%)", y = "Yield (metric tons/hectare)")

p <- p + scale_color_discrete(name = "Environment")

p


## Visualizing Protein Content

p <- ggplot(dat) + aes(x = oil, y = yield, color = env, size = protein) + geom_point()

p <- p +
  labs(title = "Soybeans, Yield and Oil in Australia", subtitle = "Period 1970-1971", caption = "Data: agridat::Australia.soybean", x = "Oil (%)", y = "Yield (metric tons/hectare)")

p <- p + scale_color_discrete(name = "Environment") + scale_size_continuous("Protein") + theme_bw()

p


## Adding a Regression Trend

p <- ggplot(dat) + aes(x = oil, y = yield) + geom_point() + geom_smooth()

p <- p + labs(title = "Soybeans, Yield and Oil in Australia", subtitle = "Period 1970-1971", caption = "Data: agridat::Australia.soybean", x = "Oil (%)", y = "Yield (metric tons/hectare)")

p <- p + theme_gray()

p


## Practical A: Soybean Visualization

my <- read_csv("australia.soybeanB.csv")
str(my)
is_tibble(my)

# Relationship between oil and protein
p <- ggplot(my) + aes(x = oil, y = protein, color = loc) + geom_point()

p

# Display protein values using colour and triangle-shaped points
p <- ggplot(my) + aes(x = oil, y = protein, color = protein) + geom_point(shape = 17)

p <- p + labs(title = "Relationship Between Oil and Protein", subtitle = "Soybean varieties across locations in Australia", caption = "Data: agridat::Australia.soybean", x = "Oil (%)", y = "Protein (%)")

p

# Display the relationship separately for each location
p <- p + facet_wrap(. ~ loc)

p


## Line, Histogram and Density Plots

p <- ggplot(my) + aes(x = oil, y = protein) + geom_line()

p <- p + theme_classic()

p


# Histogram of yield
p <- ggplot(my) + aes(x = yield) + geom_histogram()

p <- p + theme_classic()

p


# Density plot of yield
p <- ggplot(my) + aes(x = yield) + geom_density()

p <- p + theme_classic()

p


# Histogram and density plot together
p <- ggplot(dat) + aes(x = yield, y = ..density..) + geom_histogram() + geom_density()

p <- p + theme_classic()

p


# Yield density by environment
p <- ggplot(my) + aes(x = yield, color = env, fill = env) + geom_density(alpha = 0.25)

p <- p + scale_fill_discrete(name = "Environment") + guides(color = "none") + theme_classic()

p


## Boxplots

# Overall distribution of yield
p <- ggplot(dat) + aes(x = "", y = yield) + geom_boxplot()

p


# Distribution of yield by environment
p <- ggplot(dat) + aes(x = env, y = yield, fill = env) + geom_boxplot()

p <- p + labs(x = "", y = "Yield (metric tons/hectare)") + guides(fill = "none") + theme_classic()

p


## Bar Charts

# Count of observations by lodging level
p <- ggplot(dat) + aes(x = lodging) + geom_bar()

p <- p + labs(x = "Lodging", y = "Count") + theme_classic()

p


# Lodging levels by year
p <- ggplot(dat) + aes(x = lodging, fill = year) + geom_bar(position = "dodge")

p <- p + labs(x = "Lodging", y = "Count") + scale_fill_discrete(name = "Year")

p


## Mean Yield by Environment

dat_env <- dat %>% group_by(env) %>% summarize(myield = mean(yield, na.rm = TRUE)) %>% ungroup()

head(dat_env, 4)

p <- ggplot(dat_env) + aes(x = env, y = myield) + geom_bar(stat = "identity")

p <- p + labs(x = "Environment", y = "Soybean Yield (metric tons/hectare)") + theme_classic()

p


## Practical B: Corn Data Visualization

abasi <- read_csv("ars.earlywhitecorn96.csv")
abasi
is_tibble(abasi)

# Relationship between ear height and yield by location
p <- ggplot(abasi) + aes(x = earht, y = yield, color = loc) + geom_point()

p <- p + labs(title = "Relationship Between Ear Height and Yield by Location", subtitle = "Examining how ear height is associated with corn yield", x = "Ear Height", y = "Yield", caption = "Data: ars.earlywhitecorn96", color = "Location")

p


# Distribution of yield by location
p <- ggplot(abasi) + aes(x = yield) + geom_histogram(aes(y = ..density..)) + geom_density() + facet_wrap(~loc)

p <- p + labs(title = "Distribution of Yield by Location", subtitle = "Histogram and density of yield across different locations", x = "Yield", y = "Density", caption = "Data: ars.earlywhitecorn96")

p


# Boxplot of yield by location
p <- ggplot(abasi) + aes(x = loc, y = yield, fill = loc) + geom_boxplot()

p <- p + labs(title = "Distribution of Yield by Location", subtitle = "Comparing yield across different locations", x = "Location", y = "Yield", caption = "Data: ars.earlywhitecorn96", fill = "Location")

p


## Practical C: Iris Data

iris_data <- read_excel("iris.xlsx")
iris_data

# Summary statistics for Sepal Length by species
summary_table <- iris_data %>% group_by(Species) %>% summarise(Mean = mean(Sepal.Length, na.rm = TRUE), Standard_Deviation = sd(Sepal.Length, na.rm = TRUE), Variance = var(Sepal.Length, na.rm = TRUE), number = n())

summary_table


# Regression lines for each species
p <- ggplot(iris_data) + aes(x = Sepal.Length, y = Sepal.Width, color = Species) + geom_point() + geom_smooth(method = "lm")

p


# Boxplot of Sepal Width by species
p <- ggplot(iris_data) + aes(x = Species, y = Sepal.Width, fill = Species) + geom_boxplot()

p <- p + labs(title = "Boxplot of Sepal Width by Species", x = "Species", y = "Sepal Width")

p


## Linear Regression: Barley Data

steptoe <- read.csv("steptoe.morex.pheno.csv")
steptoe

# Check the data type
is_tibble(steptoe)

# Convert the data frame to a tibble
steptoe <- as_tibble(steptoe)
is_tibble(steptoe)


## Correlation Analysis

cor(steptoe$amylase, steptoe$yield, use = "complete.obs")
cor(steptoe$diapow, steptoe$yield, use = "complete.obs")
cor(steptoe$hddate, steptoe$yield, use = "complete.obs")
cor(steptoe$lodging, steptoe$yield, use = "complete.obs")
cor(steptoe$malt, steptoe$yield, use = "complete.obs")
cor(steptoe$height, steptoe$yield, use = "complete.obs")
cor(steptoe$protein, steptoe$yield, use = "complete.obs")


## Simple Linear Regression

# Visualize the relationship between height and yield
ggplot(steptoe) + aes(x = height, y = yield) + geom_point() + geom_smooth(method = "lm", se = FALSE)

# Fit a simple linear regression model
model <- lm(yield ~ height, data = steptoe)
summary(model)

# Regression equation:
# Yield = 2.228942 + 0.032284(Height) + error

ggplot(steptoe) + aes(x = height, y = yield) + geom_point() + geom_smooth(method = "lm")


## Multiple Linear Regression

# Add amylase as a second predictor
modeladd <- lm(yield ~ height + amylase, data = steptoe)
summary(modeladd)

# Regression equation:
# Yield = 3.673050 + 0.030626(Height) - 0.043539(Amylase) + error