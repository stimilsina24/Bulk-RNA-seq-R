# Transcriptomic Profiling of Replicative Senescence in Human Vascular Smooth Muscle Cells

#### **Original Paper:** [Uryga et al., 2021](https://pmc.ncbi.nlm.nih.gov/articles/PMC8140103/)

### **Premise**
Replicative senescence is a major barrier in regenerative biology and aging. As telomeres shorten with age or cells encounter stress, they reach the Hayflick limit and lose the ability to proliferate in response to injury. As a result, tissue regeneration fails, leading to accelerated aging and physiological decline.

### **Experimental Setup**
Primary Human Vascular Smooth Muscle Cells (VSMCs) were induced to undergo **Replicative Senescence** in vitro. Bulk RNA sequencing was performed on the samples using a NextSeq sequencer (Illumina).

### **Analysis Pipeline**
**GEO Dataset:** [GSE171663](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE171663)

The raw FASTQ files were downloaded from GEO, followed by a standard RNA-seq analysis pipeline:

1. **FASTQC:** Quality control and trimming.
2. **Alignment:** Sequence alignment using STAR.
3. **DESeq2 Pipeline (R/RStudio):**
    * Import and minimal filtering of low counts.
    * Normalization and variance stabilization.
    * Sample correlation and dimensional reduction (PCA).
    * Differential Gene Expression (DGE) analysis.
    * Annotation and visualization (Volcano plot, Heatmap).
4. **Pathway Enrichment Analysis (ClusterProfiler):**
    * **GSEA (Gene Set Enrichment Analysis):** Reactome, WikiPathways, GO.
    * **Visualization:** Ridgeplot, GSEA dotplot, and enrichment heatmaps.

### **Folder Structure**
The analysis is divided into two main analysis folders, with shared inputs and figures located in the root directory.


1. **Part0-Upstream-pipeline-bash:**
    * Contains Shell script for FASTQC quality check and sequence alignment.
2. **Part1-DESeq2-Gene-Expr-analysis:**
    * Contains Differential Gene Expression (DGE) analysis, QC plots, and marker validation heatmaps.
3. **Part2-GSEA-Pathway-analysis:**
    * Contains Pathway analysis using `clusterProfiler` (GSEA) and pathway visualization.

### **Interactive Reports**
The full analysis with concurrent figures can be viewed using the interactive HTML reports below:

* [View Part 1: Differential Expression Report](https://stimilsina24.github.io/Bulk-RNA-seq-R/GSE171663-Replicative-Senenscence/Part1-DESeq2-Gene-Expr-analysis/Part1-Gene-Exp-Analysis-DESeq2.html)
* [View Part 2: GSEA Report](https://stimilsina24.github.io/Bulk-RNA-seq-R/GSE171663-Replicative-Senenscence/Part2-GSEA-Pathway-analysis/Bulk-RNA-seq-part2-PA-GSEA.html)

### **Findings**
#### 1. Validation of Senescence Model:
The senescence phenotype was successfully validated by the strong downregulation of proliferation markers (**MKI67, CCNA2, PLK1**) and nuclear envelope integrity genes (**LMNB1**), alongside the upregulation of the growth arrest marker **SFRP4**.
![Validation Heatmap](Figures/DE_heatmap.png)
*(Figure 1: Heatmap showing loss of LMNB1 and MKI67 in senescent cells)*

#### 2. Global Functional Reprogramming
Ridge plot analysis highlights a massive transcriptional shift. The "Cell Cycle" and "DNA Repair" pathways show a strong negative shift (downregulation), while immune-related pathways show a positive shift (upregulation).
![Pathway Ridge Plot](Figures/WP_ridge.png)
*(Figure 2: Distribution of gene expression changes across key senescent pathways)*

#### 3. Distinct Secretory Phenotype (SASP):
GSEA analysis revealed a specific Senescence-Associated Secretory Phenotype (SASP) characterized by the enrichment of chemokines **CCL5** and **CXCL14**. This suggests a phenotype driven by immune cell recruitment rather than the classical IL-6 dominant inflammatory response.
![GSEA Dot Plot](Figures/WP_heatplot.png)
*(Figure 3: Pathway enrichment showing upregulation of specific inflammatory cytokines. High-resolution version available in figures/ for detailed gene inspection.)*

### **Acknowledgements**
This pipeline was adapted from Sanbomics and other sources.
1. [Sanbomics YouTube Channel](https://www.youtube.com/watch?v=oRC406tbB8w&list=PLi1VnGoeDGjvHvl83QySD2oAQYFHPRYso&index=2)
2. [Datacamp]
3. [BIG Bioinformatics at UT Health San Antonio](https://www.bigbioinformatics.org/r-and-rnaseq-analysis)
