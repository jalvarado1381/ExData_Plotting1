library(dplyr)

# Importing and filtering data #################################################

hhpc <- read.table("household_power_consumption.txt", 
                   header=T, sep=";", na.strings="?", 
                   stringsAsFactors=F)
hhpc$Date<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Time<-as.POSIXct(paste(hhpc$Date, hhpc$Time))
hhpc_df <- tbl_df(hhpc)
hhpc_df2 <- filter(hhpc_df, Date == "2007-02-02" | Date == "2007-02-01")

#############################################################################

#### Plotting to file plot4.png #################################################

png(filename = "plot4.png",  width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

plot(hhpc_df2$Time,hhpc_df2$Global_active_power,  type="l",ylab="Global Active Power", xlab="")

plot(hhpc_df2$Time,hhpc_df2$Voltage,  type="l",ylab="Voltage", xlab="datetime")

with(hhpc_df2, plot(Time,Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")  )
with(hhpc_df2, points(Time,Sub_metering_2, type="l", col="red"))
with(hhpc_df2, points(Time,Sub_metering_3, type="l", col="blue"))
legend("topright", lty=c(1,1,1), bty="n",col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(hhpc_df2$Time,hhpc_df2$Global_reactive_power,  type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()

#############################################################################
