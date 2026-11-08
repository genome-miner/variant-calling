
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:1A2980,100:26D0CE&height=15&section=header&width=2000"/>
</p>

<h1>🧬NGS-Based Variant Calling and Genomic Analysis of Bacteriophage φX174</h1>

<h3>A Linux-Based Bioinformatics Pipeline for Identifying SNPs and Insertions/Deletions from Next-Generation Sequencing Data</h3>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Linux-blue?style=flat-square&logo=linux"/>
  <img src="https://img.shields.io/badge/Workflow-NGS%20Analysis-success?style=flat-square"/>
  <img src="https://img.shields.io/badge/Language-Bash-green?style=flat-square&logo=gnubash"/>
  <img src="https://img.shields.io/badge/Domain-Bioinformatics-26A69A?style=flat-square"/>
</p>

---

<p>
  <i>A practical exploration of NGS-based variant calling, using a reference-guided approach to identify single nucleotide polymorphisms (SNPs) and insertions or deletions (Indels) in bacteriophage φX174. The pipeline brings together sequence quality assessment, read alignment, genomic processing, and variant identification through command-line bioinformatics tools.</i>
</p>

---

<h2>📑 Table of Contents</h2>

<ul>
  <li><a href="#project-overview">Project Overview</a></li>
  <li><a href="#research-question">Research Question</a></li>
  <li><a href="#project-status">Project Status</a></li>
  <li><a href="#dataset">Dataset</a></li>
  <li><a href="#objectives">Objectives</a></li>
  <li><a href="#repository-structure">Repository Structure</a></li>
  <li><a href="#installation">Installation</a></li>
  <li><a href="#requirements">Tools and Requirements</a></li>
  <li><a href="#workflow">Variant Calling Workflow</a></li>
  <li><a href="#results">Results Summary</a></li>
  <li><a href="#future-work">Future Work</a></li>
  <li><a href="#visualizations">Workflow Diagram and Documentation</a></li>
  <li><a href="#references">References and Data Sources</a></li>
  <li><a href="#license">License</a></li>
  <li><a href="#contact">Author and Contact</a></li>
</ul>

---

<h2 id="project-overview">📖 Project Overview</h2>

<p>Next-generation sequencing (NGS) generates large amounts of genomic data, making computational approaches essential for identifying sequence variations and studying differences between genomes.</p>

<p>This project implements a reference-based variant calling pipeline on Linux to analyze NGS data from bacteriophage φX174. Using the sequencing dataset <a href="https://www.ncbi.nlm.nih.gov/sra/?term=SRR036919">SRR036919</a> and the φX174 reference genome, the workflow processes raw sequencing reads, assesses sequence quality, aligns reads to the reference, and identifies genomic variations.</p>

<p>The analysis focuses on two major types of genetic variation:</p>

<ul>
  <li><b>Single Nucleotide Polymorphisms (SNPs):</b> Changes involving individual nucleotide positions.</li>
  <li><b>Insertions and Deletions (Indels):</b> Insertions or deletions of nucleotides relative to the reference genome.</li>
</ul>

<p>The complete workflow was automated through a Bash script, <code>pipeline.sh</code>, bringing the major stages of NGS processing and variant identification together in a reproducible command-line pipeline.</p>

<p><b>Research focus:</b> To examine sequence-level differences between the sequencing sample and the φX174 reference genome through computational variant identification.</p>

---

<h2 id="research-question">🔬 Research Question</h2>

<p><b>What genomic variations, particularly SNPs and Indels, are present in the NGS sequencing dataset SRR036919 when compared with the bacteriophage φX174 reference genome, and what does reference-based variant calling reveal about the sequence differences between them?</b></p>

<p>This question guided the selection of the reference genome, sequencing data, alignment tools, and variant calling approach used throughout the project.</p>

---

<h2 id="project-status">🚀 Project Status</h2>

<ul>
  <li>✔ Conda environment setup and tool installation</li>
  <li>✔ Reference genome and sequencing data retrieval</li>
  <li>✔ SRA to FASTQ conversion</li>
  <li>✔ Sequence quality assessment using FastQC</li>
  <li>✔ Reference genome indexing using BWA</li>
  <li>✔ Read alignment and mapping</li>
  <li>✔ BAM processing and preparation</li>
  <li>✔ Variant calling using FreeBayes</li>
  <li>✔ Variant filtering and analysis using BCFtools</li>
  <li>✔ SNP and Indel identification</li>
</ul>

