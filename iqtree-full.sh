#!/bin/bash
#SBATCH --job-name=iqtFull
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=iqt-full.log

ml IQ-TREE

input_dir=/scratch/gs69042/delta_wave

cd $input_dir
iqtree2 -s fullseq.aligned.merged.dedupe.fasta -p ref/partitions/full.txt -m GTR -pre treefiles/fullseq.iqt -nt 32
