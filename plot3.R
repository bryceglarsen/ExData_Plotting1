plot3 <- function(file){
      #read in file
      powerdata <- read.table(file, header = TRUE, sep=";", na.strings ="?")
      #powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
      powerdata$Global_active_power <- as.numeric(as.character((powerdata$Global_active_power)))
      
      #subset date based on date parameters
      finaldf <- subset(powerdata, as.Date(powerdata$Date,"%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date,"%d/%m/%Y") == "2007-02-02")
      
      #create timestamp for plotting
      finaldf$DateTime <- paste(finaldf$Date, finaldf$Time)
      finaldf$DateTime <- strptime(finaldf$DateTime , "%d/%m/%Y %H:%M:%S")

      #open png file device
      png(file="plot3.png", width=480, height=480, units="px")
      
      #create linegraphs over sub meter energy
      plot(finaldf$DateTime, finaldf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
      lines(finaldf$DateTime, finaldf$Sub_metering_2, col="red")
      lines(finaldf$DateTime, finaldf$Sub_metering_3, col="blue")
      legend("topright", col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))
      
      dev.off() #close PNG device
      cat("plot3.png has been saved in", getwd())
}