# lncRNA_BC

## ABSTRACT
It is a repository that contains information about my master's project. The main topic is lincRNA as biomarkers in breast cancer. The main objective is to identificate lincRNA biomarkers by transcriptome analysis

## INTRODUCTION

This repository is divided into 2 kinds of analysis:

1. Transcriptome Analysis
2. Exome Analysis


Transcriptome Analysis is for identification of lincRNA over or sub expressed in breast cancer patients who didn't response to neoadjuvant chemotherapy treatment. The main objective for this analysis is to identify the association of this lincRNA with coding genes and how they are involved in chemoresistance mechanisms

In the other hand, the exome analysis is performed with the objective to identify the possible genetic cause of the distortion in coding gene expression profiles in chemoresistance in breast cancer patients, and if it is related to some clinical variables, like molecular subtype or hormonal receptors expression. With this information, we will be able to associate the genetic profile of coding genes to prognostic and prediction in order to provide benefits for patients management.

The final aim of this whole project is to predict functional association between lincRNA and coding genes through bioinformatic analysis and then validate them to identify possible therapeutic targets and panels of biomarkers for prediction and prognostic in breast cancer patients.

## INDEX

1. [Transcriptome analysis](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome) ```..\lncRNA_BC\Transcriptome```: It contains folders with RNA-Seq data, scripts, metadata and graphical results of the bioinformatic analysis. It contains a [README](https://github.com/LauraMCE/lncRNA_BC/blob/master/Transcriptome/README.md) too.

- [Scripts and pipeline](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/bin) ```..\lncRNA_BC\Transcriptome\bin```: It contains .R files with functions and scripts for the biomarker identification pipeline, and they are by numerical order of use. The complete pipeline is specified in README.md.

- [Data](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data) ```..\lncRNA_BC\Transcriptome\data```: It contains all RNA-Seq raw data (fastq files). It contains also the reference genome in .fasta and .gff3 format.

   - Results ```..\lncRNA_BC\Transcriptome\data\results```: It contains all the processed files, and is subdivided into:
       - Quality ```..\lncRNA_BC\Transcriptome\data\results\quality```: It contains all the FastQC quality reports in .pdf format.

      - Tables ```..\lncRNA_BC\Transcriptome\data\results\tables```: It contains the output of transcripts counts in .csv.

      - DESeq ```..\lncRNA_BC\Transcriptome\data\results\DESeq```: It contains DESeq2 objects.

- Meta ```..\lncRNA_BC\Transcriptome\meta```: It contains the clinical information about samples in .csv format.

- Graphs ```..\lncRNA_BC\Transcriptome\Graphs```: It contains .jpeg and .tiff graphical results.

2. [Exome analysis](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome) ```..\lncRNA_BC\Exome```: It contains folders with exome data, scripts, metadata and graphical results of the bioinformatic analysis. It contains a [README](https://github.com/LauraMCE/lncRNA_BC/blob/master/Exome/README.md) too.

- Scripts and pipeline ```..\lncRNA_BC\Exome\bin```: It contains .R files with functions and scripts for the biomarker identification pipeline, and they are by numerical order of use. The complete pipeline is specified in README.md.

- Data ```..\lncRNA_BC\Exome\data```: It contains all exome raw data (fastq files). It contains also the reference genome in .fasta and .gff3 format.
		
    - Results ```..\lncRNA_BC\Exome\data\results```: It contains all the processed files, and is subdivided into:
			
       - Quality ```..\lncRNA_BC\Exome\data\results\quality```: It contains all the FastQC quality reports in .pdf format.
  
- Meta ```..\lncRNA_BC\Exome\meta```: It contains the clinical information about samples in .csv format.
		
# APENDIX 1

Selected topics of Bioinformatics ([STB](https://github.com/LauraMCE/lncRNA_BC/tree/master/STB))

~~~
..\lncRNA_BC\STB

~~~

This folders contains activities from our course.

