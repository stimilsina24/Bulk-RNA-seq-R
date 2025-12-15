## Understanding Gene Expression Changes in Senescent Human Vascular Smooth Muscle Cells

#### **Original Paper:** [Uryga et al., 2021](https://pmc.ncbi.nlm.nih.gov/articles/PMC8140103/)

### **Premise**
Senescence is a major problem for regenerative biology and aging. As telomeres shorten with age or cells encounter stress, they become senescent and unable to proliferate in response to injury. As a result, tissue regeneration fails, leading to accelerated aging and tissue failure.

### **Experimental Setup**
Primary Human Vascular Smooth Muscle Cells (VSMCs) were induced to undergo **Stress-Induced Premature Senescence (SIPS)** in vitro using doxorubicin (1-day treatment + 21-day recovery). Bulk RNA sequencing was performed on the samples using a NextSeq sequencer (Illumina).

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
    * **GSEA (Gene Set Enrichment Analysis):** KEGG, Reactome, WikiPathways, GO.
    * **ORA (Overrepresentation Analysis):** KEGG, Reactome, WikiPathways, GO.
    * **Visualization:** Heatmap, barplot, dotplot, ridgeplot, network analysis.

### **Folder Structure**
The analysis is divided into two main folders, each containing input data, QC (if applicable), and results.

1. **01_differential_expression (Part 1):**
    * Contains QC plots, list of Differentially Expressed (DE) genes, and heatmap analysis.
2. **02_pathway_enrichment (Part 2):**
    * Pathway analysis using `clusterProfiler` (GSEA and ORA) and visualization of data.

### **Interactive Reports**
The full analysis with concurrent figures can be viewed using the interactive HTML reports below:

* [View Part 1: Differential Expression Report](LINK_TO_PART1_HTML)
* [View Part 2: GSEA Report](LINK_TO_PART2_HTML)
* [View Part 3: ORA Report](LINK_TO_PART3_HTML)
* [View Part 4: ORA Heatmaps](LINK_TO_PART4_HTML)

### **Findings**
* **Validation of Senescence Model:** The analysis confirmed the senescence phenotype with strong upregulation of the cell cycle inhibitor **CDKN2A (p16)**.
* **Secretory Phenotype (SASP):** We observed significant enrichment of inflammatory cytokines (e.g., **IL6**) and matrix remodeling enzymes (e.g., **MMP3**), confirming the cells entered a Senescence-Associated Secretory Phenotype (SASP).
* **Cell Cycle Arrest:** Gene Set Enrichment Analysis (GSEA) showed a massive downregulation of cell cycle checkpoint pathways, consistent with permanent growth arrest.

### **Acknowledgements**
1. [Sanbomics YouTube Channel](https://www.youtube.com/watch?v=oRC406tbB8w&list=PLi1VnGoeDGjvHvl83QySD2oAQYFHPRYso&index=2)
2. [BIG Bioinformatics at UT Health San Antonio](https://www.bigbioinformatics.org/r-and-rnaseq-analysis)
