#!/bin/bash

for fq in fastq/*fastq.gz
do
  echo "Submitting $fq"
  sbatch --mem=12G --nodes=1 --tasks-per-node=4 --partition=broadwl run-subread.R $fq
done
