## Description
Here is the temporary home of my REU/REEF scripts under development. It includes several of the scripts I've been developing for our work: analyses, data cleaning and photo preparation. They aren't perfectly prepared for outside use, but this is their home for now. 

## *Folder & File Breakdown*
### [[analyses](https://github.com/HankHelmers/2025-reu-temp/tree/main/analyses)]
My analysis scripts for the final REU presentation are located within the [analyses](https://github.com/HankHelmers/2025-reu-temp/tree/main/analyses) folder.

### [[data](https://github.com/HankHelmers/2025-reu-temp/tree/main/data)]
Copies of the downloaded butternut health assessment form data. 

### [[data_cleaning](https://github.com/HankHelmers/2025-reu-temp/tree/main/data_cleaning)]
REU 2025: Some of these data cleaning scripts were created for preparing data for analyses at the end of the REU.  

REEF 2025: Most, however, are currently being used to prepare and organize the photo information (first & last photo, camera) across the 2024 and 2025 datasheet changes. These cleaning scripts are a part of a full data cleaning plan and process outlined in here: [2025_REEF_Health_Assessment_Data_Cleaning_Planning](https://docs.google.com/document/d/1JY2t5U4-hh1tTu9zvgmd4sxrRhTZb_A5yyRSjThktRI/edit?tab=t.0). 

The specific scripts written and their purpose at this time are: \data_cleaning\
* 2025_August_Data_Preparing_Columns.R
    * Current implementation of parsing the many, messy columns of the data collected between June 2025 and July 2025. 
* Photo_Data_Cleaning_May_2025.Rmd
    * Script which cleans the photo data (first, last photos, and camera) from the data collected with the May Version of the health form.

### [[data_exploration](https://github.com/HankHelmers/2025-reu-temp/tree/main/data_exploration)]
These are scripts for exploring general patterns in the data. These were created during the 2025 REU. They are messy since these were some of my first-ever R scripts, where I was learning more than I was clearly communicating.  

### [[purl](https://github.com/HankHelmers/2025-reu-temp/tree/main/purl)]
Organizational folder for outputted knitted together R scripts made from converting markdown files (.Rmd) to pure R scripts (.R). I did this several times since I was originally only creating markdown files, which run significantly slower than R files. 
 
