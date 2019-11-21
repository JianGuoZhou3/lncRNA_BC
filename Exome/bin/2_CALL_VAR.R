#Pre-requisites##

#R version 3.6#

#Package to convert SAM to BAM#

BiocManager::install("Rsamtools")

#Package to detect Copy Number Variants#

BiocManager::install("exomeCopy")

library(Rsamtools)
library(exomeCopy)

#Detect copy number variants#

for (i in ../Exome/data/AlignFiles);
{
asSam(*.sam, destination=sub("\\.bam", ""), indexDestination=TRUE)}  #Converts SAM to BAM files#


library(exomeCopy)

bam.files <- list.files(../Exome/data/AlignFiles/*.bam) #Set all BAM files to work with#
sample.names <- c(clinic$ID) #Set names of samples#
reference.file <- "../Exome/data/HG38.gtf" #Stablish reference genome#
runExomeCopy <- function(sample.name, seqs) {
+ lapply(seqs, function(seq.name) exomeCopy(example.counts[seqnames(example.counts) ==
+ seq.name], sample.name, X.names = c("log.bg",
+ "GC", "GC.sq", "width"), S = 0:4, d = 2))
+ }
seqs <- c("chr1", "chr1a")
samples <- exome.samples[1:8]
names(samples) <- samples
t0 <- as.numeric(proc.time()[3])
fit.list <- lapply(samples, runExomeCopy, seqs)
t1 <- as.numeric(proc.time()[3])
time.elapsed <- as.numeric(t1 - t0) #This is a NON Proved script. Please check Repo_Analysis#
