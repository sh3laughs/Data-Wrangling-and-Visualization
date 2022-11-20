# DSO104 - Data Wrangling and Visualization
  # Lesson 3 - Dealing with Missing or Incorrect Data Types
  # Page 13 - [Practice] Hands-On

# Requirements
  # You are working for a global chocolate company, and they've 
  # collected data on worldwide eating habits. Their eventual goal 
  # is to determine the demographics for chocolate-eaters worldwide. 
  # Which countries are most likely to consume chocolate? Which 
  # gender, and which age group? Someone else will run these analyses, 
  # but it is your job to wrangle and recode the data in preparation.

# import packages and data
library(dplyr)
library(tidyr)
library(fastDummies)

eatingHabits = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 3: Dealing with Missing or Incorrect Data Types/Eating_Habits.csv')

View(eatingHabits)
# 18 columns, 20,400 rows

# Part 2: Recoding in R
  # Please perform the following tasks in R:
    # Recode Activity into a new variable called JunkFood. Anything 
      # that you would consider junk food, recode as a 1. Everything 
      # else should be recoded as a zero.

  # check values for Activity
unique(eatingHabits$Activity)
# printed:
  # [1] "Eating fruit"                                         
  # [2] "Eating raw vegetables"                                
  # [3] "Eating candy, chocolate bars"                         
  # [4] "Eating potato chips, crisps"                          
  # [5] "Eating french fries"                                  
  # [6] "Eating hamburgers, hot dogs or sausages"              
  # [7] "Eating peanuts"                                       
  # [8] "Eating whole wheat or rye bread"                      
  # [9] "Drinking soft drinks, cola or other drinks with sugar"
  # [10] "Drinking coffee"                                      
  # [11] "Drinking low fat milk"                                
  # [12] "Drinking whole milk"    

  # create an empty variable, then fill it with recoded values
eatingHabits$JunkFood < NA

eatingHabits$JunkFood[eatingHabits$Activity == 'Eating fruit'] = 0
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Eating raw vegetables'] = 0
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Eating candy, chocolate bars'] = 1
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Eating potato chips, crisps'] = 1
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Eating french fries'] = 1
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Eating hamburgers, hot dogs or sausages'] = 1
eatingHabits$JunkFood[eatingHabits$Activity == 'Eating peanuts'] = 0
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Eating whole wheat or rye bread'] = 0
eatingHabits$JunkFood[eatingHabits$Activity == 
                        'Drinking soft drinks, 
                        cola or other drinks with sugar'] = 1
eatingHabits$JunkFood[eatingHabits$Activity == 'Drinking coffee'] = 0
eatingHabits$JunkFood[eatingHabits$Activity == 'Eating Fruit'] = 0

unique(eatingHabits$JunkFood)
# success! printed: [1]  0  1 NA


    # Recode Sex from text to numbers in the same variable

  # check values for Sex
unique(eatingHabits$Sex)
# printed: [1] "Males"   "Females"

eatingHabits$Sex[eatingHabits$Sex == 'Males'] = 0
eatingHabits$Sex[eatingHabits$Sex == 'Females'] = 1

unique(eatingHabits$Sex)
# success! printed: [1] "0" "1"

  # NOT part of actual requirements, but practicing this here, as 
    # with Python requirements
  # Dummy code the Age group variable

# check values for Age group
unique(eatingHabits$Age.group)
# printed: [1] "11 years" "13 years" "15 years"

# dummy_cols function to created new dummy columns AND add them to
  # existing dataset
eatingHabitsAgeDummy = dummy_cols(eatingHabits, 
                              select_columns = 'Age.group')

View(eatingHabitsAgeDummy)
# success! 22 columns, 20,400 rows