#!/bin/sh
### Downloading reference and generating scripts
### qsub -W group_list=ssi_gen1 -A ssi_gen1 -l nodes=1:ppn=21,mem=100gb,walltime=99:00:00 get_reference.sh

module load tools
module load star/2.5.3a

cd /home/projects/ssi_gen1/data/pregnancy/reference
###wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_28/GRCh38.primary_assembly.genome.fa.gz
#wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_28/gencode.v28.primary_assembly.annotation.gtf.gz
###gzip -d GRCh38.primary_assembly.genome.fa.gz
###gzip -d gencode.v28.primary_assembly.annotation.gtf.gz

nohup STAR --runThreadN 20 --runMode genomeGenerate --genomeDir /home/projects/ssi_gen1/data/pregnancy/reference/ --genomeFastaFiles /home/projects/ssi_gen1/data/pregnancy/reference/GRCh38.primary_assembly.genome.fa --sjdbGTFfile /home/projects/ssi_gen1/data/pregnancy/reference/gencode.v28.primary_assembly.annotation.gtf --sjdbOverhang 100 




