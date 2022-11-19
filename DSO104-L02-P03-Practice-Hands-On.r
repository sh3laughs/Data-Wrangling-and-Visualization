# DSO104 - Data Wrangling and Visualization
  # Lesson 2 - Data Transformations
  # Page 3 - Practice Hands-On

# Here is a dataset on household energy consumption in the U.S:
  # https://repo.exeterlms.com/documents/V2/DataScience/Data-Wrang-Visual/energy.zip
# Give data transformations a shot on your own in R!

# load libraries
library(dplyr)
library(tidyr)
library(readxl)

# import data
energy = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/energy.xlsx')
View(energy)
# dataset imported and saved as a new variable, and previewed in 
  # separate tab
  # 9 columns, 27 rows

# transpose dataset
energy1 = t(energy)
View(energy1)
# dataframe transposed, saved to new variable,  and previewed in 
  # separate tab
  # 27 columns, 9 rows

# as.data.frame() function to convert to dataframe
energy2 = as.data.frame(energy1)
View(energy2)
# matrix converted to dataframe

# gsub() function to rename columns
names(energy2) = gsub('V', 'Year', names(energy2))
head(energy2)
# column names updated and previewed in console
