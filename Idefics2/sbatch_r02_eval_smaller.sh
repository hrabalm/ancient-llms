#!/bin/bash

#SBATCH -J eval
#SBATCH --account open-29-5
#SBATCH --partition qgpu
#SBATCH --gpus 1
#SBATCH --time 2:00:00

export HF_HOME="/mnt/proj2/open-29-5/mtm24-ancient/.cache/huggingface"
export HF_DATASETS_CACHE="/mnt/proj2/open-29-5/mtm24-ancient/.cache/huggingface/datasets"

source /mnt/proj2/open-29-5/wmt24-mirek/miniforge3/bin/activate "/mnt/proj2/open-29-5/mtm24-ancient/envs/idefics2"

python3 translate.py --model="./model-text-c2/checkpoint-2828" --mode="text" --input=./akkedian_ourtest.txt --output="text_c2__small_2828_128tokens.txt" --quantize --max-new-tokens=128 --batch-size=8

