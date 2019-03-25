#!/bin/sh

### qsub -W group_list=ssi_gen1 -A ssi_gen1 -l nodes=1:ppn=1,mem=1gb,walltime=300:00:00 cat_raw_rna_batch2_lib2.sh

### Concatenating the raw rna files to just one fastq per sample (i.e. across different lanes of same library)

path_in=/home/projects/ssi_gen1/data/pregnancy/raw_rna/fastq_batch2
path_out=/home/projects/ssi_gen1/data/pregnancy/raw_rna_mod/fastq_batch2

lib=BP02

for ln in `ls ${path_in} | grep ${lib} `
do

echo $ln

for fqbase in `ls ${path_in}/$ln/ | grep -v unmatched | sed 's/_R1.fastq.gz//g' | sed 's/_R2.fastq.gz//g' | sort -u `
do

#echo $fqbase
bar=${fqbase: -17}

cat ${path_in}/${ln}/${fqbase}_R1.fastq.gz >> ${path_out}/${lib}_${bar}_R1.fastq.gz
cat ${path_in}/${ln}/${fqbase}_R2.fastq.gz >> ${path_out}/${lib}_${bar}_R2.fastq.gz

done
done



