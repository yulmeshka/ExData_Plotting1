#Reading

all_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

#Subsetting
data_plot <- subset(all_data, subset=(Date >= "2007-02-01" 
                                      & Date <= "2007-02-02"))

#Making plot

hist(as.numeric(data_plot$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()


