library("maptools")
library(ggplot2)

data <- readShapeSpatial("MAMMTERR/Mammals_Terrestrial.shp")
species <- which(data$BINOMIAL=="Myotis lucifugus")

world_map <- map_data("world")

##
library(sp)
# library(spatstat) #don't think I used this
# library(gpclib) #or this
# spatstat.options(gpclib=TRUE) #or this
library(maptools)
data=readShapeSpatial("Mammals_Terrestrial.shp") #shape files for the distributions of every terrestrial mammal in the IUCN database
summary(data)
class(data)
#all of the species names in the shape files
all.binomial=data$BINOMIAL
#keep only the species I want from the IUCN shape files
keep=list()
for(i in 1:312){
  keep[[i]]=which(all.binomial==speciesnames2[i])
}
x=keep[[1]]

for(i in 2:312){
  x=c(x,keep[[i]])
}
keep=x
myspecies.distr=data[keep,]
#look at a couple of species distribution plots
plot(data[which(data$BINOMIAL=="Tadarida brasiliensis"),],col="red")
plot(data[which(data$BINOMIAL=="Miniopterus africanus"),],col="red")
