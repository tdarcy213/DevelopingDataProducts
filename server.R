## load the "zipcode" dataframe
library(zipcode)
data(zipcode)
## eliminate NA's, and add the "distance" column to the dataframe
zipcodes<-zipcode[complete.cases(zipcode),]
all9s<-99999.999999
zipcodes$distance<-all9s
##buildtable function:
##  Capture user input, then loop through dataframe and calculate 
##  distance from centroid via pythagorean algorithm.  Where the calculated
##  distance is within the user-entered target, update the dataframe with
##  the calculated distance.  At end, subset the dataframe to output only
##  those rows that were updated via the distance calculation.
buildtable<-function(zipcodes,zip1,howfar){
  howfar<-as.numeric(howfar)
  lat1<-zipcodes$latitude[zipcodes$zip==zip1]
  long1<-zipcodes$longitude[zipcodes$zip==zip1]
  nzips<-nrow(zipcodes)
  for(i in 1:nzips){
    zip<-zipcodes$zip[i]
    lat<-zipcodes$latitude[i]
    long<-zipcodes$longitude[i]
    zdist <- sqrt((69.1*(lat1-lat))^2+(69.1*(long1-long)*cos(lat/57.3))^2)
    if(zdist <=howfar) {
      zipcodes$distance[i]<-zdist
    }
    else
    {next
    }
  }
  zipcodes<-zipcodes[order(zipcodes$distance),]
  zipcodes<-zipcodes[zipcodes$distance!=all9s,]
  zipsout<<-zipcodes
  return(zipcodes)}
ziptable<-zipcodes

shinyServer(function(input, output) {
## reactive code that will return a rendered DataTable to the UI:  
  output$ziptable<-renderDataTable({
    if(input$SUBMIT==0)
    {return()}
    else{
      isolate(buildtable(zipcodes=ziptable,zip1=input$zip1,howfar=input$howfar))}
  })
  
## reactive code that will download a "csv" version of the derived zipcode
## table
  output$downloadData <- downloadHandler(
    filename = function() {
      paste('ziptable-', Sys.Date(), '.csv')
    },
    content = function(file) {
      write.csv(zipsout, file,row.names=FALSE)
    }
  )
}  )