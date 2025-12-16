# Upstream RNA-seq Processing Pipeline

**Overview**
This directory contains the shell script used to process the raw sequencing data for this project (GSE171663). The pipeline takes raw FASTQ files, performs quality control, aligns them to the GRCh38 reference genome, and generates a count matrix for downstream analysis in R.

**Attribution & References**
This workflow was adapted from the **Sanbomics** RNA-seq tutorial series.
* **Source:** [Sanbomics - RNA-seq from scratch (Linux)](https://www.youtube.com/@Sanbomics)
* **Modifications:** The script has been customized to handle the specific file naming conventions and directory structure of this project.

**Pipeline Steps**
The script `Run_alignment.sh` automates the following steps:

1.  **Quality Control:** * Tool: `FastQC`
    * Assessing raw read quality (Phred scores, adapter content).
2.  **Genome Indexing:** * Tool: `STAR`
    * Building a reference index for the human genome (GRCh38).
3.  **Alignment:** * Tool: `STAR`
    * Mapping reads to the reference genome to generate BAM files.
4.  **Post-Alignment QC:** * Tool: `Qualimap`
    * Assessing mapping rates and coverage uniformity.
5.  **Quantification:** * Tool: `featureCounts` (Subread)
    * Counting reads mapping to gene features to generate the final count matrix.

**Tools & Environment**
* **Language:** Bash (Shell Scripting)
* **Environment:** Linux (via WSL/Ubuntu)
* **Dependencies:** `sra-toolkit`, `fastqc`, `star`, `subread`, `qualimap`

**Note on Usage**
This script is adapted from Sanbomics tutorial to ensure reproducibility and adherence to current alignment standards.
