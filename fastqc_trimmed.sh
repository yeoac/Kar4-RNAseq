#!/bin/bash

module load fastqc

# Create a directory where we will store the output fies from the fastqc analysis
mkdir -p -m 777 fastqc_trimmed8536R

# Save path to read files into variable READS
READS=$(ls ./trimmed_reads8536R/*.fq.gz)

fastqc --quiet -t 8 -o fastqc_trimmed8536R ${READS}

# You can add as many fastq files as you want at the end of the fastqc command above

module purge
