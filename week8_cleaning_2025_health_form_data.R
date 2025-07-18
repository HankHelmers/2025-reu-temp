## ----message=FALSE---------------------------------------------------
library(tidyverse)
library(readr)
library(styler)
health_assess_2025 <- read_csv("july_16_2025_Butternut Health Assessment Form (Responses).csv")


## ----IGNORE = TRUE---------------------------------------------------
# health_assess_2025 <- health_assess_2025 %>% slice(109)
# health_assess_2025$`Any additional notes?`


## --------------------------------------------------------------------
health_assess_2025 <- health_assess_2025 %>% select(
  -`Number of the 1st photo taken`,
  -`Number of the last photo taken`,
  -`Producing seed?`,
  -`Roughly how many seeds are on the tree?`,
  -`How many seed are in each bunch (average estimate)?`,
  -`What is the crown class of this individual?`,
  
  # Collections
  -`What did you collect?`,
  -`If VOUCHERS were collected, how many?`,
  -`If LEAVES were collected, how many?`,
  -`If CUTTINGS were collected, how many?`,
  -`If SEEDS were collected, how many?`,
  -`If other collections were made, please describe them here including the number collected.`,
  
  -`How deep are the furrows in the bark?`,
  -`What shade (from light/white to dark) is the tree bark?`,
  
  # Environment
  -`Riparian or upland?`,
  -`Associated tree species within 20 meters.`,
  -`What competition is potentially threatening this tree?`,
  -`If you answered "Other" above, please explain.`,
  -`Does this seedling show signs of damage from any of the following?`,
  -`Does this tree show any signs of any of the following?`,
  
  #Accessory Information
  -Camera,
  -Notes1,
  -Notes2,
  -Notes3,
  -Notes4,
  -Notes5,
  -Notes6,
  -Notes7,
  
  #Editing
  -`Edited after field collection? (Y/N)`,
  -`If edited, what date:`,
  -`If edited, what:`,
)


## ----message=FALSE---------------------------------------------------
colnames(health_assess_2025)


## --------------------------------------------------------------------
# Plant Height (ft)
health_assess_2025 <- health_assess_2025 %>% rename(plant_height_ft = `Plant Height (in FEET)`)
plant_height_ft_2025 <- health_assess_2025$plant_height_ft

# DBH
health_assess_2025 <- health_assess_2025 %>% rename(dbh_cm = `DBH (in CENTIMETERS)`)
dbh_cm_2025 <- health_assess_2025$dbh_cm

# has_canker
health_assess_2025 <- health_assess_2025 %>% rename(has_canker = `Visible cankers?`)
has_canker_2025 <- health_assess_2025$has_canker

# has_callous
health_assess_2025 <- health_assess_2025 %>% rename(has_callous = `If large cankers are present, do you see evidence of callousing, whether currently being calloused over or having previously been calloused over? 

If there are no large cankers present, enter "NA." If there are large cankers present but it is not clear whether to not they are healing over, enter "Maybe."`)
has_callous_2025 <- health_assess_2025$has_callous

# seedling_y_n
health_assess_2025 <- health_assess_2025 %>% rename(seedling_y_n = `Is this individual a seedling?`)
seedling_y_n_2025 <- health_assess_2025$seedling_y_n


## --------------------------------------------------------------------
# % live canopy
health_assess_2025 <- health_assess_2025 %>% rename(percent_live_canopy = `Percent live canopy (estimate, being sure to only include live branches in assessment)

Note: This is a measure of crown density. In order to estimate this, first envision the amount of canopy there would be if the tree were fully healthy. Butternuts do not typically have a tightly formed canopy even when healthy so be sure to evaluate based on branch presence and location. Then estimate what percent of the envisioned canopy is actually present. This will be your estimate of percent live canopy.`)
percent_live_canopy_2025 <- health_assess_2025$percent_live_canopy

# base_epicormics
health_assess_2025 <- health_assess_2025 %>% rename(base_epicormics = `Number of epicormic branches / sprouts from the base`)
base_epicormics_2025 <- health_assess_2025$base_epicormics

