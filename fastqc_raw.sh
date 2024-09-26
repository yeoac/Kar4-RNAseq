#!/bin/bash

module load fastqc

# Create a direcotry where we will store the output files from the fastqc analysis
mkdir -p -m 777 fastqc_raw8537

# Save path to read files into the variable READS
READS=$(ls ./OC-8537/*.fastq.gz)

fastqc --quiet -t 8 -o fastqc_raw8537 ${READS}

# You can add as many fastq files as you want at the end of the fastqc command above

module purge
