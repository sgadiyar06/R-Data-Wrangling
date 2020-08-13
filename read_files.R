#reading files

library(tidyverse)
library(dslabs)
library(readxl)

dat <- read_csv('murders.csv')

#alternative 
# dat <- read_csv(fullpath)

head(dat)
class(dat)
#using read_csv gives tibble format

dat2 <- read.csv('murders.csv')
head(dat2)
class(dat2)
#using read.csv gives dataframe format


#downloading from the internet
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"

dat3 <- read_csv(url)

#we can also make temp files and to download and read files

download.file(url, "murders.csv")
tempfile()
tmp_filename <- tempfile()
download.file(url, tmp_filename)
dat4 <- read_csv(tmp_filename)
file.remove(tmp_filename)

# we used a temp file, loaded it in our workspace and then removed it