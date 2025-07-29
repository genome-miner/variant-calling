# variant-calling
This repository contains a variant calling pipeline implemented on Linux for analyzing genomic variations using NGS data.

# Project overview
Objective: Identify genomic variants (SNPs & Indels) using NGS data  
Reference Genome: phiX174 (bacteriophage)  
Sample Data: SRA dataset [SRR036919]
Output: VCF files containing called variants (SNPs and Indels)

# Tools used
Fastqc: For quality checking
Bwa: For alignment
Samtools: For converting SAM file to BAM file
Freebayes: For variant calling
BCFtools: For analyzing variants 
Bash: For shell scripting

# variant-calling/
├── data/ # Raw and processed sequence data
├── genome/ # Reference genome and indexes
├── bam/ # BAM files
├── variants/ # Variant call files
├── Script/ # Pipeline script
├── document/ # Flowchart and images

# Pipeline steps (Summary)

1. Create environment & install tools (using conda)
2. Download reference genome & SRA file
3. Convert SRA to FASTQ
4. Quality check (FastQC)
5. Reference indexing (BWA)
6. Mapping & alignment
7. Sorting, filtering, deduplication
8. Variant calling (FreeBayes)
9. Variant filtering (BCFtools)
10. Counting SNPs and Indels
All steps are scripted in "pipeline.sh"

# Results summary
Sample: SRR036919  
Reference: phiX174  
SNPs found: 14  
Indels found: 0  
The sample showed 14 SNPs against the phiX174 reference. No indels were detected.

# Key Concepts
Bioinformatics | NGS Pipelines | Shell Scripting | Data Analysis | Variant Calling

# Contact
I'm a biotechnology student exploring bioinformatics, especially in pharmaceutical research. Open to learning and collaborating!
**Email**: biotechnologist09pharma@gmail.com  

# Flowchart
Pipeline Workflow (images/flowchart.png)

# Note
This is a learning project for practicing NGS-based variant calling and shell scripting on Linux.  
Reference genome and data are used for educational purposes.
