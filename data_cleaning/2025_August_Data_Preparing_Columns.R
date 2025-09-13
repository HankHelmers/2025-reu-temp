# Author: Hank Helmers
# Date: 08-28-2025, 09-13-2025
# Purpose: Prepare the data columns for use in analyses and review scripts. 
#          This preparation mainly includes renaming and removal.

# Ref: > setwd("C:/Users/helmerhj/Documents/GitHub/2025-reu-temp")

# Imports essential packages
library(tidyverse) # Clarity in code writing
library(readr)
library(styler)
library(dplyr)     # Data selecting and filtering
library(lubridate) # For working with dates and times


# Imports all 2025 data
health_assess_2025 <- read_csv("data/2025_June_July_Butternut_Health_Assessment_Form_Responses.csv")

# Remove columns created after May 2025
health_assess_2025 <- health_assess_2025 %>% select(1:60)


## Renaming columns for readability & clarity

### basic information
# Site Name
health_assess_2025 <- health_assess_2025 %>% rename(site_name = `Site Number or Initial: JC-W-_______`)

# gps_north
health_assess_2025 <- health_assess_2025 %>% rename(gps_north = `GPS location NORTH`)

# gps_west
health_assess_2025 <- health_assess_2025 %>% rename(gps_west = `GPS Location WEST`)

# plant_initials
health_assess_2025 <- health_assess_2025 %>% rename(plant_initials = `Plant Initials (for example, SH or EL)`)

# Plant Numbers
health_assess_2025 <- health_assess_2025 %>% rename(plant_number = `Plant Number (e.g. 4th tree assessed will be 4)`)

# slope
health_assess_2025 <- health_assess_2025 %>% rename(slope = `Slope (degree)`)

# aspect
health_assess_2025 <- health_assess_2025 %>% rename(aspect = `Aspect (N, NE, E, etc)`)

# Plant Height (ft)
health_assess_2025 <- health_assess_2025 %>% rename(plant_height_ft = `Plant Height (in FEET)`)

# DBH
health_assess_2025 <- health_assess_2025 %>% rename(dbh_cm = `DBH (in CENTIMETERS)`)

# has_canker
health_assess_2025 <- health_assess_2025 %>% rename(has_canker = `Visible cankers?`)

# has_callous
health_assess_2025 <- health_assess_2025 %>% rename(has_callous = `If large cankers are present, do you see evidence of callousing, whether currently being calloused over or having previously been calloused over? 

If there are no large cankers present, enter "NA." If there are large cankers present but it is not clear whether to not they are healing over, enter "Maybe."`)

# seedling_y_n
health_assess_2025 <- health_assess_2025 %>% rename(seedling_y_n = `Is this individual a seedling?`)

# photo info
health_assess_2025 <- health_assess_2025 %>% rename(first_photo = `Number of the 1st photo taken`)

health_assess_2025 <- health_assess_2025 %>% rename(last_photo = `Number of the last photo taken`)

### Seeds
# Producing seeds
health_assess_2025 <- health_assess_2025 %>% rename(producing_seed = `Producing seed?`)

# seed_estimate
health_assess_2025 <- health_assess_2025 %>% rename(seed_estimate = `Roughly how many seeds are on the tree?`)

# seeds_per_bunch
health_assess_2025 <- health_assess_2025 %>% rename(seeds_per_bunch = `How many seed are in each bunch (average estimate)?`)


### % observations
# % live canopy
health_assess_2025 <- health_assess_2025 %>% rename(percent_live_canopy = `Percent live canopy (estimate, being sure to only include live branches in assessment)

Note: This is a measure of crown density. In order to estimate this, first envision the amount of canopy there would be if the tree were fully healthy. Butternuts do not typically have a tightly formed canopy even when healthy so be sure to evaluate based on branch presence and location. Then estimate what percent of the envisioned canopy is actually present. This will be your estimate of percent live canopy.`)

# base_epicormics
health_assess_2025 <- health_assess_2025 %>% rename(base_epicormics = `Number of epicormic branches / sprouts from the base`)

# trunk_epicormics
health_assess_2025 <- health_assess_2025 %>% rename(trunk_epicormics = `Number of epicormic branches / sprouts from the trunk`)

# girdled_canker_circum_2025
health_assess_2025 <- health_assess_2025 %>% rename(girdled_canker_circum = `At the part of the trunk that appears most girdled by canker, what portion of the circumference of the trunk is girdled?...31`)

# trunk_canker_area
health_assess_2025 <- health_assess_2025 %>% rename(trunk_canker_area = `How much area of the trunk below first main branch is infected by canker, measured as a percentage of total trunk with cankers visible (including cankering visible underneath uplifted bark)?`)

# base_canker_area
health_assess_2025 <- health_assess_2025 %>% rename(base_canker_area = `How much area of the base/ root flare is infected by canker, e.g. as a percentage of root flare (up to 10 cm above soil) with cankers visible (including underneath bark)?`)

### Densiometer
# densio_north
health_assess_2025 <- health_assess_2025 %>% rename(densio_north = North)

# densio_south
health_assess_2025 <- health_assess_2025 %>% rename(densio_south = South)

# densio_east
health_assess_2025 <- health_assess_2025 %>% rename(densio_east = East)

# densio_west 
health_assess_2025 <- health_assess_2025 %>% rename(densio_west = West)

### Categorical (purdue ratings, hybrid characters, competition, damage)
# crown class
health_assess_2025 <- health_assess_2025 %>% rename(crown_class = `What is the crown class of this individual?`)

# purdue_severity_canker
health_assess_2025 <- health_assess_2025 %>% rename(purdue_severity_canker = `Assess severity of infection. Focus on the bottom 10 feet of the tree when assessing the number and size of cankers, noting that cankers can be hard to see on old trees with thick bark. CANKERS:`)

# purdue_severity_canopy
health_assess_2025 <- health_assess_2025 %>% rename(purdue_severity_canopy = `Assess severity of infection. CANOPY:`)

# shape_terminal_bud
health_assess_2025 <- health_assess_2025 %>% rename(shape_terminal_bud = `Shape of terminal bud`)

# shape_leaf_scar
health_assess_2025 <- health_assess_2025 %>% rename(shape_leaf_scar = `Shape of leaf scar`)

# shape_lenticels
health_assess_2025 <- health_assess_2025 %>% rename(shape_lenticels = `Shape / length of lenticels`)

# shape_hairs
health_assess_2025 <- health_assess_2025 %>% rename(shape_hairs = `Hairs on the end of the twigs`)

# associated_trees
health_assess_2025 <- health_assess_2025 %>% rename(associated_trees = `Associated tree species within 20 meters.`)

# competition
health_assess_2025 <- health_assess_2025 %>% rename(competition = `What competition is potentially threatening this tree?`)

# signs_of_damage_seedling
health_assess_2025 <- health_assess_2025 %>% rename(signs_of_damage_seedling = `Does this seedling show signs of damage from any of the following?`)

# signs_of_damage_trees
health_assess_2025 <- health_assess_2025 %>% rename(signs_of_damage_trees = `Does this tree show any signs of any of the following?`)

# Removal of unused questions 
health_assess_2025 <- health_assess_2025 %>% select(
  ## Bark phenotypes
  -`How deep are the furrows in the bark?`,
  -`What shade (from light/white to dark) is the tree bark?`,
)

# Convert Timestamp data to the 'Date' data type
health_assess_2025 <- health_assess_2025 %>% mutate(Timestamp = mdy_hms(Timestamp))


# Print out renaming
colnames(health_assess_2025)

