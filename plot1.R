library(lubridate)

# Set working directory to the location that contains the data file: household_power_consumption.txt 
setwd("C:/Users/212410226/Python & R/R_workingDirectory/3. Exploratory Data Analysis/Week 1/Project")

# Import the data
data <- read.table('household_power_consumption.txt',
                   header = TRUE,
                   sep    = ';',
                   stringsAsFactors = FALSE,
                   na.strings = "?"
)

# Subset data for 2007-02-01 and 2007-02-02 and generate datetime column using both lubridate and paste
data <- data[grepl('^1/2/2007', data$Date)|grepl('^2/2/2007', data$Date),]
data$datetime <- dmy_hms(paste(data$Date,data$Time))

# Plot1
png(filename = "./ExData_Plotting1/plot1.png", width = 480, height = 480, bg = "white")
hist(data$Global_active_power,
     col  ='red',
     xlab ='Global Active Power (kilowatts)',
     main ='Global Active Power')
dev.off()