# DSO104 - Data Wrangling and Visualization
  # Lesson 4 - Displaying Quantitative Data

# Page 1 - Data Science
  # From workshop

# load potentially relevant packages
library(dplyr)
library(ggplot2)
library(tidyr)
library(fastDummies)
library(lattice)

# load data
flowers = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/flowers.csv')
View(flowers)
# 9 columns, 734 rows

flowerShip = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/flowerShipment.csv')
View(flowerShip)
# 8 columns, 675 rows


# create histogram with ggplot
ggplot(flowers, aes(x=Days.to.grow)) + 
  geom_histogram() +
  ggtitle('Histogram of the Number of Days to Grow') +
  xlab('Number of Days to Grow Flowers') +
  ylab('Number of Years')


# bar chart with ggplot
ggplot(flowers, aes(type.of.flower)) +
  geom_bar() +
  ggtitle('Frequency of Flower Types') +
  xlab('Flower Types') +
  ylab('Frequency')


# bar chart with lattice
barchart(flowers$type.of.flower, main = 'Frequency of Flowers',
         ylab = 'Frequency', xlab = 'Flower Type')


# scatterplots
ggplot(flowers, aes(x = Cost.to.grow, y = Cost.of.force)) +
  geom_point() +
  ggtitle('Cost to Grow by Workforce Cost') +
  xlab('Cost to Grow Flowers') +
  ylab('Cost of the Workforce')


# line charts in ggplot
ggplot(flowerShip, aes(as.Date(Date, '%m/%d/%Y'), Cost)) +
  geom_line() +
  ggtitle('Cost of Flowers Over Time') +
  xlab('Date of Flower Shipment') +
  ylab('Cost of Flowers')




# Page 5 - Bar Charts in R

  # import data
hr = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/HR_data.csv')
View(hr)
# 10 columns, 14,999 rows


  # bar chart w/ ggplot
ggplot(hr, aes(salary)) +
  geom_bar() +
  xlab('Salary Category') +
  ylab('Frequency') +
  ggtitle('Frequency of Salary')


  # bar charts with lattice
barchart(hr$salary)

barchart(hr$Work_accident)
# chart doesn't make sense b/c data is numeric, not a factor


barchart(hr$salary, main = 'Frequency of Salary', 
         ylab = 'Salary Category', xlab = 'Frequency', col = 'green')




# Page 8 - Creating Stacked Bar Charts

  # add 'mapping' and 'fill' arguments
ggplot(data = hr) +
  geom_bar(mapping = aes(x = sales, fill = salary)) +
  xlab('Sales Category') +
  ylab('Frequency') +
  ggtitle('Sales Categories by Salary Level')
# stacked bar chart w/ variable heights, is very hard to analyze


  # add 'position' argument with 'fill' value
ggplot(data = hr) +
  geom_bar(mapping = aes(x = sales, fill = salary), 
           position = 'fill') +
  xlab('Sales Category') +
  ylab('Frequency') +
  ggtitle('Sales Categories by Salary Level')
# stacked bar chart w/ filled heights, is slightly easier to analyze


# update 'position' argument with 'dodge' value
ggplot(data = hr) +
  geom_bar(mapping = aes(x = sales, fill = salary), 
           position = 'dodge') +
  xlab('Sales Category') +
  ylab('Frequency') +
  ggtitle('Sales Categories by Salary Level')
# bar chart w/ side by side values, is easy to analyze



# Page 14 - Line Charts in R

  # import data
earthquakes = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/earthquakes.csv')
View(earthquakes)

  # purposely do line chart w/o reformatting date column
ggplot(earthquakes, aes(Date, M)) +
  geom_line() +
  ggtitle('Magnitude of Earthquakes Over Time') +
  xlab('Date of Earthquake') +
  ylab('Earthquake Magnitude')
# no line on chart


  # check structure (data types) of data
str(earthquakes)


  # convert M to numeric separately then Date to date in-line
earthquakes$M = as.numeric(earthquakes$M)

ggplot(earthquakes, aes(as.Date(Date, '%d-%b-%y'), M)) +
  geom_line() +
  ggtitle('Magnitude of Earthquakes Over Time') +
  xlab('Date of Earthquake') +
  ylab('Earthquake Magnitude')
# oddly enough, this doesn't exactly match the lesson... and, as 
  # lesson points out, the years are odd per going into future - 
  # lesson says it's b/c of mistranslating 2-digit years


  # convert Date to date format and M column to numeric in=line AND
    # use d not j for day of month
ggplot(earthquakes, aes(as.Date(Date, '%d-%b-%y'), as.numeric(M))) +
  geom_line() +
  ggtitle('Magnitude of Earthquakes Over Time') +
  xlab('Date of Earthquake') +
  ylab('Earthquake Magnitude')
# same results as above, so I like this option better
