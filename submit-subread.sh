#!/bin/bash

for fq in fastq/*fastq.gz
do
  echo "Submitting" $fq
  sbatch --mem=8g --partition=broadwl run-subread.R $fq
done
