#Pre-requisites#

library(BiocManager) #v.3.9#

##To install QuasR tool for alignment and counting##

BiocManager::install("QuasR") #v.1.24.2#
BiocManager::install("org.Hs.eg.db") #v.3.8.2#
BiocManager::install("BSgenome") #v.1.52.0#
BiocManager::install("Rsamtools") #v.2.0.3#
BiocManager::install("rtracklayer") #v.1.44.4#
BiocManager::install("GenomicFeatures") #v.1.36.4#
BiocManager::install("Gviz") #v.1.28.3#

library(QuasR)
library(org.Hs.eg.db)
library(BSgenome)
library(Rsamtools)
library(rtracklayer)
library(GenomicFeatures)
library(Gviz)

#Import reference genome: You should download Fasta file Genome Sequence (GRCh38.p.13) from here https://www.gencodegenes.org/human/ and copy in here ~/lncRNA_BC/Transcriptome/data/ #
setwd("~/lncRNA_BC")
load("~/lncRNA_BC/Transcriptome/data/GRCh38.p13.genome.fa.gz") ##You must unzip it before you work with fasta file##
HG38 <- unzip(GRCh38.p13.genome.fa.gz) #To unzip file#

#To align FASTQ files
alread <- qAlign(sampleFile = FASTQFILES, genome = HG38, splicedAlignment = TRUE, 
               paired = "fr")

#To annotate transcripts. You should download gtf file GComprehensive gene annotation (v.32) from here https://www.gencodegenes.org/human/ and copy in here ~/lncRNA_BC/Transcriptome/data/#

load("~/lncRNA_BC/Transcriptome/data/gencode.v32.annotation.gtf.gz") ##You must unzip it before you work with fasta file##
annofile <- unzip(gencode.v32.annotation.gtf.gz) #To unzip file#
chrlen <- scanFaIndex(HG38)
chrominfo <- data.frame(chrom = as.character(seqnames(chrlen)), length = width(chrlen), 
                        is_circular = rep(FALSE, length(chrlen))) ##Generates data frame for annotation##
txdb <- makeTxDbFromGFF(file = annotfile, format = "gtf", chrominfo = chrominfo, 
                        dataSource = "Ensembl", organism = "Homo sapiens") ##Generates a TxDb object of annotation for counting#

##Count reads and generate tables##

genelevels <- qCount(algene, txdb, reportLevel = "gene") ##It is the tool for counting. It generates a count table automatically##

##Getting annotations for genes##

geneannot <- select(org.Hs.eg.db, keys = rownames(genelevels), keytype = "ENSEMBL", 
                    columns = c("ENTREZID", "SYMBOL", "GENENAME", "BYOTYPE")) ##It specifies the data you want to annotate and additional information you want to know##

geneannot <- geneannot[!duplicated(geneannot$ENSEMBL), ]
rownames(geneannot) <- geneannot$ENSEMBL
geneannot$ENSEMBL <- NULL
identical(rownames(genelevels), rownames(geneannot)) ##It generates a table for genes annnotations, names and byotypes (for lncRNA selection) and the count table##

