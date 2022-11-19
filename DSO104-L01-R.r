# DSO104 - Data Wrangling and Visualization
  # Lesson 1 - Manipulating Columns and Rows

# Page 1 - Introduction

  # From workshop - https://vimeo.com/436301467

# load data and preview it
volcanoes = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 1: Data Wrangling and Visualization/volcanoes.csv')
View(volcanoes)
# data imported, saved, and previewed in separate tab

# load packages
library(dplyr)
install.packages("tidyr")
library(tidyr)
# installed tidyr since it was the first time using it

# add column
volcanoes$eruptionYN = "Y"
View(volcanoes)
# eruption column added to dataset, and dataset previewed in separate 
  # tab

# rename column
names(volcanoes)[names(volcanoes) == 'event_remarks'] <- 'Notes'
View(volcanoes)
# updated name of existing colum in existing dataset

# combine columns
volcanoes1 <- unite(volcanoes, NameType, volcano_name, event_type,
                    sep = ',')
View(volcanoes1)
# created a new variable with the volcanoes dataset, w/ 2 of its 
  # original columns merged into a single column

# re-split those columns
volcanoes2 <- separate(volcanoes1, NameType, c('Name', 'Type'),
                       sep = ',')
View(volcanoes2)
# created a new variable with the volcanoes1 dataset, to re-split the
  # columns that had been merged, and new variable previewed in 
  # sep. tab
  # note: splitting by comma didn't work, even though they were 
  # joined by comma, b/c the original data included commas


# subset data via indexing
volcanoes3 <- volcanoes2[1:2,] 
View(volcanoes3)
# new variable created with only 2 rows from the most recent version of
  # the dataset, and new variable previewed in sep. tab

# subset data by selecting columns
volcanoes4 <- volcanoes3 %>% select(Name,Type)
View(volcanoes4)
# new variable created with only 2 columns from the most recent 
  # version of the dataset, and new variable previewed in sep. tab



# Page 2 - Adding Columns in R
library(readxl)

babies = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 1: Data Wrangling and Visualization/babies.xlsx')
View(babies)
# loaded readxl package, imported dataset and saved it, then 
  # previewed in sep. tab

  # add column
babies$footprint = ''
View(babies)
# added new column to dataset, with no data, and confirmed via
  # previewing in sep. tab



# Page 4 - Renaming Columns in R
names(babies)[names(babies) == 'ParentPhoneNumber'] <- 'Phone'
View(babies)
# column renamed, as confirmed via previewing dataset in sep. tab



# Page 6 - Combining Columns in R
babies1 <- unite(babies, Address, StreetAddress, City, Zipcode,
                 sep = '/')
View(babies1)
# merged StreetAddress, City and Zipcode columns together into a new
  # Address column, in a new babies1 variable, as confirmed by
  # previewing the new variable in a sep. tab
  # note: the separate columns were replaced with the united one



# Page 7 - Separating Columns in R
babies2 <- separate(babies1, Address, c('StreetAddress', 'City', 
                                        'Zipcode'), sep = '/')
head(babies2)
# re-split Address column into separate StreetAddress, City and 
  # Zipcode columns in a new babies2 variable, as confirmed by 
  # previewing first few rows of dataset in tibble in console
  # note: the merged column was replaced with the separate ones


# Page 10 - Subsetting Data in R

  # using index
babies3 <- babies[1:5,1:3]
head(babies3)
# subset created with only 1st 5 rows and 3 columns of dataset, 
  # saved in new variable, and that variable previewed as tibble in
  # console
  
  # using column names
babyColumns <- c('Name', 'Birthday', 'ParentEmail')

babies4 <- babies[babyColumns]

head(babies4)
# subset created with only defined columns, and saved in new variable
  # then first 6 rows of that variable previewed as tibble in 
  # console