# trunk_epicormics
health_assess_2025 <- health_assess_2025 %>% rename(trunk_epicormics = `Number of epicormic branches / sprouts from the trunk`)
trunk_epicormics_2025 <- health_assess_2025$trunk_epicormics

# girdled_canker_circum_2025
health_assess_2025 <- health_assess_2025 %>% rename(girdled_canker_circum_2025 = `At the part of the trunk that appears most girdled by canker, what portion of the circumference of the trunk is girdled?`)
girdled_canker_circum_2025 <- health_assess_2025$girdled_canker_circum_2025

# trunk_canker_area
health_assess_2025 <- health_assess_2025 %>% rename(trunk_canker_area = `How much area of the trunk below first main branch is infected by canker, measured as a percentage of total trunk with cankers visible (including cankering visible underneath uplifted bark)?`)
trunk_canker_area_2025 <- health_assess_2025$trunk_canker_area

# base_canker_area
health_assess_2025 <- health_assess_2025 %>% rename(base_canker_area = `How much area of the base/ root flare is infected by canker, e.g. as a percentage of root flare (up to 10 cm above soil) with cankers visible (including underneath bark)?`)
base_canker_area_2025 <- health_assess_2025$base_canker_area


## --------------------------------------------------------------------
# densio_north
health_assess_2025 <- health_assess_2025 %>% rename(densio_north = North)
densio_north_2025 <- health_assess_2025$densio_north

# densio_south
health_assess_2025 <- health_assess_2025 %>% rename(densio_south = South)
densio_south_2025 <- health_assess_2025$densio_south

# densio_east
health_assess_2025 <- health_assess_2025 %>% rename(densio_east = East)
densio_east_2025 <- health_assess_2025$densio_east

# densio_west 
health_assess_2025 <- health_assess_2025 %>% rename(densio_west = West)
densio_west_2025 <- health_assess_2025$densio_west


## --------------------------------------------------------------------
# purdue_severity_canker
health_assess_2025 <- health_assess_2025 %>% rename(purdue_severity_canker = `Assess severity of infection. Focus on the bottom 10 feet of the tree when assessing the number and size of cankers, noting that cankers can be hard to see on old trees with thick bark. CANKERS:`)
purdue_severity_canker_2025 <- health_assess_2025$purdue_severity_canker

# purdue_severity_canopy
health_assess_2025 <- health_assess_2025 %>% rename(purdue_severity_canopy = `Assess severity of infection. CANOPY:`)
purdue_severity_canopy_2025 <- health_assess_2025$purdue_severity_canopy

# shape_terminal_bud
health_assess_2025 <- health_assess_2025 %>% rename(shape_terminal_bud = `Shape of terminal bud`)
shape_terminal_bud_2025 <- health_assess_2025$shape_terminal_bud

# shape_leaf_scar
health_assess_2025 <- health_assess_2025 %>% rename(shape_leaf_scar = `Shape of leaf scar`)
shape_leaf_scar_2025 <- health_assess_2025$shape_leaf_scar

# shape_lenticels
health_assess_2025 <- health_assess_2025 %>% rename(shape_lenticels = `Shape / length of lenticels`)
shape_lenticels_2025 <- health_assess_2025$shape_lenticels

# shape_hairs
health_assess_2025 <- health_assess_2025 %>% rename(shape_hairs = `Hairs on the end of the twigs`)
shape_hairs_2025 <- health_assess_2025$shape_hairs


## ----message=FALSE---------------------------------------------------
colnames(health_assess_2025)


## --------------------------------------------------------------------
# Testing columns (#15, 16, 34, 52, 71)
## 15, 16, 71 all explicitly state testing 
## 34 is a BLACK WALNUT
## 52 has unspecific GPS points making me think it is also a testing from when we make it numerical only
health_assess_2025 <- health_assess_2025 %>% slice(c(-15, -16, -34, -52, -71))

# Remove 'Suger River' site from analysis
health_assess_2025 <- filter(
  health_assess_2025,
  
  # Notice that its selecting sites which are NOT sugar river
  !str_equal(
    `Site Number or Initial: JC-W-_______`,
    "Sugar river",
    ignore_case = TRUE
  )
)
  


