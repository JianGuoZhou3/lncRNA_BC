##Pre-requisites##

install.packages("pheatmap") #v.1.0.12# #Package to construct heatmap#
install.packages("ggplot2") #v.3.2.1#

library(pheatmap)
library(ggplot2)

#Construct heatmap#

anhm <- data.frame(Response = c("No_response", "No_response", "No_response", "No_response", 
                                "No_response", "No_response", "No_response", "Response", 
                                "Response", "Response")) #Specifies annotation from metadata#
rownames(anhm) <- colnames(mat) #Merge names for data frame#
anhmcol = list( Response = c(Response = "#FF3333", No_response = "#0099CC"), 
                transcript_biotype = c(protein_coding = "#669900", lincRNA = "#CC0033")) #Specifies color code for annotation#
rld <-rlog(dds)
mat <- assay(rld)
mat <- mat - rowMeans(mat) #Prepares matrix for heatmap construction#
heatmap <- pheatmap(mat, annotation_col = anhm, annotation_colors = anhmcol, annotation_row = geneannot, fontsize = 5) #It automatically prints a heatmap#
dev.copy(heatmap, "~/lncRNA_BC/Transcriptome/Graphs/hm.jpg") #Save heatmap#

#Construct Volcano Plot#

##Indicate data to plot##

cols <- densCols(BCresultsNR$log2FoldChange, BCresultsNR$sig)

##Indicate color code##

cols[CMLArRESULT$log2FoldChange < -1.5] <- "#0066FF"
cols[CMLArRESULT$log2FoldChange > 1.5] <- "#0033CC"
cols[CMLArRESULT$pvalue == 0] <- "black"
cols[CMLArRESULT$pvalue > 0.05] <- "#CCCCCC"

##Other graphical parameters##

CMLARESULT$pch <- 19
CMLARESULT$pch[CMLARESULT$pvalue ==0] <- 6
VP <-plot(CMLARESULT$log2FoldChange,
     CMLARESULT$sig,
     col=cols, panel.first=grid(),
     main="all RNA",
     xlab="log2(fold-change)",
     ylab="-log10(adjusted p-value)",
     pch=CMLARESULT$pch, cex=0.8)
abline(v=0)
abline(v=c(-1,1), col="brown") #Indicates line cutoff (graphical only)#
dev.copy(VP, "~/lncRNA_BC/Transcriptome/Graphs/VP.jpg") #Save volcano plot#

##Generate PCA data##

PCA <- plotPCA(rld, intgroup = "Response", returnData=TRUE) #Calculate principal component analysis#

##Plot PCA from PC results##

PC <- plot(PCA$PC1, PCA$PC2, xlab= "PC1: 33% variance", ylab="PC2: 20% variance", 
     pch=16, cex = 3, col = c("#00CCFF", "#00CCFF", "#00CCFF", "#00CCFF", "#00CCFF", "#00CCFF", "#00CCFF", "#00CCFF", "#FF3333", "#FF3333"), 
     xlim= c(-40, 20), ylim= c(-20, 30)) + text(PCA$PC1, PCA$PC2, labels = PCA$name, cex=1, pos= 4) #Plot PCA#
dev.copy(PC, "~/lncRNA_BC/Transcriptome/Graphs/PC.jpg") #Save PCA plot#