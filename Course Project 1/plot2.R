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

plot(data_plot$Datetime, data_plot$Global_active_power, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")

#Saving

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()


