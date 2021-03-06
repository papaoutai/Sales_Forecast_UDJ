
# Project Name: "Sales Forecast Regression Exercise"

rm(list = ls()) # clean up the workspace

######################################################################

# THESE ARE THE PROJECT PARAMETERS NEEDED TO GENERATE THE REPORT

# When running the case on a local computer, modify this in case you saved the case in a different directory 
# (e.g. local_directory <- "C:/user/MyDocuments" )
# type in the Console below help(getwd) and help(setwd) for more information
local_directory <- getwd()

# Clean up any left over tmp directories
clean1 <- unlink(paste(local_directory,"../TMPdirReport",sep="/"), recursive = TRUE )      
clean2 <- unlink(paste(local_directory,"../TMPdirSlides",sep="/"), recursive = TRUE )      
if (clean1 + clean2)
  setwd("../")
local_directory <- getwd()
cat("\n *********\n WORKING DIRECTORY IS ", local_directory, "\n PLEASE CHANGE IT IF IT IS NOT CORRECT using setwd(..) - type help(setwd) for more information \n *********")

# Please ENTER the name of the file with the data used. The file should contain a matrix with one row per observation (e.g. person) and one column per attribute. THE NAME OF THIS MATRIX NEEDS TO BE ProjectData (otherwise you will need to replace the name of the ProjectData variable below with whatever your variable name is, which you can see in your Workspace window after you load your file)
datafile_name <- "SALES.csv" # this is the default name of the data for a project

# this loads the selected data
ProjectData <- read.csv(paste("data", datafile_name, sep = "/"), sep=";", dec=",") # this contains only the matrix ProjectData

# Please ENTER the dependent variable
dependent_variable <- "SALES"

# Please ENTER the independent variable
independent_variables <- c("PDI", "DEALS", "PRICE", "R.D", "INVEST", 
                           "ADVERTIS", "EXPENSE", "TOTINDAD")


###########################
# Would you like to also start a web application on YOUR LOCAL COMPUTER once the report and slides are generated?
# Select start_webapp <- 1 ONLY if you run the case on your local computer
# NOTE: Running the web application on your LOCAL computer will open a new browser tab
# Otherwise, when running on a server the application will be automatically available
# through the ShinyApps directory

# 1: start application on LOCAL computer, 0: do not start it
# SELECT 0 if you are running the application on a server 
# (DEFAULT is 0). 
# NOTE: You need to make sure the shiny library is installing (see below)
start_local_webapp <- 0

################################################
# Now run everything

source(paste(local_directory,"R/library.R", sep="/"))
source(paste(local_directory,"R/heatmapOutput.R", sep = "/"))
source(paste(local_directory,"R/runcode.R", sep = "/"))

if (start_local_webapp){
  
  # MAKE SURE THIS INSTALLS FINE if a local web app is to be use - the local computer needs
  # to have the shiny library to run the shiny apps
  if (require(shiny) == FALSE) 
    install_libraries("shiny")
  if (require(shinyRGL) == FALSE) 
    install_github("shinyRGL", "trestletech")
  if (require(shiny-incubator) == FALSE) 
    install_github("shiny-incubator", "rstudio")
  
  # first load the data files in the data directory so that the App see them
  Sales <- read.csv(paste("data", "SALES.csv", sep = "/"), sep=";", dec=",") # this contains only the matrix ProjectData
  Life <- read.csv(paste("data", "LIFE.csv", sep = "/"), sep=";", dec=",") # this contains only the matrix ProjectData
  ProjectData <- read.csv(paste("data", "SALES.csv", sep = "/"), sep=";", dec=",") # this contains only the matrix ProjectData

  # now run the app
  runApp(paste(local_directory,"tools", sep="/"))  
}
