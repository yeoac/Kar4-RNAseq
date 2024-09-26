#!/bin/bash

SAMPLE_PREFIX=OC8536-6_S6_L001

# Create dedup folder if it is not already there
ls ./dedup8536R||mkdir -m 777 ./dedup8536R

module load picard

java -Xmx32g -jar /usr/local/apps/picard/2.27.3/picard.jar MarkDuplicates \
 I=./mapped_reads8536R/${SAMPLE_PREFIX}.Aligned.sortedByCoord.out.bam O=./dedup8536R/${SAMPLE_PREFIX}.sorted.dedup.bam M=./dedup8536R/${SAMPLE_PREFIX}.sorted.dedup.metrics.txt \
 READ_NAME_REGEX=null REMOVE_DUPLICATES=false

module purge
