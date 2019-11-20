# README

In this folder are all the data and scripts that were used for the identification of lincRNA as predictive biomarkers. It is divided in 4 main sections, in order to facilitate the organization of data and results. It is organized in 4 folders: /data, /meta, /bin and /Graphs, which are describe below:

## [/data](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data)

All raw data is provided in [/data](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data).

In the other hand, all the scripts are in [/bin](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/bin). The complete pipeline is indicated below in cronological order

### 1_QUALITY_CONTROL_TRANSCRIPTOME.R (~/bin/1_QUALITY_CONTROL_TRANSCRIPTOME.R)

This script allows you to perform a quality analysis for fastq files and save the results in ~/data/results/quality.

### 2_COUNT_READS_TRANSCRIPTOME.R (~/bin/2_COUNT_READS_TRANSCRIPTOME.R)

This script performs the alignment of sequence reads to the reference genome hg38. After that, this script generates a count table file to perform differential expression analysis with DESeq2 (Next script).

### 3_DIFF_EXP_ANALYSIS_TRANSCRIPTOME.R (~/bin/3_DIFF_EXP_ANALYSIS_TRANSCRIPTOME.R)

This script uses the DESeq2 tool to perform a differential expression analysis. It also allows to perform a gene ontology analysis, and print the results in .csv in ~/data/results/tables.

### Gene Set Enrichment Analysis (WORK IN PROCESS! See [issue](https://github.com/LauraMCE/lncRNA_BC/issues/15))

### Network Analysis (WORK IN PROCESS!)

### 4_GRAPHICAL_ANALYSIS.R (~/bin/4_GRAPHICAL_ANALYSIS.R)

This separate script enables the user to to modify or add graphical analyses. By default it contains the code to generate Volcano plots and heatmaps from DESEQ2 results, and then save them in ~/Graphs.

## [/meta](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/meta)

Clinical data is provided in [/meta](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/meta), which contains a .txt table with clinical relevant information for Response to treatment analysis: Patient's ID, Response and Clincal tage (Stage).

Results are provided in [/data/results](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data/results), in [/data/results/tables](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data/results/tables) there is the summary result table of differential expression analysis (.csv file). In [/data/results/quality](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data/results/quality) there are quality reports from QC analysis

Other graphical results are in [/Graphs](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/Graphs) (.jgp and .png files). Principally heatmaps and volcano plots for friendly visualization of differential expression analysis results.
