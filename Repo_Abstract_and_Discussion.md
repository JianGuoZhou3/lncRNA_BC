# Analysis of Identification of lincRNA as predictive biomarkers in breast cancer

## ABSTRACT

Breast cancer is the most common malignant neoplasia in women ([WHO](https://www.who.int/cancer/prevention/diagnosis-screening/breast-cancer/en/)). 
For that reason, there are many clinical strategies diagnosis and treatment-decision tools based principally in detection of proteins by 
immunhistochemical techniques or by PCR analysis (to detect mRNA) (Patani, 2013). However, less than %50 of the patients could respond to 
treatment in the clinical outcome, generating the necessity of better oncological management. In that sense, the development of better techniques is the new focus of traslational medicine (Alcaraz, 2017) and many of them are based in molecular biology techniques. One of this techniques is RNA Next Generation Sequencing
(RNA-Seq, Külahoglu, 2014), which provide us the information of all transcriptomic context of a given sample, like a breast tumor sample, 
and allowed us to make clinical decision (Berger, 2018).

In here, we analized 10 samples from 10 patients diagnosed with breast cancer which where candidates to receive neoadjuvant treatment, 
classified into 2 groups according to clinical outcome data: No response patients (8) and Response to neoadjuvant treatment patients (2). 
Samples were took before pharmacological administration and the RNA and DNA was extracted for RNA-Seq and Whole Exome Sequencing 
implementation, in order to determine a tumoral molecular signature that can be used in clinical routine to predict response to neoadjuvant 
treatment, composed by genomic information (Copy number variants or CNV's) and transcriptomic data (lincRNA differentially expressed). Although 
we couldn't obtain yet CNV's information, we found a set of lincRNA that are differentially expressed in No responsive group and which
could be use to determine, by their own, response to neoadjuvant treatment.

## DISCUSSION

The oncological management of breast cancer patients depends on the progression of disease and on the molecular subtype of the patient. In this work, we focus on patients from stages II to III, because they are candidates to receive neoadjuvant treatment in the clinical standards. The lackness of appropiate molecular biomarkers was the motivation to investigate the possible use of lincRNA as indicative of clinical information in oncological management, because they are specific in expression in breast cancer (Berger, 2018).

We choose the bioinformatic approach to determine first the possible candidates to biomarkers because this is cost-effective and because of the sensitivity. lincRNA are molecules with low expression levels in tissues respect to mRNA molecules, thus the RNA-Seq is an accurate technique to detect lincRNA in breast cancer condition, and in response to neoadjuvant treatment. We selected our pipeline because of advices from other bioinformaticians and for the advantages respect to other workflows (see [Seminar](https://github.com/LauraMCE/lncRNA_BC/blob/master/STB/METHODOLOGICAL_SEMINAR_STAR_ALIGNER.md)), and we obtained the expected results as is shown in ../Transcriptome/Graphs. We were able to identify a set of lincRNA differentially expressed in no response patients to neoadjuvant treatment, and they are candidates to experimental validation by RT-qPCR, because this is a methodology frequently used in clinical approaches (Berger, 2018).

Although we obtained the expected result, we had problems because of the bias produced by the few data that we had. We had a disbalanced analysis, because we compared a group with 2 samples (Response) with a group with 8 samples (No_response). For clinical approach, this is natural because of the rates of response reported in literature for breast cancer (Arce, 2017), but it is a statistical problem that were important in the differential expression analysis and in the gene set enrichment analysis, the last one is still unsolved because of the problems choosing the accurate metrics to avoid the bias. However, these problems will be solved with the implementation of a prospective study to colect more samples and balance the analysis.

Another problem that we had is the fact that, because of the nature of the clinical manipulation of tumors in surgery, the DNA obtained from this samples didn't pass the quality control for Whole exome analysis, and additionally, for logistic reasons, the group that as assigned to sequence this exome samples made technical mistakes in the sequencing process. We could use another patient's samples with better quality, but the idea of determining molecular signatures is to merge more molecular informationt from teh same patient, that's why our cohorts where paired in transcriptome and genome data, and that makes not adequate to use DNA from different patients (Berger, 2018). This is the principal reason why ../Exome/data is not properly filled and the reason why the scripts in ../Exome/bin weren't proved yet (see [issue](https://github.com/LauraMCE/lncRNA_BC/issues/26#issue-517289033)). Thus we couldn't obtain our CNV's analysis to complement the molecular signature, which is another goal for this work, because it has been reported that the more molecular information he could obtain from patient, most accurate could be the clinical management of the patient, with better outcomes and responses to treatment, which is translate in clinical efficiency and in better quality of patient's life.

In conclussion, there is a molecular signature at least composed by lincRNA that can determine the response to neoadjuvant treatment in breast cancer patients that could be determine by bioinfomatic analysis from RNA-Seq data. It is still in perspective complement with genomic information from tumor patients of our paired cohort, in order to generate a signature with clinical value in oncological management for breast cancer patients.
