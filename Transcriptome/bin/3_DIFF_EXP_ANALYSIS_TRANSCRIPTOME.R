##Pre-requisites##

library(BiocManager)

BiocManager::install("DESeq2") ##Install DESeq2 package for differential expression analysis. v.1.24.0## 
BiocManager::install("goseq") #Install packages for Gene Ontology Analysis v.1.36.0#
BiocManager::install("GO.db") #v.3.8.2#

library(DESeq2)
library(goseq)
library(GO.db)

##Generate a dds object##
setwd("~/lncRNA_BC")
clinic <- read.table("~/lncRNA_BC/Transcriptome/meta/clinic.csv") ##To obtain metadata for differential expression analysis##
dds <- DESeqDataSetFromMatrix(countData = genelevels, colData = clinic, design = ~ Response) ##Generates a dds object, which will be used for DESeq2##

##Run differential expression analysis with DESeq2##
CMLADE <- DESeq(dds)
CMLARESULT <- results(BCDE, contrast = c("Response", "No_response","Response")) ##To obtain differential expressed genes from No_response group##

##To obtain only significant differential genes##

CMLADIFF <- subset(CMLARESULT, CMLARESULT$padj < 0.05)

CMLADIFFCUT <- subset(CMLADIFFCUT, CMLADIFF$log2FoldChange > 1.5) ##To obtain only differential expressed genes significant and overexpressed in No_response patients##

write.csv(CMLADIFF, "~/lncRNA_BC/Transcriptome/data/results/tables/CMLADIFF.csv")

##Gene Ontology Analysis##

GOCMLA = CMLADIFF ##Creates GO object##

names(GOCMLA) = rownames(GOCMLA[GOCMLA$log2FoldChange!=0,]) #Assign names to dataframe#

pwf=nullp(GOCMLA,"hg38","ensGene") #Creates GO annotation##

GO <- goseq(pwf, "hg38", "ensGene") #GO Results#

#Printing GO terms and results#

enrichedGO=GO$category[p.adjust(GO$over_represented_pvalue, method = "BH")< 0.05] #Only shows significant pathways#

for(go in enrichedGO){
  + print(GOTERM[[go]])}

GOENR <- print(GOTERM[[enrichedGO]]) #Prints GO ID results#

GOK <- print(GOTERM[[enrichedKEGG]]) #Prints GO ID results for KEGG#
