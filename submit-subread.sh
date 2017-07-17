#!/bin/bash

for fq in fastq/*fastq.gz
do
  echo "Submitting" $fq
  sbatch --mem=12G --partition=broadwl run-subread.R $fq
done
