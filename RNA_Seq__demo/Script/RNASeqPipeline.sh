#!/bin/bash

# change working directory
cd /storage/rushikesh23250/bioinfo/RNA_Seq_Bulk/RNA_Seq__demo/

# changing working directory for running fastq
cd /storage/rushikesh23250/bioinfo/RNA_Seq_Bulk/FastQC

## step1 : Run FastQC
./fastqc D:/Bioinformatics/RNA_Seq_Bulk/RNA_Seq__demo/data/demo.fastq -o D:/Bioinformatics/RNA_Seq_Bulk/RNA_Seq__demo/data
echo "fastq finished running"

## step2 : Trimming sequences using Trimmomatc

# change working directory for trimmomatic
cd /storage/rushikesh23250/bioinfo/RNA_Seq_Bulk/Trimmomatic-0.39

# command for trimmomatic
java -jar trimmomatic-0.39.jar SE -threads 4 ../RNA_Seq__demo/data/demo.fastq ../RNA_Seq__demo/data/demo_trimmed.fastq TRAILING:10 -phred33
echo "Trimmomatic Finished Running!"

# we will again check Quality by running FastQC on trimmed data
cd /storage/rushikesh23250/bioinfo/RNA_Seq_Bulk/FastQC
./fastqc ../RNA_Seq__demo/data/demo_trimmed.fastq -o ../RNA_Seq__demo/data
echo "FastQC Finished Running"


## Step3 : Run Alignment Using HISAT2

# # running the alignment using HISAT2 tool
cd /storage/rushikesh23250/bioinfo/RNA_Seq_Bulk/RNA_Seq__demo

# #Terminal command to run HISAT2
hisat2 -q --rna-strandness R -x HISAT2/grch38/genome -U data/demo_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
echo "HISAT Finished Running"

## getting the genome annotation file
#wget https://ftp.ensembl.org/pub/release-113/gtf/homo_sapiens/Homo_sapiens.GRCh38.113.gtf.gz

## getting count matrix using feature count
featureCounts -S 2 -a HISAT2/grch38/Homo_sapiens.GRCh38.113.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
echo "featureCounts finished running"