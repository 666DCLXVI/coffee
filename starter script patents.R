
# 1. Load data

# Load and check.
# A small sample for illustration


patents <- read.csv("patents_n.csv", header = TRUE)

head(patents)


# 2. Patents by country


library(dplyr)

patents_by_country <- patents %>%
  group_by(ee_country) %>%
  summarize(count = n())

head(patents_by_country)



# 3. US subset

# Let's say we want to focus on the US.


patents_us <- subset(patents, ee_country == "US")

nrow(patents_us)



# How long does a patent take to get granted in the US on average?\n

patents_us$time_to_approval <- patents_us$grantyear - 
					patents_us$applyear

aggregate(time_to_approval ~ ee_state,
		data = patents_us, 
		FUN = mean)




# And so on............. \n

