# Midway Subread pipeline

These scripts process RNA-seq data using the [Subread][] pipeline. The
scripts are designed to be used with the Slurm scheduler on the [RCC
Midway2][midway] cluster at the University of Chicago, but can be adapted to
other computing infrastructure.

## Setup

1. Install the R/Bioconductor package [Rsubread][].

    ```r
    source("https://bioconductor.org/biocLite.R")
    biocLite("Rsubread")
    ```

2. Clone this repository with `git clone` or download and unzip this
[zip file][master].

## Description

The scripts should be submitted in the following order:

1. Download and index the genome with `download-genome.R`

2. Download and format the exons with `download-exons.R`

3. Submit mapping jobs with `submit-subread.sh`, which calls
`run-subread.R` for each fastq file.

4. Submit counting jobs with `submit-subread.sh`, which calls
`run-featurecounts.R` for each BAM file.

## License

The code is available under the [CC0 license][cc0], i.e. you are free
to do whatever you like with this code, but it comes with no
guarantees.

## More information

* [RCC User Guide][guide]
* [Gilad Lab Midway Guide][giladlab]

[cc0]: https://creativecommons.org/share-your-work/public-domain/cc0/
[guide]: https://rcc.uchicago.edu/docs/
[giladlab]: https://github.com/jdblischak/giladlab-midway-guide
[master]: https://github.com/jdblischak/midway-subread-pipeline/archive/master.zip
[midway]: https://rcc.uchicago.edu/resources/high-performance-computing
[Rsubread]: https://bioconductor.org/packages/release/bioc/html/Rsubread.html
[Subread]: http://subread.sourceforge.net/