#!/usr/bin/env Rscript

# Run featureCounts to counts reads per gene.
#
# To submit on RCC Midway:
#
#   sbatch --mem=4g --partition=broadwl run-featurecounts.R <file.bam>

# Input ------------------------------------------------------------------------

# Obtain name of BAM file passed at the command line
args <- commandArgs(trailingOnly = TRUE)
stopifnot(length(args) == 1)
bam <- args[1]
stopifnot(file.exists(bam))

# Name of annotation file in SAF format
saf <- "genome/exons.saf"

# Output directory
outdir <- "counts"

# Setup ------------------------------------------------------------------------

library("Rsubread")

dir.create(outdir, showWarnings = FALSE)

# Create name of output counts file from input BAM file
outfile <- paste0(outdir, "/",
                  sub(".bam$", ".counts.txt", basename(bam)))

# Counts reads with featureCounts ----------------------------------------------

counts <- featureCounts(files = bam, annot.ext = saf)

write.table(counts$counts, file = outfile, quote = FALSE, sep = "\n")
