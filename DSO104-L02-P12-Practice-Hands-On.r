# DSO104 - Data Wrangling and Visualization
  # Lesson 2 - Data Transformations

# Page 12 - Practice Hands-On
  # For this data exercise, you will be putting your data combination 
  # knowledge into practice! Below you’ll find links to two different 
  # data sets about the Zika virus outbreak. The first, 
  # “ZikaColombia” has information about the outbreak in Colombia, 
  # while the second, “ZikaUS” has information about Zika in the U.S.
    # https://repo.exeterlms.com/documents/V2/DataScience/Data-Wrang-Visual/ZikaColombia.zip
    # https://repo.exeterlms.com/documents/V2/DataScience/Data-Wrang-Visual/ZikaUS.zip

# import data
ZikaColombia = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/ZikaColombia.xlsx')
View(ZikaColombia)
# dataset imported and saved as a new variable, and previewed in 
  # separate tab
  # 2 columns, 1,155 rows

ZikaUS = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/ZikaUS.xlsx')
View(ZikaUS)
# dataset imported and saved as a new variable, and previewed in 
# separate tab
# 2 columns, 54 rows

# load libraries
library(dplyr)
library(tidyr)


# It’s your job to combine them into one dataset in R, so that these 
  # two countries can be analyzed together.
  # 1. Should you use the merge or append function?
      # Merge
      # Append
str(ZikaColombia)
# column names:
  # location
  # zika_total

str(ZikaUS)
# column names:
  # location
  # zika_total

# B/c the column names are the same AND the there is no ID style
  # variable, I'll append

  # 2. Perform your chosen function on the dataset
Zika = rbind(ZikaColombia, ZikaUS)
View(Zika)
# 2 columns, 1,209 rows
