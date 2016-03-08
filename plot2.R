#Plot 2

#Data Source:
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download Zip File to working directory
download.file(url, "exdata_household_power_consumption.zip", method = "wininet", quiet = FALSE)

#Read in the data
data <- read.table(unz("exdata_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")

#Convert date column into date format
data$Date <- as.Date(strptime(data$Date,format = "%d/%m/%Y"))

#Select only days 2007-02-01 and 2007-02-02
data_snippet <- data[data[,1] >= "2007-02-01" & data[,1] <= "2007-02-02" ,]

#install.packages("png")       #REquires installation of png-package
library(png)

#Open PNG Graphics Device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12 )

#Draw time-series plot of Global_Active_Power
plot(as.POSIXct(paste(data_snippet$Date,as.character(data_snippet$Time),sep = " ")),as.numeric(as.character(data_snippet$Global_active_power)), type = "l",col = "black", ylab = "Global Active Power (kilowatts)", xlab = "")

#Turn off graphics device
dev.off()
