#!/bin/bash
#SBATCH --partition=gpu --gres=gpu:1 --time=1:00:00 --output=decode.out --error=decode.err
#SBATCH --mem=10GB
#SBATCH -c 6

export PYTHONPATH=/home/sinhvtr/python/py27/bin/python

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_10.json \
        --out_path model_s2s_200k_50ep/test_10.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_10.s2s.pred

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_20.json \
        --out_path model_s2s_200k_50ep/test_20.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_20.s2s.pred

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_40.json \
        --out_path model_s2s_200k_50ep/test_40.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_40.s2s.pred

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_60.json \
        --out_path model_s2s_200k_50ep/test_60.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_60.s2s.pred

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_80.json \
        --out_path model_s2s_200k_50ep/test_80.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_80.s2s.pred

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_100.json \
        --out_path model_s2s_200k_50ep/test_100.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_100.s2s.pred

python src_s2s/NP2P_beam_decoder.py --model_prefix model_s2s_200k_50ep/NP2P.silver\
        --in_path data/test_long.json \
        --out_path model_s2s_200k_50ep/test_long.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_200k_50ep/test_long.s2s.pred