## ----message=FALSE, warning=FALSE---------------------------------------------
library(tidyverse)
library(readr)
library(styler)
health_assess_2024 <- read_csv("data/july_3_2024_butternut_health_assessment_forms.csv")
# view(health_assess_2024)


## -----------------------------------------------------------------------------
# Get only the WCP observations (first 66)
health_assess_2024 <-  filter(health_assess_2024, health_assess_2024$`Site number or initial` == "WCP")


## -----------------------------------------------------------------------------
# Plant Height (ft)
health_assess_2024 <- health_assess_2024 %>% rename(plant_height_ft = `Plant height (ft)`)

# DBH
health_assess_2024 <- health_assess_2024 %>% rename(dbh_cm = `DBH (cm)`)

# % live canopy
health_assess_2024 <- health_assess_2024 %>% rename(percent_live_canopy = `Percent live canopy`)

# base_epicormics_2024
health_assess_2024 <- health_assess_2024 %>% rename(base_epicormics = `Number of epicormic branches/ sprouts from the base`)

# trunk_epicormics_2024
health_assess_2024 <- health_assess_2024 %>% rename(trunk_epicormics = `Number of epicormic branches/ sprouts from the trunk`)

# has_canker_2024
health_assess_2024 <- health_assess_2024 %>% rename(has_canker = `Visible cankers? (according to health assessment form)`)

# has_callous_2024
health_assess_2024 <- health_assess_2024 %>% rename(has_callous = `If large cankers present, are they being calloused over?`)

# trunk_canker_area_2024
health_assess_2024 <- health_assess_2024 %>% rename(trunk_canker_area = `Area of trunk infected by canker (%)`)

# base_canker_area_2024
health_assess_2024 <- health_assess_2024 %>% rename(base_canker_area = `Area of base/ root flare infected by canker (%)`)


# purdue_severity_2024
health_assess_2024 <- health_assess_2024 %>% rename(purdue_severity = `If trees are infected, severity of infection`)

# seedling_y_n_2024
health_assess_2024 <- health_assess_2024 %>% rename(seedling_y_n = `Seedling (Y/N)`)


## -----------------------------------------------------------------------------
health_assess_2024$plant_height_ft <- as.numeric(health_assess_2024$plant_height_ft)
health_assess_2024$dbh_cm <- as.numeric(health_assess_2024$dbh_cm)
health_assess_2024$percent_live_canopy <- as.numeric(health_assess_2024$percent_live_canopy)
health_assess_2024$base_canker_area <- as.numeric(health_assess_2024$base_canker_area)
health_assess_2024$trunk_canker_area <- as.numeric(health_assess_2024$trunk_canker_area)

