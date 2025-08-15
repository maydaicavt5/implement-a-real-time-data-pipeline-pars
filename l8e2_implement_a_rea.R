# Step 1: Load necessary libraries
library(tidyverse)
library(readr)
library(jsonlite)

# Step 2: Define a function to parse real-time data pipeline
parse_realtime_pipeline <- function(pipeline_data) {
  # Parse JSON data
  pipeline_df <- jsonlite::fromJSON(pipeline_data)
  
  # Extract relevant columns
  pipeline_df <- pipeline_df %>%
    select(id, timestamp, type, value)
  
  # Convert timestamp to POSIXct
  pipeline_df$timestamp <- as.POSIXct(pipeline_df$timestamp, origin = "1970-01-01")
  
  # Return parsed data
  return(pipeline_df)
}

# Step 3: Test the function with sample data
pipeline_data <- '[
  {"id": 1, "timestamp": "2022-01-01 12:00:00", "type": "temperature", "value": 25.0},
  {"id": 2, "timestamp": "2022-01-01 12:05:00", "type": "humidity", "value": 60.0},
  {"id": 3, "timestamp": "2022-01-01 12:10:00", "type": "pressure", "value": 100.0}
]'

parsed_data <- parse_realtime_pipeline(pipeline_data)

# View parsed data
print(parsed_data)