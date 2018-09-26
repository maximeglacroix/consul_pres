library(readr)
library(countrycode)

data_csv <- as.data.frame(read_csv("C:/Users/Maxime Lacroix/Downloads/data_csv.csv"))
head(data_csv)
data_csv$continent <- factor(countrycode(sourcevar = data_csv[, "Country Code"],
                                     origin = "iso3c",
                                     destination = "continent"))
data_csv$Value <- data_csv$Value / 100
data_csv$Decennie <- ifelse(data_csv$Year<2000,1990,
                       ifelse(data_csv$Year<2010,2000,2010))
dat_prop <- data_csv[!is.na(data_csv$continent),]
dat_prop <- dat_prop[dat_prop$Value>0,]
hist(dat_prop$Value,main="Histogramme des proportions de femmes au parlement",
     freq=TRUE,
     xlab="Proportion",
     ylab="Nombre")
