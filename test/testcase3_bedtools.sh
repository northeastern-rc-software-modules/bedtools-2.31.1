#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bedtools_testcase_3
#SBATCH --output=output/testcase_3.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bedtools_testcase_3"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Creating test BED file for genome coverage"
echo -e "chr1\t100\t200\n chr1\t150\t250\n chr2\t100\t200" > output/test.bed
echo -e "chr1\t1000\nchr2\t1000" > output/genome.txt

echo "Step 2: Testing bedtools genomecov functionality"
module load bedtools/2.31.1
bedtools genomecov -i output/test.bed -g output/genome.txt > output/coverage.txt

if [ -f output/coverage.txt ]; then
    echo "Step 2 Completed: Genome coverage calculation successful"
    echo "Coverage results:"
    cat output/coverage.txt
else
    echo "Step 2 Failed: Genome coverage calculation failed"
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"