## --------------------------------------------------------------------
# Fixing typing---------------------------------
plant_height_ft_2025 <- as.numeric(plant_height_ft_2025)
dbh_cm_2025 <- as.numeric(dbh_cm_2025)
percent_live_canopy_2025 <- as.numeric(percent_live_canopy_2025)

#canker
base_canker_area_2025 <- as.numeric(base_canker_area_2025)
trunk_canker_area_2025 <- as.numeric(trunk_canker_area_2025)
girdled_canker_circum_2025 <- as.numeric(girdled_canker_circum_2025)

#densio
densio_east_2025 <- as.numeric(densio_east_2025)
densio_north_2025 <- as.numeric(densio_north_2025)
densio_south_2025 <- as.numeric(densio_south_2025)
densio_west_2025 <- as.numeric(densio_west_2025)


## ----message=FALSE---------------------------------------------------
health_assess_2025$percent_live_canopy <- parse_number(health_assess_2025$percent_live_canopy)


## --------------------------------------------------------------------
# test_canopy <- health_assess_2025 %>% select(percent_live_canopy) %>% mutate(clean_percent_live_canopy = parse_number(health_assess_2025$percent_live_canopy))
# view(test_canopy)


## ----message=FALSE---------------------------------------------------
health_assess_2025$base_canker_area <- parse_number(health_assess_2025$base_canker_area)

# Right now, "Less than 10, but more than 0" just reads in as 10
health_assess_2025$trunk_canker_area <- parse_number(health_assess_2025$trunk_canker_area)

# Right now, "Less than 10, but more than 0" just reads in as 10
health_assess_2025$girdled_canker_circum_2025 <- parse_number(health_assess_2025$girdled_canker_circum_2025)


## --------------------------------------------------------------------
# base_canker_test <- health_assess_2025 %>% select(base_canker_area) %>% mutate(cleaned_base_canker = parse_number(health_assess_2025$base_canker_area))
# view(base_canker_test)
# 
# # Right now, "Less than 10, but more than 0" just reads in as 10
# trunk_canker_test <- health_assess_2025 %>% select(trunk_canker_area) %>% mutate(cleaned_trunk_canker = parse_number(health_assess_2025$trunk_canker_area))
# view(trunk_canker_test)
# 
# # Right now, "Less than 10, but more than 0" just reads in as 10
# girdled_canker_test <- health_assess_2025 %>% select(girdled_canker_circum_2025) %>% mutate(cleaned_girdled_canker = parse_number(health_assess_2025$girdled_canker_circum_2025))
# view(girdled_canker_test)


## --------------------------------------------------------------------
health_assess_2025 <- health_assess_2025 %>% mutate(base_canker_area = if_else(has_canker == "No", 0, base_canker_area))

health_assess_2025 <- health_assess_2025 %>% mutate(trunk_canker_area = if_else(has_canker == "No", 0, trunk_canker_area))

health_assess_2025 <- health_assess_2025 %>% mutate(girdled_canker_circum_2025 = if_else(has_canker == "No", 0))


## --------------------------------------------------------------------
# base_canker_adding_0s_test <- health_assess_2025 %>% select(has_canker, base_canker_area) %>% mutate(cleaned_base_canker = if_else(has_canker == "Yes", base_canker_area, 0))
# view(base_canker_adding_0s_test)
# 
# trunk_canker_adding_0s_test <- health_assess_2025 %>% select(has_canker, trunk_canker_area) %>% mutate(cleaned_trunk_canker = if_else(has_canker == "Yes", trunk_canker_area, 0))
# view(trunk_canker_adding_0s_test)
# 
# girdled_circum_adding_0s_test <- health_assess_2025 %>% select(has_canker, girdled_canker_circum_2025) %>% mutate(cleaned_girdled_circum = if_else(has_canker == "Yes", girdled_canker_circum_2025, 0))
# view(girdled_circum_adding_0s_test)


## --------------------------------------------------------------------
health_assess_2025 <- health_assess_2025 %>% mutate(
  # Clean up the text for consistency (e.g., remove extra spaces, make lowercase)
  height_str = str_to_lower(str_trim(dbh_cm)),
  
  # Extract the first decimal number, this will always be the cm
    # Note that broadly "\\d+\\.?\\d*" selection nomenclature simily breaks down to: get the "Digits, maybe a dot, maybe more digits"
    # Where the "\\d+" gets all the first whole digits,
    # then the "\\.?" will check whether there is a literal decimal point,
    # if there is then "\\d*" gets all remaining digits
  dbh_cm = as.numeric(str_extract(height_str, "\\d+\\.?\\d*")),

) %>% select(-height_str) # Only keep the new dbh value


