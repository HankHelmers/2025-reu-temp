library(lubridate)

# Data Cleaning of May Form 2025 (Dates June 5th and 6th, 2025)
# This script organized the inconsistencies across the Butternut Health Assessment data 
#
# The responses aligned with the JUNE Version of the form
# Dates July 3rd to August 6th EOD. (All the photos through August data collection)
# Rows: 73-174 


# 1. Import
source("data_cleaning/2025_August_Data_Preparing_Columns.R")

# 2. Remove the columns we don't use
health_assess_2025 <- health_assess_2025 %>% select(
  ## Basic information
  -slope,
  -aspect,
  
  ## Collections
  -`What did you collect?`,
  -`If VOUCHERS were collected, how many?`,
  -`If LEAVES ON SILICA FOR DNA were collected, how many?`,
  -`If CUTTINGS were collected, how many?`,
  -`If SEEDS were collected, how many?`,
  -`If other collections were made, please describe them here including the number collected.`
)



# 3. Select between the two dates of data collected with this version of the form
#    (June 2025 Version)
data_collection_began <- ymd_hms("2025-07-03 00:00:00") #7/3/2025 8:38:24
data_collection_end <- ymd_hms("2025-08-06 23:59:59")   # 8/6/2025 15:38:19

july_health_2025 <- health_assess_2025 %>% filter(
  between(timestamp, data_collection_began, data_collection_end)
)

# 3. Specialized cleaning for this time period
#   a. Combining seperate SH37 observations into a single photo group
#      Emma and I took multiple form observations on this tree due to
#      its special circumstances. However, as far as the photos are 
#      concerned, there is only one set of photos. 
#      
#      In this case, simply removing the other two entries is the simplest option.

# Remove test entries & black walnut entry
test_entry_1 = ymd_hms("2025-08-06 15:31:37") # "Test entry"
test_entry_2 = ymd_hms("2025-08-06 15:38:19") # "Test entry"

test_entries = c(test_entry_1, test_entry_2)

july_health_2025 <- july_health_2025 %>% filter(timestamp != test_entries)

# 4. Focus in on the photo columns only
july_photos_2025 <- july_health_2025 %>% select( 
  timestamp, site_name, plant_number,  # Identifiable info
  camera, first_photo, last_photo      # Photo info
)
