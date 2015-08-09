library(dplyr)

#importing and filtering data ################################################
hhpc <- read.table("household_power_consumption.txt", 
                   header=T, sep=";", na.strings="?", 
                   stringsAsFactors=F)
hhpc$Date<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Time<-as.POSIXct(paste(hhpc$Date, hhpc$Time))
hhpc_df <- tbl_df(hhpc)
hhpc_df2 <- filter(hhpc_df, Date =="2007-02-02" | Date =="2007-02-01")
#############################################################################

#plotting to file plot2.png ################################################

png(filename = "plot2.png",  width = 480, height = 480, bg = "transparent", units = "px")

plot(hhpc_df2$Time,hhpc_df2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

#############################################################################