## --------------------------------------------------------------------
# test_dbh <- health_assess_2025 %>% select(dbh_cm) %>% mutate(
#   # Clean up the text for consistency (e.g., remove extra spaces, make lowercase)
#   height_str = str_to_lower(str_trim(dbh_cm)),
#   
#   # Extract the first decimal number, this will always be the cm
#     # Note that broadly "\\d+\\.?\\d*" selection nomenclature simily breaks down to: get the "Digits, maybe a dot, maybe more digits"
#     # Where the "\\d+" gets all the first whole digits,
#     # then the "\\.?" will check whether there is a literal decimal point,
#     # if there is then "\\d*" gets all remaining digits
#   dbh_cm_new = as.numeric(str_extract(height_str, "\\d+\\.?\\d*")),
# 
# ) %>% select(-height_str) # Only keep the new dbh value
# view(test_dbh)


## --------------------------------------------------------------------
health_assess_2025 <- health_assess_2025 %>% mutate(
  # Big picture height cleaning:
  #   * Assume in feet if no units are written into the box
  #   * If units are written in the box: extract them and re-calculate the heigh
  
  # ------------------ Process:
  # Clean up the text for consistency (e.g., remove extra spaces, make lowercase)
  height_str = str_to_lower(str_trim(plant_height_ft)),
  
  # Extract the first decimal number, this will always be the feet
  # Note that broadly "\\d+\\.?\\d*" selection nomenclature simily breaks down to: get the "Digits, maybe a dot, maybe more digits"
  # Where the "\\d+" gets all the first whole digits,
  # then the "\\.?" will check whether there is a literal decimal point,
  # if there is then "\\d*" gets all remaining digits
  feet_str = str_extract(height_str, "\\d+\\.?\\d*\\s*(ft)"),
  feet = as.numeric(str_extract(feet_str, "\\d+\\.?\\d*")),
  
  # Get the string of inches which will be based on either the presence of "inches" or "in",
  # e.g., "7 inches" or "7in"
  inches_str = str_extract(height_str, "\\d+\\.?\\d*\\s*(inches|in)"),
  # Extract the decimal from the isolated inches string, like the feet
  inches = as.numeric(str_extract(inches_str, "\\d+\\.?\\d*")),
  
  # Convert using the numerical values
  # Where 'coalesce' will use a 0 if feet/inches is an NA value
  calculated_from_text_feet = (coalesce(feet, 0)) + (coalesce(inches, 0) / 12.0),
  
  # Seeing if the entry has additional text in it like "ft" or "inches"
  contains_text = str_detect(height_str, "ft") |
    str_detect(height_str, "inches") | str_detect(height_str, "in"),
  
  # Assume the plant_height_ft is the string as a number if the entry doesn't have text.
  plant_height_ft = if_else(
    !contains_text,
    as.numeric(height_str),
    calculated_from_text_feet
  )
) %>% select(
  -height_str,
  -feet_str,
  -feet,
  -inches_str,
  -inches,
  -calculated_from_text_feet,
  -contains_text
)


