# Creating the variant-calling environment and downloading the tools through conda
conda create -n variant-calling fastq porechop bwa samtools bcftools

# Actvite the env for varaint-calling
conda activate variant-calling

# Downloading the sra file
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR036919/SRR036919

# Conversion of  sra file to fastq
fastq-dump --split-files SRR036919

# Downloading reference genome
wget "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?id=J82482.1&db=nuccore&report-fasta&retmode=text" -0 phlX174.fasta
head phiX174.fasta

# Indexing of reference genome
bwa index phiX174.fasta

# Quality checking
fastqc SRR036919_1.fastq

# Declaring file names
ref= phiX174.fasta
read1= SRR036919_1.fasta

# Declaring read groups
RGID= "000"
RGSN= "phiX_sample"
readgroup= "@RG\\tID:${RGID}\\tPL:illumina\\tPU:None\\tLB:None\\tSM:${RGSN}"
echo $ readgroup
# Making directory
mkdir BAMS

# Mapping the reads
bwa mem -t 8 -R "$readgroup" phiX174.fasta "$read1" | samtools view -h -b -o BAMS/phiX.raw.bam

# Sorting and indexing by samtools
samtools sort BAMS/phiX.raw.bam -o BAMS/phiX.sorted.bam
samtools index phiX.sorted.bam

# Checking statistics of sorted.bam file
samtools flagstat phiX.sorted.bam 

# Filtering the raw.bam file
samtools view -b -F 0xc phiX.raw.bam -o phiX.filtered.bam 

# Sorting the filtered file
samtools sort -@ 1 phiX.filtered.bam -o phiX.sorted.bam

# Removing duplication
samtools markdup -r phiX.sorted.bam phiX.dedup.bam

# Indexing dedup.bam file
samtools index phiX.dedup.bam

# Checking statistics of dedup.bam file
samtools flagstat phiX.dedup.bam

# Installing freebayes tool (version 1.3.6)
conda install -c bioconda freebayes=1.3.6

# Calling variants
freebayes -f phiX174.fasta -b phiX.dedup.bam --vcf phiX.vcf

# Compressing vcf file
bgzip  vcf/phiX.vcf

# Make directory
mkdir bcftools

# Indexing of vcf file by bcftools
bcftools index phiX.vcf.gz

# Counting variants
zgrep -v -c '^#' phiX.vcf.gz

# Counting snps
bcftools view -v snps phiX.vcf.gz | grep -v -c '^#'

# Checking number of indels
bcftools view -v indels phiX.vcf.gz | grep -v -c '^#'

# Filtering the snps from vcf
bcftools view -v snps phiX.vcf.gz -Oz -o snps.vcf.gz

# Checking number of snps
zgrep -v -c '^#' snps.vcf.gz

# Filtering the indels from vcf
bcftools view -v indels phiX.vcf.gz -Oz -o indels.vcf.gz

# Checking number of indels
zgrep -v -c '^#' indels.vcf.gz
