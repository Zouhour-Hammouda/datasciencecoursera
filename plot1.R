data=read.table(file=file.choose(),header=T,sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data
head(data)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data

data <- data[complete.cases(data),]
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
## Remove Date and Time column
data <- data[ ,!(names(data) %in% c("Date","Time"))]
data <- cbind(dateTime, data)
head(data)
data$dateTime <- as.POSIXct(dateTime)
str(data)
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
getwd()
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()