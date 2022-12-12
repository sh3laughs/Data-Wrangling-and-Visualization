# DSO104 - Data Wrangling and Visualization
  # Lesson 4 - Displaying Quantitative Data
  # Page 19 - Hands-On

# Part 1
  # Here's a listing of the number of power boats registered in 
    # Florida (in the 1000's) for each year, 35 years worth of data. 
    # Tinker with the settings until you have created a histogram with 
    # 7 bars.
  # Tip! Remember, in R, there is an argument to ggplot for 
    # binwidth= that will let you explore bins!

  # import packages and data
library(ggplot2)
library(lattice)

flBoats = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/Hands-On/L4P1.csv')
View(flBoats)
# 1 column, 35 rows


  # create histogram with 7 bars
ggplot(flBoats, aes(Power.Boats..in.1000.s.)) + 
  geom_histogram(bins = 7, fill = 'blue') +
  xlab("1,000's of Boats") +
  ylab('Frequency') +
  ggtitle("Frequency of 1,000's of Registered of Power Boats")
# This was tricky to figure out how to title, based on figuring out
    # how it was graphing it, but finally realized it's bucketing 
    # based on how many years have any number of boats
  # The data are not normally distributed



# Part 2
  # Use the following data to create a bar graph

  # import data
cars = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/Hands-On/L4P2.csv')
View(cars)
# 1 column, 86 rows
  # note: I imported as "mystery" then saw what data was and re-named


  # create bar graph
barchart(cars$Cars, main = 'Car Brands by Frequency', 
         ylab = 'Car Brand', xlab = 'Frequency', col = 'red')
# Jaguar is the most popular car in this batch - was a survey of the
  # rich and famous? ;)



# Part 3
  # Use the following data to create a stacked bar chart

  # import data
carLocations = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/Hands-On/L4P3.csv')
View(carLocations)
# note: I imported as "mystery" then saw what data was and re-named

  # create stacked bar graph
ggplot(data = carLocations) + 
  geom_bar(mapping = aes(x = Car, fill = Location), 
           position = 'fill') + 
  xlab('Car Brands') + 
  ylab('Frequency') + 
  ggtitle('Car Brands by Location')
# hard to interpret data... seems to indicate there are more cars in
  # the southwest, which seems highly unlikely unless data are 
  # skewed 



# Part 4
  # The following dataset contains data for estuarine crocodiles, 
    # recording their head length and body length. Visualize the data 
    # with a clearly labeled scatter plot.

  # import data
crocodiles = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/Hands-On/L4P4.csv')
View(crocodiles)
# 3 columns, 28 rows


  # create scatterplot
ggplot(crocodiles, aes(x = BodyLength, y = HeadLength)) + 
  geom_point(color = 'dark green') + 
  xlab('Body Length') + 
  ylab('Head Length') + 
  ggtitle('Estuarine Crocodile Body Length by Head Length')
# data appear to be strongly and positively correlated - the longer
  # the crocodile's body, the longer its head



# Part 5
  # Here's data tracking heart attacks treated at a hospital chain in 
    # a large US city. Use this data to create a line chart. Be sure 
    # to label the graph, and label both axes.

  # import data
heartAttacks = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 4: Displaying Quantitative Data/Hands-On/L4P5.csv')
View(heartAttacks)
# 4 columns, 91 rows


  # wrangle data
str(heartAttacks)
# $ Month        : chr
# $ Day          : chr
# $ Year         : int
# $ Heart.Attacks: int

  # 1st attempt
heartAttacks$date = c(as.Date(heartAttacks$Month, '%B '),
                      as.Date(heartAttacks$Day, '%d, '),
                      as.Date(heartAttacks$Year, '%Y'))
View(heartAttacks)
# Error in charToDate(x) : 
  # character string is not in a standard unambiguous format


  # 2nd attempt
heartAttacks$date = c(heartAttacks$Month + heartAttacks$Day + 
                      heartAttacks$Year)
View(heartAttacks)
# Error in heartAttacks$Month + heartAttacks$Day : 
  # non-numeric argument to binary operator


  # 3rd attempt
heartAttacks$date = c(heartAttacks$Month, heartAttacks$Day, 
                      heartAttacks$Year)
View(heartAttacks)
# Error in `$<-.data.frame`(`*tmp*`, date, value = c("May", "May", 
    # "May",  : 
  # replacement has 273 rows, data has 91


# 4th attempt
heartAttacks$Month = c(as.Date(heartAttacks$Month), '%B ')
heartAttacks$Day = c(as.Date(heartAttacks$Day, '%d, '))
heartAttacks$Year = c(as.Date(heartAttacks$Year, '%Y'))
heartAttacks$date = c(heartAttacks$Month, heartAttacks$Day, 
                      heartAttacks$Year)
View(heartAttacks)
# Error in charToDate(x) : 
  # character string is not in a standard unambiguous format


  # 5th attempt.. gettting frustrated!
heartAttacks$date = as.Date(with(heartAttacks, 
                                 paste(Month, Day, Year, sep = ' ')),
                            '%B %d, %Y')
View(heartAttacks)
# geesh, finally worked - found here:
# https://www.tutorialspoint.com/how-to-combine-year-month-and-day-column-in-an-r-data-frame


  # create line chart
ggplot(heartAttacks, aes(date, Heart.Attacks)) +
  geom_line(color = 'red') +
  xlab('Month') +
  ylab('Number of Heart Attacks') +
  ggtitle('Number of Heart Attacks by Month in 2003')
# There seems to be no correlation between date and number of heart 
  # attacks, though there are slightly more overall at the end of the 
  # summer / data - interesting that the line ends up looking like a 
  # heartbeat though ;)