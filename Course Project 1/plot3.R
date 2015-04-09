#Reading

all_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";"
                     ,na.strings="?")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

#Subsetting
data_plot <- subset(all_data, subset=(Date >= "2007-02-01" 
                                      & Date <= "2007-02-02"))

#New column
data_plot$Datetime <- as.POSIXct(paste(data_plot$Date, data_plot$Time))
data_plot$Weekday <- paste(weekdays(data_plot$Date))

#Changing_type
data_plot$Global_active_power<-as.numeric(data_plot$Global_active_power)


#Making plot

with(data_plot, {
       plot(Sub_metering_1~Datetime, type="l",
                                ylab="Global Active Power (kilowatts)", xlab="")
         lines(Sub_metering_2~Datetime,col='Red')
         lines(Sub_metering_3~Datetime,col='Blue')
      })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
                      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()


