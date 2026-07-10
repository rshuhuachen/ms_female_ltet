#!/bin/bash
#SBATCH --account=fair_share
#SBATCH --mem=12000
#SBATCH --job-name=snpcall
#SBATCH --nodes=1
#SBATCH --error=log/snpcall.err
#SBATCH --output=log/snpcall.out
#SBATCH --mail-type=END
#SBATCH --mail-user=rebecca.chen@uni-bielefeld.de
# launch with: sbatch scripts/1_genotyping/2_snpcall.sh

#printf "%s\n" /vol/cluster-data/rchen/git/ms_female_ltet/output/processed/*sorted.bam > output/list_bamfiles_females.txt
bcftools mpileup -f /vol/cluster-data/rchen/annotation/PO2979_Lyrurus_tetrix_black_grouse.RepeatMasked.fasta -a DP -C 50 -q 20 -b output/list_bamfiles_females.txt -I --threads 12 | bcftools call -Ov -v -m -o output/processed/ltet_female.vcf
