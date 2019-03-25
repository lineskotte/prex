#!/bin/sh

### qsub -W group_list=ssi_gen1 -A ssi_gen1 -l nodes=1:ppn=1,mem=10gb,walltime=300:00:00 cat_raw_rna_batch1_lib4.sh

### Concatenating the raw rna files to just one fastq per sample (i.e. across different lanes of same library)

path_in=/home/projects/ssi_gen1/data/pregnancy/raw_rna/fastq_batch1
path_out=/home/projects/ssi_gen1/data/pregnancy/raw_rna_mod/fastq_batch1

#for lib in PINE_DEN15_01 PINE_DEN15_02 PINE_DEN15_03 PINE_DEN15_04
#do

lib=PINE_DEN15_04

for ln in `ls ${path_in}/${lib}/`
do

for fqbase in `ls ${path_in}/${lib}/$ln/ | grep -v unmatched | sed 's/_R1_001.fastq.gz//g' | sed 's/_R2_001.fastq.gz//g' | sort -u `
do

echo $fqbase
bar=${fqbase:6:17}

cat ${path_in}/${lib}/${ln}/${fqbase}_R1_001.fastq.gz >> ${path_out}/${lib}_${bar}_R1.fastq.gz
cat ${path_in}/${lib}/${ln}/${fqbase}_R2_001.fastq.gz >> ${path_out}/${lib}_${bar}_R2.fastq.gz

done

done

#done
