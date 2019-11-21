# README
## Exome analysis

In this folder will be all the data and scripts that were used for the identification of lincRNA as predictive biomarkers. It is divided in 3 main sections, in order to facilitate the organization of data and results. It is organized in 3 folders: /data, /meta and /bin, which are describe below:

## [/data](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome/data)

All raw data will be provided in [/data](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome/data), as is specified in [Exome_data.txt](https://github.com/LauraMCE/lncRNA_BC/blob/master/Exome/data/Exome_data.txt). This folder will contain 20 .fastqsanger files, identified by this code:

CMLA#XX_#.fastq

(Patient's ID)(Response group: NR = No response, R = Response)_(Orientation of paired-end reads: 1=Forward, 2=Reverse).extension

Results will be also provided in [/data/result](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome/data/result), which will be results as plots and .txt files, as is specified in [CNVCALLING.txt](https://github.com/LauraMCE/lncRNA_BC/blob/master/Exome/data/result/CNVCALLING.txt).

In [/data/results/quality](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome/data/result/quality) will be soon quality reports from QC analysis for 4 representative samples: CMLA1 and CMLA2 for No_Response group and CMLA9 and CMLA10 for Response group, which follows code name from /data, the same as in /Transcriptome/data, as is specifies in [CMLAQC.txt](https://github.com/LauraMCE/lncRNA_BC/blob/master/Exome/data/result/quality/CMLAQC.txt).

## [/bin](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome/bin)

In the other hand, all the scripts will be in [/bin](https://github.com/LauraMCE/lncRNA_BC/tree/master/Exome/bin). The complete pipeline is indicated below in cronological order

### 1_QUALITY_CONTROL_AND_SEQUENCE_ALIGNMENT.R (~/bin/1_QUALITY_CONTROL_AND_SEQUENCE_ALIGNMENT.R)

This script allows you to perform a quality analysis for fastq files and save the results in ~/data/result/quality. It also allows you to create alignment files (.sam files) and save it in ~/data/AlignFiles, as is specified in [CMLAALIGNEDFILES.txt](https://github.com/LauraMCE/lncRNA_BC/blob/master/Exome/data/AlignFiles/CMLAALIGNEDFILES.txt).

### 2_CALL_VAR.R (~/bin/2_CALL_VAR.R)

This script performs the alignment of sequence reads to the reference genome [hg38](https://www.gencodegenes.org/human/)(Comprehensive gene annotation GTF file, which contain ALL regions in genome). After that, this script generates a count table file to perform differential expression analysis with DESeq2 (Next script).

### 3_DIFF_EXP_ANALYSIS_TRANSCRIPTOME.R (~/bin/3_DIFF_EXP_ANALYSIS_TRANSCRIPTOME.R)

This script uses the DESeq2 tool to perform a differential expression analysis. It also allows to perform a gene ontology analysis, and print the results in .csv in ~/data/results/tables.

### Gene Set Enrichment Analysis (WORK IN PROCESS! See [issue](https://github.com/LauraMCE/lncRNA_BC/issues/15))

### Network Analysis (WORK IN PROCESS!)

### 4_GRAPHICAL_ANALYSIS.R (~/bin/4_GRAPHICAL_ANALYSIS.R)

This separate script enables the user to to modify or add graphical analyses. By default it contains the code to generate Volcano plots and heatmaps from DESEQ2 results, and then save them in ~/Graphs.

### OTHERS

The files [Choc_GSEA](https://github.com/LauraMCE/lncRNA_BC/blob/master/Transcriptome/bin/Choc_GSEA) and [Choc_Volcano_plot](https://github.com/LauraMCE/lncRNA_BC/blob/master/Transcriptome/bin/Choc_Volcano_plot) are 2 scripts that had errors and were added to solve a [GSEA](https://github.com/LauraMCE/lncRNA_BC/issues/15) and a [graphical](https://github.com/LauraMCE/lncRNA_BC/issues/8) issues. Because they were closed, the corrected code was inserted in their respective .R data in /bin.

## [/meta](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/meta)

Clinical data is provided in [/meta](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/meta), which contains a .txt table with clinical relevant information for Response to treatment analysis: Patient's ID, Response and Clincal tage (Stage).
