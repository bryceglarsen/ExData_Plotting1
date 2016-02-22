plot4 <- function(file){
      #read in file
      powerdata <- read.table(file, header = TRUE, sep=";", na.strings ="?")
      #powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
      powerdata$Global_active_power <- as.numeric(as.character((powerdata$Global_active_power)))

      #subset date based on date parameters
      finaldf <- subset(powerdata, as.Date(powerdata$Date,"%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date,"%d/%m/%Y") == "2007-02-02")
      
      #create timestamp for plotting
      finaldf$DateTime <- paste(finaldf$Date, finaldf$Time)
      finaldf$DateTime <- strptime(finaldf$DateTime , "%d/%m/%Y %H:%M:%S")
      
      #set 2 rows and 2 columns of plots
      par(mfrow = c(2,2))
      
      #open png file device
      #png(file="plot4.png", width=480, height=480, units="px")
      
      #create top-left linegraph of active power
      plot(finaldf$DateTime,finaldf$Global_active_power, type="l",
           xlab="", ylab="Global Active Power")
      
      #create top-right linegraph of voltage
      plot(finaldf$DateTime, finaldf$Voltage, type="l", xlab="datetime", ylab="Voltage")
      
      #create bottom-left linegraph of sub-metering
      plot(finaldf$DateTime, finaldf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
      lines(finaldf$DateTime, finaldf$Sub_metering_2, col="red")
      lines(finaldf$DateTime, finaldf$Sub_metering_3, col="blue")
      legend("topright", col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty="n", cex=.5)
      
      #create bottom-right linegraph of reactive power
      plot(finaldf$DateTime, finaldf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
      
      #dev.off() #close PNG device
      cat("plot4.png has been saved in", getwd())
}