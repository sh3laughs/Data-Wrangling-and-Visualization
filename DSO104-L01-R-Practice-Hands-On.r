# DSO104 - Data Wrangling and Visualization
  # Lesson 1 - Manipulating Columns and Rows 

# Page 13 - [Practice] Hands-On
  # load libraries
library(dplyr)
library(tidyr)
library(readxl)

  # import data
fakeNews = read_excel('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 1: Data Wrangling and Visualization/FakeNews.xlsx')
View(fakeNews)
# dataset saved to new variable and previewed in separate tab
  # observations: 3 columns
  # 3,339 rows
  # all string data

  # 1. Add a column labeled StoryType and fill it with Fake.
fakeNews$StoryType = 'Fake'
head(fakeNews)
# column added with 'Fake' value for every row

  # 2.Remove the when column.
fakeNews2 = fakeNews[,2:4]
head(fakeNews2)
# new variable saved for dataset with first ('when') column removed,
  # and first 6 rows previewed as tibble in console

  # 3.Separate the url column out so that you can see in one column 
    # the website and in the second column the domain. For example, if 
    # you have the following in url, it should be broken out like this:
      # http://wayback.archive.org/web/20161004072420id_/http://alertchild.com/
      # Website: http://wayback.archive.org/web/20161004072420id Domain: /http://alertchild.com/
fakeNews3 = separate(fakeNews2, url, c('Website', 'Domain'), sep = '_')
head(fakeNews3)
# new variable created with latest version of dataset, splitting the
  # url column into two separate columns, and previewed first 6 rows
  # as tibble in console

  # 4.Put back together the domain column.
fakeNews4 = unite(fakeNews3, url, Website, Domain, sep = '_')
head(fakeNews4)
# new variable created with split columns re-merged, and previewed 
  # first 6 rows as tibble in console

  # 5.Keep only the first ten rows of the data.
fakeNews5 = fakeNews4[1:10,]
View(fakeNews5)
# new variable created with only the first 10 rows of the most recent
  # version of the dataset, and previewed in separate tab
