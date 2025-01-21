#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bedtools_testcase_2
#SBATCH --output=output/testcase_2.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bedtools_testcase_2"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Creating test BED files"
echo -e "chr1\t100\t200\tfeature1\t1\t+" > output/test1.bed
echo -e "chr1\t150\t250\tfeature2\t2\t-" > output/test2.bed

echo "Step 2: Testing bedtools intersect functionality"
module load bedtools/2.31.1
bedtools intersect -a output/test1.bed -b output/test2.bed > output/intersection.bed

if [ -f output/intersection.bed ]; then
    echo "Step 2 Completed: Intersection operation successful"
    echo "Intersection results:"
    cat output/intersection.bed
else
    echo "Step 2 Failed: Intersection operation failed"
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"

