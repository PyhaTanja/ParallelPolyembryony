#!/bin/bash -l
#SBATCH -J test_massive_burnin
#SBATCH --array=1-1000
#SBATCH -o Outs/output_%j.txt
#SBATCH -e Errors/errors_%j.txt
#SBATCH -p serial
#SBATCH -t 03:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=5000

module load r-env

name=$(sed -n "$SLURM_ARRAY_TASK_ID"p BurninParameters.txt)

echo $name

name2=$(echo $name | sed -e 's/ /_/g')
echo $name2

mkdir TestBurnIn$name2
cd TestBurnIn$name2

for i in {1..10}
do
	srun Rscript --no-save /proj/project_2000325/Polyembryony/BurnInMassiveTest.R $name $i
done