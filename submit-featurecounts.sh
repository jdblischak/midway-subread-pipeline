#!/bin/bash

for bam in bam/*bam
do
  echo "Submitting $bam"
  sbatch --mem=4G --nodes=1 --tasks-per-node=4 --partition=broadwl run-featurecounts.R $bam
done
