
source("importData.R")

png(filename = "plot4.png",  width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(hhpc_df2$Time,hhpc_df2$Global_active_power,  type="l",ylab="Global active power", xlab="")
plot(hhpc_df2$Time,hhpc_df2$Voltage,  type="l",ylab="Voltage", xlab="")
with(hhpc_df2, plot(Time,Sub_metering_1, type="l",ylab="Energy sub metering")  )
with(hhpc_df2, points(Time,Sub_metering_2, type="l", col="red"))
with(hhpc_df2, points(Time,Sub_metering_3, type="l", col="blue"))
legend("topright", lty=c(1,1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(hhpc_df2$Time,hhpc_df2$Global_reactive_power,  type="l",ylab="Global_reactive_power", xlab="")
dev.off()
