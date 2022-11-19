# DSO104 - Data Wrangling and Visualization
  # Lesson 1 - Manipulating Columns and Rows

# Page 2 - Data Transposition in R

# import data
tea = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/tea.csv')
View(tea)
# dataset imported and saved as a new variable, and previewed in 
  # separate tab
  # 4 columns, 13 rows

# load libraries
library(dplyr)
library(tidyr)

# transpose tea dataset
tea1 = t(tea)
View(tea1)
# dataframe transposed, saved to new variable,  and previewed in 
  # separate tab, according to lesson, this new variable is a matrix..
  # 13 columns, 4 rows

  # class() function to confirm data type
class(tea1)
# in console: [1] "matrix" "array"

  # as.data.frame() function to convert to dataframe
tea2 = as.data.frame(tea1)
View(tea2)
# matrix converted to dataframe - honestly..I can't tell the diff...
  # update - matrix is treated as a single variable / dataframe is
  # treated as a variable containing 13 variables (one per column)

class(tea2)
# in console: [1] "data.frame"

  # gsub() function to rename columns
names(tea2) = gsub('V', 'Year', names(tea2))
head(tea2)
# column names updated and previewed in console


# Page 10 - Joining Datasets in R

  # import and preview data
judgesAspectsUnique = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/judgesAspectsUnique.xlsx')
View(judgesAspectsUnique)
# table imported and previewed in sep. tab
  # 12 columns, 250 rows

performances = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/performances.xlsx')
View(performances)
# table imported and previewed in sep. tab
  # 11 columns, 250 rows


  # merge() function to join tables
  # inner join
iceSkating1 = merge(performances, judgesAspectsUnique, 
                    by = c('performance_id'))
View(iceSkating1)
# tables inner joined and previewed in sep. tab
  # 22 columns, 250 rows

  # str() function to view columns and other info for merged data
str(iceSkating1)
# info viewed in console


  # outer join
iceSkating2 = merge(performances, judgesAspectsUnique,
                    by = 'performance_id', all = TRUE)
View(iceSkating2)
# tables outer joined and previewed in sep. tab
  # 22 columns, 250 rows


  # testing left outer join
iceSkating3 = merge(performances, judgesAspectsUnique,
                    by = 'performance_id', performances = TRUE)
View(iceSkating3)
# tables left outer joined and previewed in sep. tab
  # 22 columns, 250 rows

iceSkating4 = merge(performances, judgesAspectsUnique,
                    by = 'performance_id', all.x = TRUE)
View(iceSkating4)
# tables left outer joined and previewed in sep. tab
  # 22 columns, 250 rows


# testing right outer join
iceSkating5 = merge(performances, judgesAspectsUnique,
                    by = 'performance_id', judgesAspectsUnique = TRUE)
View(iceSkating5)
# tables left outer joined and previewed in sep. tab
  # 22 columns, 250 rows

iceSkating6 = merge(performances, judgesAspectsUnique,
                    by = 'performance_id', all.y = TRUE)
View(iceSkating6)
# tables left outer joined and previewed in sep. tab
  # 22 columns, 250 rows



# Page 11 - Appending Datasets in R
  # load data and preview it
muscles1 = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/muscles1.xlsx')
View(muscles1)
# 4 columns, 24 rows

muscles2 = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/muscles2.xlsx')
View(muscles2)
# 4 columns, 37 rows


  # rbind() function
muscles3 = rbind(muscles1, muscles2)
View(muscles3)
# 4 columns, 61 rows



# Page 16 - Data Aggregation in R

  # import data 
states = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 2: Data Transformations/states.csv')
View(states)
# 2 columns, 39 rows

  # aggregate function
states2 = aggregate(Cases ~ State, states, sum)
print(states2)
# printed:
  #           State Cases
  # 1       Georgia    49
  # 2      Michigan    43
  # 3     Tennessee    38
  # 4       Vermont    24
  # 5 West Virginia    88

states3 = aggregate(Cases ~ State, states, max)
print(states3)
# printed:
  #           State Cases
  # 1       Georgia    11
  # 2      Michigan     9
  # 3     Tennessee    10
  # 4       Vermont     7
  # 5 West Virginia    15

states4 = aggregate(Cases ~ State, states, mean)
print(states4)
# printed:
  #           State    Cases
  # 1       Georgia 6.125000
  # 2      Michigan 5.375000
  # 3     Tennessee 6.333333
  # 4       Vermont 4.800000
  # 5 West Virginia 7.333333

states5 = aggregate(Cases ~ State, states, median)
print(states5)
# printed:
  #           State Cases
  # 1       Georgia   6.0
  # 2      Michigan   5.5
  # 3     Tennessee   5.5
  # 4       Vermont   6.0
  # 5 West Virginia   6.5

states6 = aggregate(Cases ~ State, states, min)
print(states6)
# printed:
  #           State Cases
  # 1       Georgia     3
  # 2      Michigan     2
  # 3     Tennessee     3
  # 4       Vermont     2
  # 5 West Virginia     3

states7 = aggregate(Cases ~ State, states, sd)
print(states7)
# printed:
  #           State    Cases
  # 1       Georgia 2.799872
  # 2      Michigan 2.133910
  # 3     Tennessee 2.658320
  # 4       Vermont 2.588436
  # 5 West Virginia 3.420083