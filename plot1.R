plot1 <- function(file, date1 = '2007-2-1', date2 = '2007-2-2'){
      #read in file
      #convert date column into date format
      #convert time column into time format
      powerdata <- read.table(file, header = TRUE, sep=";", na.strings ="?")
      powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
      powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")
      
      #convert user supplied dates into date format
      date1 <- as.Date(date1, format="%Y-%m-%d")
      date2 <- as.Date(date2, format="%Y-%m-%d")
      
      #subset table based on user provided date parameters
      finaldf <- powerdata[powerdata$Date >= date1 & powerdata$Date <= date2,]
      
      #open png file device
      png(file="plot1.png", width=480, height=480, units="px")
      #create histogram of active power
      hist(finaldf$Global_active_power, main="Global Active Power", 
           xlab="Global Activer Power (kilowatts)", col="red")
      dev.off() #close PNG device
      cat("plot1.png has been saved in", getwd())
}