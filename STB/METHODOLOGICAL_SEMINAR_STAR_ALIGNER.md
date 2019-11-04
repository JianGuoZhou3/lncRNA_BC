# Methodological Seminar: STAR aligner

## Introduction

RNA-Seq is a molecular biology methodology based on next generation sequencing that is use to detect presence and quantity of RNA into a sample at a given moment (Figure 1), that is known as *Transcriptome* (Kukurba, 2015). In clinical research, RNA-Seq is a powerful tool because we can analyze RNA splicing, post-transcriptional modifications, gene fusions, mutations and differentially expressed genes, providing us a broad molecular description and  allowing the identification of new molecular targets for treatment and new biomarkers in prognostic and in the prediction of treatment response (Soneson, 2016).

![RNASeq.jpg](https://github.com/LauraMCE/lncRNA_BC/edit/master/STB/RNASeq.jpg?raw=true)

Figure 1: **RNA Sequencing**. We can select only poly-A RNA for sequencing (left) or total RNA (poly-A and non poly-Adenilated RNA). Then, RNA must be fragmented to perform reverse transcription to obtain cDNA. Adapters and identifiers then will be added to finally carry out the sequencing process.

The RNA sequencing results are informative when we assign a meaning to all this information. To do that, we process sequencing data in a general workflow as is shown in Figure 2. In overview, we have a sample of which we want to know its transcriptional profile, so we prepare a library for sequencing, and then we obtain a file wich includes all the RNA sequences found in our sample. To ensure realiable results, we analyze first the quality of our samples, then we retire the adapters and then we look for the genes that correspond to this sequences, and how many copies of these genes we have, to determine which genes could give us information about our sample.



![RNAseqWorkflow.png](https://github.com/LauraMCE/lncRNA_BC/edit/master/STB/RNAseqWorkflow.png?raw=true)



Figure 2: **RNA-Seq general workflow**.

Although all steps are important, is specially essential the step in which we look for the correspondence of sequences in our data and genes in the genome, that is called *Alignment*. For this step, there are many tools that are capable to map our sequences in the genome and to align them to it, to know then how many times these genes were expressed, in other words, to count the number of reads that align to every gene. In the end, the differences in gene counting will give us a differential expression profile which will give us information about the transcriptome of our sample, and we can select genes of our interest to do inferences about a biological process and to validate it with directed experiments (Raplee, 2019).

One of these bioinformatic tools is STAR, an aligner use in RNA-Seq analysis principally in differential expression analysis workflows.  It has been prove that STAR together with edgeR are well suited tools for differential expression analysis, even when the RNA quality could compromised the reliability of the results (i.e. formalin-fixed paraffin-embedded samples), which converts STAR in and advantageous tool to achieve the identification of genes important in specific biological processes (Raplee, 2019).



## STAR aligner

**Spliced Transcripts Alignment to a Reference** (STAR) is an algorithm to align sequences to a reference genome, that was specially design to implement spliced alignments and has the potential to accurately align long reads (several kilobases). This is possible because STAR is capable to align non-contiguous sequences directly to a reference genome, in contrast to other tools, which are based in contiguous short reads that then were compared with a splice junctions database or in split-reads alignment (Dobin, 2013).

STAR algorith is divided in two pahses. In the first phase, STAR searches for seeds by looking for sequential Maximal Mapable Prefixes (MMP), that is the longest substring that matches exactly one or more substrings on a genome sequence. When the algorithm finds a MMP in the first base of a read, it could be mapped contiguosly or not depending on the presence of splice junctions. If splice junctions are present, then the seed will be mapped on a donor splice site, and the search of MMP starts again for the unmapped portion of the read, that could be located on an acceptor splice site.  Aditionally, STAR can find multiple mismatches with the same approach of MMP. If MMP does not reach the end of a read because of mismatches, the same MMP could be extended allowing the alignment of mismatches (Figure 3) (Dobin, 2013). 



![MMP.jpg](https://github.com/LauraMCE/lncRNA_BC/edit/master/STB/MMP.jpg?raw=true)

Figure 3: **Schematic representation of the Maximum Mappable Prefix**
**search** in the STAR algorithm for detecting (a) splice junctions, (b) mismatches
and (c) tails (Dobin, 2013).

In the second phase, STAR builds the alignment of the read sequence by "stitching" together all the seeds found in the first phase. This is made by clustering the seeds together by proximity to a selected set of "anchor" seeds. This set is defined in genomic windows by the user, and their sizes determines the maximum intron size for spliced alignments. For clustering, the algorithm assumes a local linear transcription model. If a read sequence is not covered by an alignment within one genomic window, STAR will look for two or more windows that could cover the read, resulting in chimeric alignments, which is useful when we look for gene fusions. For a deeper explanation, you can read [here]( https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/lessons/03_alignment.html ).



### Advantages in implementing STAR in RNA-Seq workflow



- Because the stitching and genomic windows are user-defined, STAR algorithm allows a quantitative assessment for the alignment qualities.
- STAR requieres lower computational effort than other tools, because it consumes approximately 27 GB of RAM for aligning the human genome, and it could be reduced to <16 GB.
- Because of the MMP method, STAR is able to detect mismatches, insertions, deletions and gene fusions.
- STAR can implement read quantification in stranded mode.



### STAR CODE

- Installing in Linux-like environment (Ubuntu).

Download STAR from [here](https://github.com/alexdobin/STAR). Then compile it with *make* in source directory.

```
#To download and install STAR#

$ sudo apt-get update
$ sudo apt-get install g++
$ sudo apt-get install make STAR

```

- Basic Workflow 

`STAR --option1-name option1-value(s)--option2-name option2-value(s) ... #STAR basic command line#`
  - Generate genome indexes files
  - Mapping reads

```
#To generate genome indexes#

--runThreadN #defines the number of threads to be used for genome generation, it has to be set to the number of available cores on the server node#

--runMode **genomeGenerate**  #directs STAR to run genome indices generation job#

--genomeDir #specifies path to the directory where the genome indices are stored#

--genomeFastaFiles #specifies one or more FASTA files with the genome reference sequences#

--sjdbGTFfile #specifies the path to the file with annotated transcripts in the standard GTF
format#

--sjdbOverhang #specifies the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database#

#To map reads#

--runThreadN #defines the number of threads to be used for genome generation, it has to be set to the number of available cores on the server node#

--genomeDir #specifies path to the directory where the genome indices are stored "/path/to/genomeDir"#

--readFilesIn  #specifies path to the fastq files are stored "/path/to/read1 [/path/to/read2 ]"#

--readFilesCommand **UncompressionCommand** # Use if the fastq files are compressed, where UncompressionCommand is the un-compression command#

--quantMode **GeneCounts** #To generate the number of reads per gene in tabular file#

```

#### Output files

- Log files
- SAM
- BAM
- Count table (.tab)

If you want to know more about code, you can go to Alex Dobin [Github]( https://github.com/alexdobin/STAR ). 

## Conclusions

STAR is a powerful aligner design to improve read sequences alignment to a reference genome with less computational effort and more sensitivity in matching with accuracy reads to genomic sequences.

## References

If you want to know more about RNA-Seq and STAR aligner, you can check:



- Kukurba, *et al*. RNA Sequencing and Analysis. Cold Spring Harbor Protocols. [2015]( http://cshprotocols.cshlp.org/content/2015/11/pdb.top084970.abstract ).

- Soneson, *et al*. Differential analyses for RNA-seq: transcript-level estimates improve gene-level inferences. [2016](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4712774/).
- Raplee, *et al*. Aligning the Aligners: Comparison of RNA Sequencing Data Alignment and Gene Expression Quantification Tools for Clinical Breast Cancer Research. J Pers Med. [2019]( https://www.ncbi.nlm.nih.gov/pubmed/30987214 ).
- Dobin, *et al*. STAR: ultrafast universal RNA-seq aligner. Bioinformatics. [2013]( https://academic.oup.com/bioinformatics/article/29/1/15/272537 ).
- Dobin, *et al*. Mapping RNA-seq Reads with STAR. Curr Protoc Bioinformatics. [2016]( https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4631051/ ).
- [Bioinformatics Pipeline: mRNA Analysis]( https://docs.gdc.cancer.gov/Data/Bioinformatics_Pipelines/Expression_mRNA_Pipeline/ ).
