library(lubridate)

# 1. Import

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
data_collection_began <- ymd_hms("2025-06-05 00:00:00")
data_collection_end <- ymd_hms("2025-06-06 23:59:59")

june_2025 <- health_assess_2025 %>% filter(
  between(Timestamp, data_collection_began, data_collection_end)
)

# Focus in on the photo columns only
may_photos <- may_2025 %>% select( 
  Timestamp, site_name, plant_number,  # Identifiable info
  Camera, first_photo, last_photo      # Photo info
)

# Remove test entries
test_entry_1 = ymd_hms("2025-06-06 15:06:31") # "EL & HH Testing"
test_entry_2 = ymd_hms("2025-06-06 15:08:27") # "EL & HH Testing again"

test_entries = c(test_entry_1, test_entry_2)

may_photos <- may_photos %>% filter(Timestamp != test_entries)


# 4. 