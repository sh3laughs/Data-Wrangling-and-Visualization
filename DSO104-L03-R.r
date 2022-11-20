# DSO104 - Data Wrangling and Visualization
  # Lesson 3 - Dealing with Missing or Incorrect Data Types

# Page 1 - Introduction
# From workshop - https://vimeo.com/449951217

# load potentially relevant packages
library(dplyr)
library(tidyr)

  # import data
glassdoor = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 3: Dealing with Missing or Incorrect Data Types/glassdoor.csv')

View(glassdoor)
# 12 columns, 900 rows


  # Recode 'State' into a new column

  # unique function to find unique values for the variable
unique(glassdoor$State)
# printed: [1] "NY" "NJ"
  # only New York and New Jersey are in these data

  # testing unique function a bit more
unique(glassdoor)
# printed unique values for all variables, which is too much to digest

unique(factor(glassdoor))
# printed a disasterous mess, with warning:
  # In xtfrm.data.frame(x) : cannot xtfrm data frames

unique(factor(glassdoor$State))
# printed:
  # [1] NY NJ
  # Levels: NJ NY


  # create a new, empty column
glassdoor$StateR = NA

glassdoor$StateR[glassdoor$State == 'NY'] = 0
glassdoor$StateR[glassdoor$State == 'NJ'] = 1

View(glassdoor)
# success! 13 columns, 900 rows


  # Recode City into the same variable
unique(glassdoor$City)
# printed:
  # [1] "New York"       "Rego Park"      "West New York"  "Williston Park"
  # [5] "Brooklyn"       "Maspeth"        "Paramus"        "West Orange"   
  # [9] "Staten Island"  "Lynbrook"       "Fort Lee"       "Jersey City"   
  # [13] "Bronx"          "Mamaroneck"

glassdoor$City[glassdoor$City == 'New York'] = 0
glassdoor$City[glassdoor$City == 'Rego Park'] = 1
glassdoor$City[glassdoor$City == 'West New York'] = 2
glassdoor$City[glassdoor$City == 'Williston Park'] = 3
glassdoor$City[glassdoor$City == 'Brooklyn'] = 4
glassdoor$City[glassdoor$City == 'Maspeth'] = 5
glassdoor$City[glassdoor$City == 'Paramus'] = 6
glassdoor$City[glassdoor$City == 'West Orange'] = 7
glassdoor$City[glassdoor$City == 'Staten Island'] = 8
glassdoor$City[glassdoor$City == 'Lynbrook'] = 9
glassdoor$City[glassdoor$City == 'Fort Lee'] = 10
glassdoor$City[glassdoor$City == 'Jersey City'] = 11
glassdoor$City[glassdoor$City == 'Bronx'] = 12
glassdoor$City[glassdoor$City == 'Mamaroneck'] = 13

unique(glassdoor$City)
# success! printed:
  # [1] "0"  "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12"
  # [14] "13"


  # Recode continuous data to categorical with Max_Salary variable
glassdoor$Max_SalaryR = ifelse(glassdoor$Max_Salary < 30000, 0,
                               ifelse(glassdoor$Max_Salary 
                                      <= 60000, 1, 2))

unique(glassdoor$Max_SalaryR)
# success! printed: [1] 0 2 1

  # double-check
View(glassdoor)
# visually comparing Max_Salary data with Max_SalaryR data confirms
  # this was successfully done



# Page 9 - Recoding into a New Variable in R

  # import data
superheroes = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 3: Dealing with Missing or Incorrect Data Types/superheroes.csv')

View(superheroes)
# 11 columns, 734 rows


  # Recode Gender into a new variable
unique(superheroes$Gender)
# printed: [1] "Male"   "Female" "-"

superheroes$GenderR = NA

superheroes$GenderR[superheroes$Gender == 'Male'] = 0
superheroes$GenderR[superheroes$Gender == 'Female'] = 1

unique(superheroes$GenderR)
# printed: [1]  0  1 NA



# Page 10 - Recoding into the Same Variable in R

  # Recode Gender into same variable
superheroes$Gender[superheroes$Gender == 'Male'] = 0
superheroes$Gender[superheroes$Gender == 'Female'] = 1

unique(superheroes$Gender)
# printed: [1] "0" "1" "-"
  # note: not sure why these are in quotes, when it wasn't when 
  # done in a new variable...

View(superheroes)
# data look right, so I'm not going to worry about the quotes...


  # Dummy code Alignment variable

  # install package
install.packages("fastDummies")
library(fastDummies)


superheroes = dummy_cols(superheroes, select_columns = 'Alignment')

View(superheroes)