library(dplyr)

# Importing and filtering data ##############################################

hhpc <- read.table("household_power_consumption.txt", 
                   header=T, sep=";", na.strings="?", 
                   stringsAsFactors=F)
hhpc$Date<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Time<-as.POSIXct(paste(hhpc$Date, hhpc$Time))
hhpc_df <- tbl_df(hhpc)
hhpc_df2 <- filter(hhpc_df, Date =="2007-02-02" | Date =="2007-02-01")

#############################################################################


# plotting to file plot1.png ################################################

png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(axes = 0)
hist(hhpc_df2$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

#############################################################################