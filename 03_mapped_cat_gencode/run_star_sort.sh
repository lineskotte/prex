#!/bin/sh

### Script for running STAR
fastq1=$1
fastq2=$2
prefix_out=$3
reference_dir=$4

echo "First mate file, fastq1: $fastq1"
echo "Second mate file, fastq2: $fastq2"
echo "Output files prefix, prefix_out: $prefix_out"

# Run parameters:
par1="--runMode alignReads --runThreadN 27 --runDirPerm User_RWX --runRNGseed 777"
# Genome parameters:
par2="--genomeDir ${reference_dir} --genomeLoad NoSharedMemory" 
# Input parameters:
par3="--readFilesIn ${fastq1} ${fastq2} --readFilesCommand zcat"
# Mapping parameters:
par4="--twopassMode Basic --limitSjdbInsertNsj 1200000"
# Alignment parameters:
par5="--alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --alignSoftClipAtReferenceEnds Yes" 
# Chimeric alignment parameters:  
par6="--chimSegmentMin 15 --chimJunctionOverhangMin 15 --chimOutType WithinBAM SoftClip --chimMainSegmentMultNmax 1"
# Output filters: 
par7="--outFilterType BySJout --outFilterMultimapNmax 20 --outFilterMismatchNmax 999 --outFilterMismatchNoverLmax 0.1 --outFilterScoreMinOverLread 0.33 --outFilterMatchNminOverLread 0.33 --outFilterIntronMotifs None"
# Output sam-file parameters: 
par8="--outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate --outSAMunmapped Within --outSAMattributes NH HI AS nM NM ch --outSAMattrRGline ID:rg1 SM:sm1"
# Output control parameters:
par9="--quantMode TranscriptomeSAM GeneCounts --outReadsUnmapped Fastx --outFileNamePrefix ${prefix_out}"

STAR $par1 $par2 $par3 $par4 $par5 $par6 $par7 $par8 $par9
