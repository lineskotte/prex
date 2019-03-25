#!/bin/sh
# Combining initial STAR read count files

path_in=/home/projects/ssi_gen1/data/pregnancy/mapped_cat_gencode/batch2
path_out=/home/projects/ssi_gen1/data/pregnancy/read_counts_star/batch2

for smpl in `ls ${path_in}/ | grep ReadsPerGene | sed 's/ReadsPerGene.out.tab//g'` 
do
echo $smpl

echo $smpl > ${path_out}/${smpl}_tmp.txt
cut -f2 ${path_in}/${smpl}ReadsPerGene.out.tab >> ${path_out}/${smpl}_tmp.txt

done 

echo GENE_ID > ${path_out}/a_geneid_tmp.txt
cut -f1 ${path_in}/BP06_TCTCGCGC-TCAGAGCCReadsPerGene.out.tab >> ${path_out}/a_geneid_tmp.txt
paste ${path_out}/*_tmp.txt > ${path_out}/combined.txt

