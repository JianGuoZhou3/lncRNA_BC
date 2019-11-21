#Here will be the code for plotting variants in the genome, and it will be located in ~/data/results as .jpg files. Note that this is a NON Proved Script. See Repo_Analysis for details#

#Pre-requisites#

#R version 3.6#

#Package to detect Copy Number Variants#

BiocManager::install("exomeCopy")

library(exomeCopy)

#To compile CNV data#

compiled.segments <- compileCopyCountSegments(fit.list)
CNV.segments <- compiled.segments[compiled.segments$copy.count !=
+ 2]

CNV.overlaps.matrix <- as.matrix(findOverlaps(CNV.segments,
+ drop.self = TRUE))

#To plot CNV results#

par(mfrow = c(2, 1), mar = c(4, 3, 2, 1))
cnv.cols <- c("red", "orange", "black", "deepskyblue",
+ "blue")
plotCompiledCNV(CNV.segments = CNV.segments, seq.name = "chr1",
+ col = cnv.cols)
plotCompiledCNV(CNV.segments = CNV.segments, seq.name = "chr1a",
+ col = cnv.cols)
