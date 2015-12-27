# assume the file is downloaded and extracted under the working directory

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
Bal <- filter(NEI,fips=="24510")
aggregatedTotalByYear <- aggregate(Emissions ~ year, Bal, sum)

# png('plot1.png')
# barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, 
#        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
#        main=expression('Total PM'[2.5]*' emissions at various years'))
# dev.off()

plot(aggregatedTotalByYear,type="b",ylab="emmision total",xlab="year",xaxt="n")
axis(1,c("1999","2002","2005","2008"))
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()