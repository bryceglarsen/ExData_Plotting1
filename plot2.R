plot2 <- function(file){
      #read in file
      powerdata <- read.table(file, header = TRUE, sep=";", na.strings ="?")
      #powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
      powerdata$Global_active_power <- as.numeric(as.character((powerdata$Global_active_power)))
      
      #subset date based on date parameters
      finaldf <- subset(powerdata, as.Date(powerdata$Date,"%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date,"%d/%m/%Y") == "2007-02-02")

      #create timestamp for plotting
      finaldf$DateTime <- paste(finaldf$Date, finaldf$Time)
      finaldf$DateTime <- strptime(finaldf$DateTime , "%d/%m/%Y %H:%M:%S")
      
      #print(finaldf$DateTime)
      #plot(finaldf$DateTime,finaldf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
      
      #open png file device
      png(file="plot2.png", width=480, height=480, units="px")
      
      #create linegraph of active power
      plot(finaldf$DateTime,finaldf$Global_active_power, type="l",
           xlab="", ylab="Global Active Power (kilowatts)")
      dev.off() #close PNG device
      cat("plot2.png has been saved in", getwd())
}