# README

In this folder are all the data and scripts that were used for the identification of lincRNA as predictive biomarkers. It is divided is 4 main sections, in order facilitate the organization of data and results.

Clinical data is provided in [/meta](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/meta) and raw data is provided in [/data](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data).

In the other hand, all the scripts are in [/bin](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/bin).

Below is indicated in cronological order the complete pipeline

## Quality Control (~/bin/1_QUALITY_CONTROL_TRANSCRIPTOME.R)

## Alignment (~/bin/2_COUNT_READS_TRANSCRIPTOME.R)

## Counting transcripts (~/bin/2_COUNT_READS_TRANSCRIPTOME.R)

## Differential expression analysis (~/bin/3_DIFF_EXP_ANALYSIS_TRANSCRIPTOME.R)

## Gene ontology (~/bin/3_DIFF_EXP_ANALYSIS_TRANSCRIPTOME.R)

## Gene Set Enrichment Analysis (WORK IN PROCESS! See [issue](https://github.com/LauraMCE/lncRNA_BC/issues/15)

## Network Analysis (WORK IN PROCESS!)

## Graphical results (~/bin/4_GRAPHICAL_ANALYSIS.R)

Results are provided in [/data/results](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data/results), in tables (.csv files)

Other graphical results are in [/Graphs](https://github.com/LauraMCE/lncRNA_BC/tree/master/Transcriptome/data/results), in tables (.csv files) (.jgp files). Principally heatmaps and volcano plots for friendly visualization of differential expression analysis results.
