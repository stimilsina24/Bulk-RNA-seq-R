#!/bin/bash

# -------------------------------------------------------------------------
# Upstream RNA-seq Pipeline: QC, Alignment, and Quantification
# Project: Replicative Senescence (GSE171663)
# Author: Santosh
# Tools: FastQC, STAR, Qualimap, Subread (featureCounts)
# -------------------------------------------------------------------------

##Download the SRR files and convert them to fastq before starting.

# 1. QC Raw Reads
echo "Starting FastQC..."
mkdir -p fastqc_reports
fastqc *.fastq -o fastqc_reports/

# 2. Build STAR Genome Index (Run once)
# Note: Requires GRCh38 FASTA and GTF files
echo "Building STAR Index..."
mkdir -p ref/
STAR --runMode genomeGenerate \
     --genomeDir ref/ \
     --genomeFastaFiles Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
     --sjdbGTFfile Homo_sapiens.GRCh38.113.gtf \
     --runThreadN 12

# 3. Align Reads (Loop through all FASTQ files)
echo "Starting Alignment..."
mkdir -p mapped/ 
mkdir -p bams/ 

for file in *.fastq; do 
    # Extract base name (e.g., SRR14168768)
    base=$(basename "${file}" .fastq)
    
    echo "Aligning ${base}..."
    STAR --runMode alignReads \
         --genomeDir ref/ \
         --outSAMtype BAM SortedByCoordinate \
         --readFilesIn "${file}" \
         --runThreadN 12 \
         --outFileNamePrefix "mapped/${base}_"
done

# Move BAMs to a clean folder
mv mapped/*.bam bams/

# 4. Post-Alignment QC (Qualimap)
echo "Running Qualimap..."
mkdir -p qualimap_reports
for bamfile in bams/*.bam; do
    qualimap rnaseq \
             -bam "$bamfile" \
             -gtf Homo_sapiens.GRCh38.113.gtf \
             -outdir "qualimap_reports/$(basename "$bamfile" .bam)" \
             --java-mem-size=15000M
done

# 5. Quantification (featureCounts)
echo "Counting Reads..."
featureCounts -a Homo_sapiens.GRCh38.113.gtf \
              -o counts_matrix.txt \
              -T 8 \
              bams/*.bam

echo "Pipeline finished."
