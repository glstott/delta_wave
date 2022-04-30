#!/bin/bash
#SBATCH --job-name=iqtorf1ab
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=iqt-orf1ab.log

ml IQ-TREE

input_dir=/scratch/gs69042/delta_wave

cd $input_dir
iqtree2 -s orf1ab.aligned.merged.dedupe.fasta -p ref/partitions/orf1ab.txt -m GTR -pre treefiles/fullseq.iqt -nt 32
