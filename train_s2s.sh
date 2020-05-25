#!/bin/bash
#SBATCH -J AMR_s2s --partition=gpu --gres=gpu:1 --time=5-00:00:00 --output=train.out_s2s --error=train.err_s2s
#SBATCH --mem=15GB
#SBATCH -c 5

export PYTHONPATH=/home/sinhvtr/python/py27/bin/python

python src_s2s/NP2P_trainer.py --config_path config/config_s2s_200k_50ep.json