<p><b>Status:</b> Core variant calling workflow completed.</p>

---

<h2 id="dataset">📂 Dataset</h2>

<p>The analysis uses publicly available sequencing data and a reference genome for comparison.</p>

<table>
  <tr>
    <th>Component</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Reference Genome</td>
    <td>Bacteriophage φX174</td>
  </tr>
  <tr>
    <td>Sequencing Dataset</td>
    <td>SRR036919</td>
  </tr>
  <tr>
    <td>Data Source</td>
    <td><a href="https://www.ncbi.nlm.nih.gov/sra/?term=SRR036919">NCBI Sequence Read Archive (SRA)</a></td>
  </tr>
  <tr>
    <td>Input Format</td>
    <td>SRA, converted to FASTQ</td>
  </tr>
  <tr>
    <td>Final Output</td>
    <td>VCF files containing identified SNPs and Indels</td>
  </tr>
</table>

---

<h2 id="objectives">🎯 Objectives</h2>

<p>The main objectives of this project were to:</p>

<ul>
  <li>Develop a reference-based NGS variant calling workflow on Linux.</li>
  <li>Retrieve and prepare publicly available sequencing data for downstream analysis.</li>
  <li>Assess sequencing read quality before alignment.</li>
  <li>Index the reference genome and map sequencing reads using BWA.</li>
  <li>Process and prepare alignment files for variant identification.</li>
  <li>Identify SNPs and Indels using FreeBayes.</li>
  <li>Filter and examine called variants using BCFtools.</li>
  <li>Summarize the genomic variations identified in the sequencing sample.</li>
  <li>Automate the analysis workflow using Bash scripting.</li>
</ul>

---

<h2 id="repository-structure">📁 Repository Structure</h2>

<p>The repository is organized into separate directories to keep sequencing data, reference files, alignment outputs, variant results, and documentation organized.</p>

```bash
variant-calling/
│
├── Data/
│   └── # Raw and processed sequencing data
│
├── Genome/
│   └── # Reference genome and BWA indexes
│
├── Bam/
│   └── # Processed alignment files
│
├── Variants/
│   └── # VCF files and variant analysis outputs
│
├── Script/
│   └── pipeline.sh
│
├── Document/
│   └── # Workflow flowchart and project images
│
└── LICENSE

```

---

<h2 id="installation">⚙️ Installation</h2>

<p>Clone the repository:</p>

```bash
git clone https://github.com/genome-miner/variant-calling.git

cd variant-calling
```

<p>The pipeline uses Conda for environment management and installation of the required bioinformatics tools.</p>

<p>Create and activate your Conda environment:</p>

```bash
conda create -n variant-calling
conda activate variant-calling
```

<p>Install the required tools through Conda:</p>

```bash
conda install -c bioconda fastqc bwa samtools freebayes bcftools
```

<p>For the complete analysis, execute the pipeline script:</p>

```bash
bash Script/pipeline.sh
```

---

<h2 id="requirements">📦 Tools and Requirements</h2>

<p>The pipeline combines established command-line tools, with each one handling a specific stage of the sequencing analysis.</p>

<table>
  <tr>
    <th>Tool</th>
    <th>Purpose</th>
  </tr>
  <tr>
    <td>Linux</td>
    <td>Command-line environment for running the pipeline.</td>
  </tr>
  <tr>
    <td>Conda</td>
    <td>Environment management and installation of bioinformatics software.</td>
  </tr>
  <tr>
    <td>FastQC</td>
    <td>Quality assessment of raw sequencing reads.</td>
  </tr>
  <tr>
    <td>BWA</td>
    <td>Reference genome indexing and sequencing read alignment.</td>
  </tr>
  <tr>
    <td>Samtools</td>
    <td>Processing, sorting, and handling SAM/BAM alignment files.</td>
  </tr>
  <tr>
    <td>FreeBayes</td>
    <td>Identification of genomic variants from aligned sequencing reads.</td>
  </tr>
  <tr>
    <td>BCFtools</td>
    <td>Variant filtering, processing, and analysis.</td>
  </tr>
  <tr>
    <td>Bash</td>
    <td>Shell scripting and pipeline automation.</td>
  </tr>
</table>

---

<h2 id="workflow">🔄 Variant Calling Workflow</h2>

<p>The pipeline follows a reference-guided approach, starting with raw sequencing data and ending with the identification of genomic variants.</p>

