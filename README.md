# RNA-Seq Pipeline

This project implements an RNA sequencing (RNA-Seq) analysis pipeline for processing, aligning, and quantifying RNA-Seq data. It automates tasks such as quality control, trimming, alignment, and feature counting to generate a count matrix for downstream analysis.

## Project Structure
RNA_Seq_Bulk/ ├── RNA_Seq__demo/ │ ├── data/ # Contains input and output files │ ├── HISAT2/ # HISAT2 genome index and output files ├── FastQC/ # FastQC binary for quality control ├── Trimmomatic-0.39/ # Trimmomatic binary for sequence trimming

## Tools and Dependencies

The pipeline uses the following tools:
- **FastQC**: For quality control of raw and trimmed sequences.
- **Trimmomatic**: For trimming low-quality bases.
- **HISAT2**: For aligning reads to a reference genome.
- **samtools**: For sorting aligned reads.
- **featureCounts**: For generating a count matrix.

Ensure all tools are installed and available in your environment.

## Input File

- `demo.fastq`: Raw FASTQ file containing sequencing reads.

## Steps in the Pipeline

1. **Quality Control (FastQC)**  
   Runs quality control on the raw FASTQ file to check for sequencing quality.

2. **Sequence Trimming (Trimmomatic)**  
   Trims low-quality bases from the sequencing reads.

3. **Quality Control on Trimmed Data (FastQC)**  
   Performs quality control again on the trimmed FASTQ file.

4. **Alignment (HISAT2)**  
   Aligns the trimmed reads to the reference genome using HISAT2.

5. **Feature Counting (featureCounts)**  
   Generates a count matrix by mapping the aligned reads to annotated genes.

## How to Run the Project
Navigate to the project directory:
```bash
cd /storage/rushikesh23250/bioinfo/RNA_Seq_Bulk/RNA_Seq__demo/

Navigate to the RNA_Seq_Bulk/RNA_Seq__demo/Script and run whole pipeline using command: ./RNASeqPipeline.sh

### Link to the grch38 dataset: https://drive.google.com/drive/folders/1ZjL2JTShAfl1AihBsMXjGuEnDo_2BhBG?usp=sharing
