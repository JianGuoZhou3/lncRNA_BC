#Pre-requisites##

#R version 3.6#

#Package to convert SAM to BAM#

BiocManager::install("Rsamtools")

#Package to detect Copy Number Variants#

BiocManager::install("exomeCopy")

library(Rsamtools)
library(exomeCopy)

#Detect copy number variants#

for i in ../Exome/data/AlignFiles;
{
asSam(*.sam, destination=sub("\\.bam", ""), indexDestination=TRUE)}  #Converts SAM to BAM files#


library(exomeCopy)
target.file <- "targets.bed"
bam.files <- list.files(*.bam)
sample.names <- c(clinic$ID)
reference.file <- "../Exome/data/HG38.gtf"
target.df <- read.delim(target.file, header = FALSE)
target <- GRanges(seqname = target.df[, 1], IRanges(start = target.df[,+ 2] + 1, end = target.df[, 3]))
counts <- target
for (i in 1:length(bam.files)) {
+ mcols(counts)[[sample.names[i]]] <- countBamInGRanges(bam.files[i],
+ target)
+ }
counts$GC <- getGCcontent(target, reference.file)
counts$GC.sq <- counts$GC^2
counts$bg <- generateBackground(sample.names, counts,
+ median)
counts$log.bg <- log(counts$bg + 0.1)
counts$width <- width(counts)
fit.list <- lapply(sample.names, function(sample.name) {
+ lapply(seqlevels(target), function(seq.name) {
+ exomeCopy(counts[seqnames(counts) == seq.name],
2
+ sample.name, X.names = c("log.bg", "GC",
+ "GC.sq", "width"), S = 0:4, d = 2)
+ })
+ })
compiled.segments <- compileCopyCountSegments(fit.list)
