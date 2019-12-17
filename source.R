# load libraries ----
library(readr)
library(stringr)
library(iptools)
library(IPtoCountry)
library(rgeolocate)

# read txt data into df
malwaredomainlist.ipset <- read.table("/Volumes/Extreme SSD/Repo_Git/Practica DataDriven/malwaredomainlist.ipset.txt", quote="\"", stringsAsFactors=FALSE)

file_header <- read.delim(file = "./malwaredomainlist.ipset.txt", stringsAsFactors = F)

#Millora Llegir directament d'URL

#Renombrar Columna header
colnames(file_header) <-"line"

##### clean data ----

## rename columns
# Copiar columna
malwaredomainlist.ipset$ips <- malwaredomainlist.ipset$V1


#Eliminar columna inicial
malwaredomainlist.ipset$V1 <- NULL

#charips <- malwaredomainlist.ipset


## add data from heading

# DATE
date_line_number <- grep(pattern = "# Source File Date:", x = file_header$line, fixed = T)
dataset_date <- str_split(file_header[date_line_number,],  pattern = ':', n = 2)[[1]][[2]]
dateset_date_trimmed <- str_trim(dataset_date)
malwaredomainlist.ipset$date <- date_trimmed

# CATEGORY
category_line <- grep(pattern = "# Category", x =file_header$line, fixed = T)
a <- str_split(file_header[category_line,], pattern = ':')[[1]][[2]]
category_trimmed <- str_trim(a)
malwaredomainlist.ipset$Category <- category_trimmed

# UPDATE FREQ
category_line <- grep(pattern = "# Update Frequency", x =file_header$line, fixed = T)
a <- str_split(file_header[category_line,], pattern = ':')[[1]][[2]]
category_trimmed <- str_trim(a)
malwaredomainlist.ipset$UpdateFreq <- category_trimmed


# prepare graphics

#IP_plot("2.2.2.2")






