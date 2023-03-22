## loading dataset
df <- read.delim("household_power_consumption.txt",sep=";")

## data extraction and transformation
df.data <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]
date.time <- paste(df.data$Date , df.data$Time)
df.data$Time=strptime(date.time,"%d/%m/%Y %H:%M:%S")
df.data$Date=as.Date(df.data$Date,"%d/%m/%Y")
df.data[3:9] <- apply(df.data[3:9],2,as.numeric)

## creating plot
png(filename = "plot3.png",width= 480, height= 480, units ="px")
plot(df.data$Time, df.data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(df.data$Time,df.data$Sub_metering_2,col="red")
lines(df.data$Time,df.data$Sub_metering_3,col="blue")
legend("topright", legend= names(df.data[7:9]), col=c("black","red","blue"), lty=1)
dev.off()


