#!/bin/bash
#SBATCH --account=fair_share
#SBATCH --mem=8000
#SBATCH --job-name=fasqc
#SBATCH --nodes=1
#SBATCH --error=/vol/cluster-data/rchen/git/ms_female_ltet/log/fastqc.err
#SBATCH --output=/vol/cluster-data/rchen/git/ms_female_ltet/log/fastqc.out
#SBATCH --mail-type=END
#SBATCH --mail-user=rebecca.chen@uni-bielefeld.de
# launch with: sbatch /vol/cluster-data/rchen/git/ms_female_ltet/scripts/1_genotyping/0_fastqc.sh

for file in /vol/cluster-data/rchen/git/ms_female_ltet/data/*fq.gz; 
do
    /vol/biotools/bin/fastqc $file --threads 8 -o /vol/cluster-data/rchen/git/ms_female_ltet/output/fastqc;
done
