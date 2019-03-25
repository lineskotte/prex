#!/bin/sh
### Script used for mapping batch1 after concatenating fastq from same samples
### One job should be run for each of the 4 libraries

### qsub -W group_list=ssi_gen1 -A ssi_gen1 -l nodes=1:ppn=28,mem=120gb,walltime=300:00:00 map_cat_batch1_lib2.sh

lib=PINE_DEN15_02

module load tools
module load star/2.5.3a

path_in=/home/projects/ssi_gen1/data/pregnancy/raw_rna_mod/fastq_batch1
path_out=/home/projects/ssi_gen1/data/pregnancy/mapped_cat_gencode/batch1
path_ref=/home/projects/ssi_gen1/data/pregnancy/reference

for fqbase in `ls ${path_in} | grep ${lib} | grep -v unmatched | sed 's/_R1.fastq.gz//g' | sed 's/_R2.fastq.gz//g' | sort -u `
do
echo $fqbase

fq1=${fqbase}_R1.fastq.gz
fq2=${fqbase}_R2.fastq.gz

fastq1=${path_in}/${fq1}
fastq2=${path_in}/${fq2}

prefix_out=${path_out}/${fqbase}

echo /home/projects/ssi_gen1/data/pregnancy/scripts/run_star_sort.sh $fastq1 $fastq2 ${prefix_out} ${path_ref}

/home/projects/ssi_gen1/data/pregnancy/scripts/run_star_sort.sh $fastq1 $fastq2 ${prefix_out} ${path_ref}

done
 


