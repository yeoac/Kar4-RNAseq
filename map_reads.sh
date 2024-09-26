#!/bin/bash

SAMPLE_PREFIX=OC8536-6_S6_L001

module load STAR

# Create mapped_reads folder if it is not already there
ls ./mapped_reads8536R || mkdir -m 777 ./mapped_reads8536R

STAR --runMode alignReads \
        --runThreadN 16 \
        --genomeDir ./reference \
        --alignSJDBoverhangMin 1 \
        --alignSJoverhangMin 5 \
        --outFilterMismatchNmax 2 \
        --alignEndsType EndToEnd \
        --readFilesIn ./trimmed_reads8536R/${SAMPLE_PREFIX}_R1_001_val_1.fq.gz ./trimmed_reads8536R/${SAMPLE_PREFIX}_R2_001_val_2.fq.gz \
        --readFilesCommand zcat \
        --outFileNamePrefix mapped_reads8536R/${SAMPLE_PREFIX}. \
        --quantMode GeneCounts \
        --outSAMtype BAM SortedByCoordinate \
        --outSAMattributes All

module purge
