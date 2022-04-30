#!/bin/bash
#SBATCH --job-name=iqtspike
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=iqt-spike.log

ml IQ-TREE

input_dir=/scratch/gs69042/delta_wave

cd $input_dir
iqtree2 -s spike.aligned.merged.dedupe.fasta -p ref/partitions/spike.txt -m GTR -pre treefiles/spike.iqt -nt 32