## --------------------------------------------------------------------
# test_height_cleaning <- health_assess_2025 %>% select(plant_height_ft) %>% mutate(
#   # Big picture height cleaning:
#   #   * Assume in feet if no units are written into the box
#   #   * If units are written in the box: extract them and re-calculate the heigh
#   
#   # ------------------ Process: 
#   # Clean up the text for consistency (e.g., remove extra spaces, make lowercase)
#   height_str = str_to_lower(str_trim(plant_height_ft)),
# 
#   # Extract the first decimal number, this will always be the feet
#     # Note that broadly "\\d+\\.?\\d*" selection nomenclature simily breaks down to: get the "Digits, maybe a dot, maybe more digits"
#     # Where the "\\d+" gets all the first whole digits,
#     # then the "\\.?" will check whether there is a literal decimal point,
#     # if there is then "\\d*" gets all remaining digits
#   feet_str = str_extract(height_str, "\\d+\\.?\\d*\\s*(ft)"),
#   feet = as.numeric(str_extract(feet_str, "\\d+\\.?\\d*")),
# 
#   # Get the string of inches which will be based on either the presence of "inches" or "in",
#     # e.g., "7 inches" or "7in"
#   inches_str = str_extract(height_str, "\\d+\\.?\\d*\\s*(inches|in)"),
#   # Extract the decimal from the isolated inches string, like the feet
#   inches = as.numeric(str_extract(inches_str, "\\d+\\.?\\d*")),
# 
#   # Convert using the numerical values
#     # Where 'coalesce' will use a 0 if feet/inches is an NA value
#   calculated_from_text_feet = (coalesce(feet, 0)) + (coalesce(inches, 0) / 12.0),
#   
#   # Seeing if the entry has additional text in it like "ft" or "inches"
#   contains_text = str_detect(height_str, "ft") | str_detect(height_str, "inches") | str_detect(height_str, "in"),
#   
#   # Assume the plant_height_ft is the string as a number if the entry doesn't have text.
#   plant_height_ft_cleaned = if_else(!contains_text, as.numeric(height_str), calculated_from_text_feet)
#   
# ) %>% select(plant_height_ft, plant_height_ft_cleaned)
# 
# view(test_height_cleaning)


## --------------------------------------------------------------------
# Viewing subset of health_assess_2025 data
view_height <- health_assess_2025 %>% select(`Plant Number (e.g. 4th tree assessed will be 4)`, dbh_cm, plant_height_ft, densio_north, `Any additional notes?`)

# Ordering with highest height at the top
view_height <- view_height[order(view_height$plant_height_ft, decreasing = T), ]

library(knitr)
kable(slice(view_height, 1:20), , caption = "Comparison of heights to verify unitless entries were in feet")


## --------------------------------------------------------------------
# Identified mistake with SH29's height. 
# Based on photo evidence, the input of 62 feet into the datasheet must have been a mistake and treating the 62 as inches makes sense for that individual.

health_assess_2025 <- health_assess_2025 %>% mutate(plant_height_ft = recode(health_assess_2025$plant_height_ft, `62` = (62.0 / 12)))


# In the future, if I need to recode a lot of values I found this useful tidbit:
# df <- mutate(df, height = case_when(
#   height < 2.5 ~ height * 100,
#   height < 100 ~ height + 100
# )



## --------------------------------------------------------------------
# test_adults_have_dbh <- health_assess_2025 %>% select(`Plant Number (e.g. 4th tree assessed will be 4)`, dbh_cm, plant_height_ft, seedling_y_n) %>% mutate(
#   has_dbh = (!is.na(dbh_cm)),
# )
# 
# view(test_adults_have_dbh)


## --------------------------------------------------------------------
# test_adults <- health_assess_2025 %>% select(`Plant Number (e.g. 4th tree assessed will be 4)`, densio_north, seedling_y_n) %>% mutate(
#   is_seedling_with_densio = ((!is.na(densio_north)) & (seedling_y_n == "Yes"))
# )
# 
# view(test_adults)


## --------------------------------------------------------------------
health_assess_2025 <- health_assess_2025 %>% mutate(
  purdue_severity_canker = recode(
    health_assess_2025$purdue_severity_canker,
    "1. Fewer than 3 active cankers that are all smaller than 2-3 inches in length or diameter OR fewer than 3 inactive cankers." = "1",
    "2. More than 3 active cankers, OR 2-5 shallow (with no dead tissue) healed over with cracks less than 7 inches long." = "2",
"3. More than 5 active OR inactive cankers cracked through the bark to the tissue below which have healed over, but you still see the level of damage." = "3",
"4. Cankers occur all over the 10-foot area, with deep cracks and both active and inactive cankers." = "4",
"5. Tree almost dead, mostly inactive cankers with deep cracks to dead tissue." = "5"
  )
)


## --------------------------------------------------------------------
library(knitr)
kable(slice(health_assess_2025, 1:20), caption = "Cleaned and processed 2025 health assessment data")



