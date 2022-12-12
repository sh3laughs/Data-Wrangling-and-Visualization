# DSO104 - Data Wrangling and Visualization
  # Lesson 5 - Displaying Qualitative Data

# Page 5 - Heat Maps in R

  # import libraries and data
library(dplyr)
library(ggplot2)
library(tidyr)
library(fastDummies)

stocks = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 5: Displaying Qualitative Data/stockdata.csv')
View(stocks)
# 12 rows, 61 columns


  # In order to use the heatmap function, you must have your data 
    # formatted as a matrix, and all of your data must be numeric.
    # Start by removing the date column from this data
stocks = stocks[,2:11]
View(stocks)


  # Then use the function as.matrix() to reformat the data as a 
    # matrix, rather than as a data frame:
stocks2 = as.matrix(stocks)
View(stocks2)


  # And lastly, run the heatmap() function:
heatmap(stocks2)



# Page 7 - Tree Maps in R

  # install and import libraries
install.packages("treemap")
install.packages("scales")

library(treemap)
library(scales)


  # import data
dsPosts = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 5: Displaying Qualitative Data/datascience_posts.csv')
View(dsPosts)
# 4 columns, 100 rows


  # create treemap
treemap(dsPosts, index = c('category'), vSize = 'views', 
        type = 'index')



# Page 9 - Mosaic Plots in R

  # install and load package
install.packages("vcd")

library(vcd)


  # import data
defects = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 5: Displaying Qualitative Data/defects.csv')
View(defects)
# 2 columns, 959 rows


  # data wrangling
attach(defects)
defects2 = table(Region, Defect)
defects2
# defects used to create a defects2 table


  # create mosaic plot
mosaic(defects2, shade = TRUE, legend = TRUE)