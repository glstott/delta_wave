#!/bin/bash
#SBATCH --job-name=mafft
#SBATCH --partition=batch
#SBATCH --ntasks=64
#SBATCH --mem=64G
#SBATCH --time=6:00:00
#SBATCH --output=mafft2.log

ml  MAFFT

input_dir=/scratch/gs69042/delta_wave

cd $input_dir
mafft --6merpair --thread 64 --keeplength --addfragments data/others/random.fasta ref/wuhan.fasta > fullseq.aligned.fasta
mafft --6merpair --thread 64 --keeplength --addlong data/others/random.fasta ref/spikeRef.fasta > spike.others.aligned.fasta
mafft --6merpair --thread 64 --keeplength --addlong data/others/random.fasta ref/orf1abRef.fasta > orf1ab.others.aligned.fasta


mafft --6merpair --thread 64 --keeplength --addfragments data/combined.fasta ref/wuhan.fasta > fullseq.random.aligned.fasta
mafft --6merpair --thread 64 --keeplength --addlong data/combined.fasta ref/spikeRef.fasta > spike.aligned.fasta
mafft --6merpair --thread 64 --keeplength --addlong data/combined.fasta ref/orf1abRef.fasta > orf1ab.aligned.fasta

