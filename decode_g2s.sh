#!/bin/bash
#SBATCH --partition=gpu --gres=gpu:1 -C K80 --time=1:00:00 --output=decode.out --error=decode.err
#SBATCH --mem=10GB
#SBATCH -c 6

export PYTHONPATH=/home/sinhvtr/python/py27/bin/python

python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_selfatt_200k_50ep/G2S.silver \
        --in_path data/civilcode/civilcode_jurisin.json \
        --out_path model_g2s_selfatt_200k_50ep/civilcode_jurisin.txt \
        --mode beam
        
python src_s2s_trans/NP2P_beam_decoder.py --model_prefix model_s2s_transformer_200k_50ep/NP2P.silver\
        --in_path data/civilcode/civilcode_jurisin.json \
        --out_path model_s2s_transformer_200k_50ep/civilcode_jurisin.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_transformer_200k_50ep/civilcode_jurisin.s2s.pred

python src_s2s_trans/NP2P_beam_decoder.py --model_prefix model_s2s_transformer_50ep/NP2P.gold\
        --in_path data/civilcode/civilcode_jurisin.json \
        --out_path model_s2s_transformer_50ep/civilcode_jurisin.s2s \
        --mode beam

python scripts/s2s_postprocess.py -input model_s2s_transformer_50ep/civilcode_jurisin.s2s.pred

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_200k_50ep/G2S.silver \
        # --in_path data/test_node_20.json \
        # --out_path model_g2s_200k_50ep/test_node_20.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_200k_50ep/G2S.silver \
        # --in_path data/test_node_30.json \
        # --out_path model_g2s_200k_50ep/test_node_30.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_200k_50ep/G2S.silver \
        # --in_path data/test_node_40.json \
        # --out_path model_g2s_200k_50ep/test_node_40.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_200k_50ep/G2S.silver \
        # --in_path data/test_node_long.json \
        # --out_path model_g2s_200k_50ep/test_node_long.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_selfatt_200k_50ep/G2S.silver \
        # --in_path data/test_node_10.json \
        # --out_path model_g2s_selfatt_200k_50ep/test_node_10.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_selfatt_200k_50ep/G2S.silver \
        # --in_path data/test_node_20.json \
        # --out_path model_g2s_selfatt_200k_50ep/test_node_20.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_selfatt_200k_50ep/G2S.silver \
        # --in_path data/test_node_30.json \
        # --out_path model_g2s_selfatt_200k_50ep/test_node_30.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_selfatt_200k_50ep/G2S.silver \
        # --in_path data/test_node_40.json \
        # --out_path model_g2s_selfatt_200k_50ep/test_node_40.txt \
        # --mode beam

# python src_g2s/G2S_beam_decoder.py --model_prefix model_g2s_selfatt_200k_50ep/G2S.silver \
        # --in_path data/test_node_long.json \
        # --out_path model_g2s_selfatt_200k_50ep/test_node_long.txt \
        # --mode beam