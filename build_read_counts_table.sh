#!/bin/bash

ls ./read_counts8536R||mkdir -m 777 ./read_counts8536R

# Store a list of all deduplicated bam files into the variable BAMS
BAMS=$(ls ./dedup8536R/*.sorted.dedup.bam)

module load subread

featureCounts -t exon -g gene_id -O \
    -s 2 -J -R BAM -p --ignoreDup -M \
    --fraction -G ./reference/Saccharomyces_cerevisiae.R64-1-1.106.fa \
    -T 16 \
    -p --countReadPairs \
    -a ./reference/Saccharomyces_cerevisiae.R64-1-1.106.gtf \
    -o ./read_counts8536R/read_counts_table ${BAMS}

# Note: add as many bam files as necessary at the end of the command above

module purge
