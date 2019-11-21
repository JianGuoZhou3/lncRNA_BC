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

#Packages for Alignment#

BiocManager::install("Rbowtie")

library(Rbowtie)

#Import files to R environment
setwd("../")
CMLA = "Exome"
FASTQFILES = list.files(path=CMLA, pattern = "*.fastqsanger", fullnames = TRUE)
FASTQFILES

#Quality control for .fastqfiles#

CMLA_QC <- system.file(package="ShortRead", "fastqfiles")
list.files(CMLA_QC, ".fastqsanger", full.names=TRUE) #Indicates files for QC report#
QC <- rqcQA(files, workers=1) #Run QC analysis#
QC_REPORT <- rqcReport(QC) #Print and save QC report#
browseURL(QC_REPORT) #Visualize QC report#
save_html(QC_REPORT, "../Exome/data/results/quality/CMLA*_*.html", background = "white", libdir = "CMLA") #Save html file#

#Import reference genome: You should download Fasta file Genome Sequence (GRCh38.p.13) from here https://www.gencodegenes.org/human/ (FASTA FILE, ALL) and copy in here ../Exome/data/ #
setwd("../")
load("../Exome/data/GRCh38.p13.genome.fa.gz") ##You must unzip it before you work with fasta file##
HG38 <- unzip(GRCh38.p13.genome.fa.gz) #To unzip file#

#Read alignment#

tmp <- bowtie_build(references= ../Exome/data/HG38.fasta, outdir=indexDir, prefix="index", force=TRUE)  #To build a genomic index#
head(tmp)

for i in data; 
do
bowtie(sequences=../Exome/data/*.fastqsanger, 
       index=file.path(indexDir, "index"),       #To align and save sequence's alignment#
       outfile=../Exome/data/samFiles, sam=TRUE,
       best=TRUE, force=TRUE)
done

