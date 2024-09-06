#!/bin/bash

#SBATCH -J eval
#SBATCH --account open-29-5
#SBATCH --partition qgpu
#SBATCH --gpus 1
#SBATCH --time 1:00:00

export HF_HOME="/mnt/proj2/open-29-5/mtm24-ancient/.cache/huggingface"
export HF_DATASETS_CACHE="/mnt/proj2/open-29-5/mtm24-ancient/.cache/huggingface/datasets"

source /mnt/proj2/open-29-5/wmt24-mirek/miniforge3/bin/activate "/mnt/proj2/open-29-5/mtm24-ancient/envs/idefics2"

python3 translate.py --model="./model-text/checkpoint-5658" --mode="text" --input=./akkadian_test.txt --output="model-text_5658.mnt=128.txt" --max-new-tokens=128

