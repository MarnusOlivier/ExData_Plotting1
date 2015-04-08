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

# Plot 4
png(filename = "./ExData_Plotting1/plot4.png", width = 480, height = 480, bg = "white")
par(mfrow = c(2,2))
with(data,{
        plot(datetime, Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = NA)
        plot(datetime, Voltage,             type = 'l', ylab = 'Voltage',             xlab = 'datetime')
        
        plot(datetime, Sub_metering_1, 
             type = 'l',
             ylab = 'Energy sub metering',
             xlab = NA,
             col  = 'black')
        lines(datetime, Sub_metering_2, col  = 'red')
        lines(datetime, Sub_metering_3, col  = 'blue')
        legend('topright',
               border = 'white',
               lty    = 'solid',
               bty    = 'n',
               legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
               col    = c('black', 'red', 'blue'))
        
        plot(datetime, Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime')     
})
dev.off()