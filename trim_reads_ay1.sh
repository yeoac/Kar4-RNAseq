#!/bin/bash
#SBATCH --cpus-per-task=8
module load bbtools

# Set SAMPLE_PREFIX with sample name entered after command when running sbatch (e.g. "sbatch trim_reads_ay1.sh OC8346-2_S2_L001" )
SAMPLE_PREFIX=$1
READ_DIR=./OC-8537

# Load required modules
module load trimgalore

# get input files
FASTQ_1=${SAMPLE_PREFIX}_R1_001.fastq.gz
FASTQ_2=${SAMPLE_PREFIX}_R2_001.fastq.gz
LOGFILE=${SAMPLE_PREFIX}_trim.log
OUTPUT_DIR=./trimmed_reads8537

if [[ ! -d ${OUTPUT_DIR} ]]; then
    mkdir -p -m 777 ${OUTPUT_DIR}
fi

trim_galore --cores 8 --paired -o ${OUTPUT_DIR} ${READ_DIR}/${FASTQ_1} ${READ_DIR}/${FASTQ_2} > ${OUTPUT_DIR}/${LOGFILE} 2>&1

echo ""
echo "Finished trimming..."
echo ""
