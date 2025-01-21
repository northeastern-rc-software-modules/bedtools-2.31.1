#!/bin/bash

echo "Starting bedtools module test cases..."

# Create directories if they don't exist
mkdir -p output src

# Submit all test cases
echo "Submitting test case 1 - Module loading test"
sbatch testcase1_bedtools.sh

echo "Submitting test case 2 - Intersection test"
sbatch testcase2_bedtools.sh

echo "Submitting test case 3 - Genome coverage test"
sbatch testcase3_bedtools.sh

echo "All test cases submitted. Check output directory for results."

