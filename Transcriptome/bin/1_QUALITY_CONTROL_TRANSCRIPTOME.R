#Pre-requisites##

#R version 3.6#

##Packages to import files##

install.packages("plyr", "readr", "htmltools") #v. 1.8.4, v.1.3.1 & 0.3.6#

##Packages for Quality Control##

install.packages("BiocManager") #v. 3.0#

library(plyr)
library(readr)
library(htmltools)
library(BiocManager)

BiocManager::install("Rqc") #v.1.18.0#
BiocManager::install("BiocStyle") #v.3.9#

library(BiocStyle)
library(Rqc)

#Import files to R environment
setwd("../")
CMLA = "Transcriptome"
FASTQFILES = list.files(path=CMLA, pattern = "*.fastqsanger", fullnames = TRUE)
FASTQFILES

#Quality control for .fastqfiles#

CMLA_QC <- system.file(package="ShortRead", "fastqfiles")
list.files(CMLA_QC, ".fastqsanger", full.names=TRUE) #Indicates files for QC report#
QC <- rqcQA(files, workers=1) #Run QC analysis#
QC_REPORT <- rqcReport(QC) #Print and save QC report#
browseURL(QC_REPORT) #Visualize QC report#
save_html(QC_REPORT, "../Transcriptome/data/results/quality/QC.html", background = "white", libdir = "CMLA") #Save html file#