```mermaid
flowchart TD
    A["GS Sequencing Data"] --> B["SRA Data Retrieval"]
    B --> C["SRA to FASTQ"]
    C --> D["Quality Assessment - FastQC"]
    D --> E["Reference Genome Preparation"]
    E --> F["BWA Indexing"]
    F --> G["Read Alignment"]
    G --> H["SAM/BAM Processing"]
    H --> I["Sorting and Filtering"]
    I --> J["Variant Calling - FreeBayes"]
    J --> K["Variant Filtering - BCFtools"]
    K --> L["SNP and Indel Identification"]
    L --> M["VCF Output"]
---

<h2 id="results">📊 Results Summary</h2>

<p>Variant calling of sequencing dataset SRR036919 against the φX174 reference genome identified 14 SNPs and no Indels.</p>

<table>
  <tr>
    <th>Analysis</th>
    <th>Result</th>
  </tr>
  <tr>
    <td>Sample</td>
    <td>SRR036919</td>
  </tr>
  <tr>
    <td>Reference Genome</td>
    <td>φX174</td>
  </tr>
  <tr>
    <td>Identified SNPs</td>
    <td><b>14</b></td>
  </tr>
  <tr>
    <td>Identified Indels</td>
    <td><b>0</b></td>
  </tr>
</table>

<p align="center">
  <img src="https://img.shields.io/badge/SNPs-14-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Indels-0-success?style=for-the-badge"/>
</p>

<h3>Interpretation</h3>

<p>The analysis identified 14 SNPs in the sequencing sample relative to the φX174 reference genome. No insertions or deletions were detected in the resulting variant calls.</p>

<p>These results summarize the sequence differences identified through the implemented reference-based variant calling workflow.</p>

---

<h2 id="future-work">🚀 Future Work</h2>

<p>Further development of this project could focus on expanding the analysis beyond basic variant identification.</p>

<ul>
  <li>Annotate identified variants to examine their genomic context.</li>
  <li>Investigate the potential functional effects of identified SNPs.</li>
  <li>Examine nucleotide substitutions and their distribution across the reference genome.</li>
  <li>Visualize variant positions using genomic visualization tools.</li>
  <li>Explore additional sequencing datasets for comparative variant analysis.</li>
  <li>Improve pipeline reporting and automate the generation of summary statistics.</li>
</ul>

---

<h2 id="visualizations">📈 Workflow Diagram and Documentation</h2>

<p>The repository includes a dedicated <code>Document/</code> directory containing the workflow flowchart and project images.</p>

<p>Explore the documentation and visual materials:</p>

<p align="center">
  <a href="https://github.com/genome-miner/variant-calling/tree/main/Document">
    <img src="https://img.shields.io/badge/View-Workflow%20and%20Project%20Images-1A2980?style=for-the-badge&logo=github"/>
  </a>
</p>

---

<h2 id="references">📚 References and Data Sources</h2>

<ul>
  <li><b>NCBI Sequence Read Archive:</b> <a href="https://www.ncbi.nlm.nih.gov/sra/?term=SRR036919">SRR036919 sequencing dataset</a>.</li>
  <li><b>BWA:</b> <a href="https://github.com/lh3/bwa">Burrows-Wheeler Aligner</a>.</li>
  <li><b>Samtools:</b> <a href="https://www.htslib.org/">SAM/BAM processing toolkit</a>.</li>
  <li><b>FreeBayes:</b> <a href="https://github.com/freebayes/freebayes">Bayesian haplotype-based variant detector</a>.</li>
  <li><b>BCFtools:</b> <a href="https://github.com/samtools/bcftools">Variant calling and manipulation tools</a>.</li>
  <li><b>FastQC:</b> <a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">Sequencing quality control software</a>.</li>
</ul>

---

<h2 id="license">📄 License</h2>

<p>This project is distributed under the MIT License. See the <a href="https://github.com/genome-miner/variant-calling/blob/main/LICENSE">LICENSE</a> file for details.</p>

---

<h2 id="contact">👩‍💻 Author and Contact</h2>

**Sana Aziz Sial**  
Biotechnologist and Bioinformatician
- 🎓 [University of Veterinary and Animal Sciences](https://www.uvas.edu.pk/)
- 📧 [Email](sanaazizsial@gmail.com)
- 🐙 [GitHub](https://github.com/genome-miner)
- 🔗 [LinkedIn](in/sana-aziz-sial-73b189265)


<p align="center">
  <b>Thank you for visiting this repository!</b>
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:1A2980,100:26D0CE&height=15&section=footer&width=2000"/>
</p>
