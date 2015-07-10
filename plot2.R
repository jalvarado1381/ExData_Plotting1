rm(list=ls())
source("importData.R")

png(filename = "plot2.png",  width = 480, height = 480, units = "px")
plot(hhpc_df2$Time,hhpc_df2$Global_active_power,  type="l",ylab="Global active power(kilowatts)", xlab="")
dev.off()
