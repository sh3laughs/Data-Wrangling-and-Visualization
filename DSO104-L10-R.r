# DSO104 - Data Wrangling and Visualization
  # Lesson 10 - Final Project

# import data
texasCrash = read.csv('/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 10: Final Project/motor_vehicle_crashes.csv')
View(texasCrash)

# Data Wrangling

  # New column to convert Light Condition ID's to Human-Readable Strings
texasCrash$Light_Conditions = NA

texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 1] = 'Daylight'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 2] = 'Dark, Not Lighted'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 3] = 'Dark, Lighted'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 4] = 'Dark, Unknown Lighting'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 5] = 'Dawn'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 6] = 'Dusk'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 7] = 'Unknown'
texasCrash$Light_Conditions[
  texasCrash$Light_Cond_ID == 8] = 'Unknown'

View(texasCrash)


  # New column to convert Weather Condition ID's to Human-Readable 
    # Strings
texasCrash$Weather_Conditions = NA

texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 1] = 'Clear'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 2] = 'Cloudy'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 3] = 'Rain'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 4] = 'Sleet/Hail'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 5] = 'Snow'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 6] = 'Fog'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 7] = 'Blowing Sand/Snow'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 8] = 'Severe Crosswinds'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 9] = 'Unknown'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 10] = 'Unknown'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 11] = 'Unknown'
texasCrash$Weather_Conditions[
  texasCrash$Wthr_Cond_ID == 12] = 'Unknown'

View(texasCrash)


  # New column to convert Road Surface Condition ID's to Human-
    # Readable Strings
texasCrash$Surface_Conditions = NA

texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 1] = 'Dry'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 2] = 'Wet'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 3] = 'Standing Water'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 4] = 'Snow'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 5] = 'Slush'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 6] = 'Ice'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 7] = 'Sand, Mud, Dirt'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 8] = 'Unknown'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 9] = 'Unknown'
texasCrash$Surface_Conditions[
  texasCrash$Surf_Cond_ID == 10] = 'Unknown'

View(texasCrash)


  # New column to convert Other Factor ID's to Human-Readable Strings
texasCrash$Other_Factors = NA

texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 1] = 'Animal on Road -Domestic'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 2] = 'Animal on Road -Wild'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 3] = 'Backed without Safety'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 4] = 'Changed Lane when Unsafe'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 5] = 'Defective or No Headlamps'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 6] = 'Defective or No Stop Lamps'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 7] = 'Defective or No Tail Lamps'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 8] = 
  'Defective or No Turn Signal Lamps'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 9] = 'Defective or No Trailer Brakes'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 10] = 'Defective or No Vehicle Brakes'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 11] = 'Defective Steering Mechanism'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 12] = 'Defective or Slick Tires'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 13] = 'Defective Trailer Hitch'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 14] = 'Disabled in Traffic Lane'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 15] = 'Disregard Stop and Go Signal'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 16] = 'Disregard Stop Sign or Light'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 17] = 
  'Disregard Turn Marks at Intersection'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 18] = 
  'Disregard Warning Sign at Construction'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 19] = 'Distraction in Vehicle'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 20] = 'Driver Inattention'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 21] = 'Drove Without Headlights'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 22] = 'Failed to Control Speed'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 23] = 'Failed to Drive in Single Lane'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 24] = 'Failed to Give Half of Roadway'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 25] = 'Failed to Heed Warning Sign'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 26] = 'Failed to Pass to Left Safely'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 27] = 'Failed to Pass to Right Safely'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 28] = 
  'Failed to Signal or Gave Wrong Signal'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 29] = 'Failed to Stop at Proper Place'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 30] = 'Failed to Stop for School Bus'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 31] = 'Failed to Stop for Train'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 32] = 
  'Failed to Yield ROW – Emergency Vehicle'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 33] = 
  'Failed to Yield ROW – Open Intersection'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 34] = 
  'Failed to Yield ROW – Private Drive'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 35] = 'Failed to Yield ROW – Stop Sign'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 36] = 
  'Failed to Yield ROW – To Pedestrian'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 37] = 
  'Failed to Yield ROW – Turning Left'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 38] = 
  'Failed to Yield ROW – Turn on Red'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 39] = 'Failed to Yield ROW – Yield Sign'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 40] = 'Fatigued or Asleep'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 41] = 'Faulty Evasive Action'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 42] = 'Fire in Vehicle'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 43] = 'Fleeing or Evading Police'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 44] = 'Followed Too Closely'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 45] = 'Had Been Drinking'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 46] = 'Handicapped Driver'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 47] = 'Ill'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 48] = 'Impaired Visibility'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 49] = 
  'Improper Start from Parked Position'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 50] = 'Load Not Secured'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 51] = 'Opened Door Into Traffic Lane'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 52] = 'Oversized Vehicle or Load'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 53] = 
  'Overtake and Pass Insufficient Clearance'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 54] = 'Parked and Failed to Set Brakes'
texasCrash$Other_Factors[
  texasCrash$Othr_Factr_ID == 55] = 'Parked in Traffic Lane'

View(texasCrash)


  # Subset to only include recoded columns
library(dplyr)

texasCrashSubset = texasCrash %>% select(Crash_ID, Light_Conditions, 
                                         Weather_Conditions, 
                                         Surface_Conditions,
                                         Other_Factors)

# Export updated dataset
write.csv(texasCrash, '/Users/hannah/Library/CloudStorage/GoogleDrive-gracesnouveaux@gmail.com/My Drive/Bethel Tech/Data Science/DSO104 Data Wrangling and Visualization/Lesson 10: Final Project/motor_vehicle_crashes_recoded.csv')
