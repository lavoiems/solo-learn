#!/bin/bash

module load python/3.8
source env/bin/activate

cp -r datasets $SLURM_TMPDIR

python ../../../main_pretrain.py \
    --dataset cifar100 \
    --checkpoint_dir /network/scratch/l/lavoiems/baselines \
    --backbone resnet18 \
    --data_dir $SLURM_TMPDIR/datasets \
    --max_epochs 1000 \
    --gpus 0 \
    --accelerator gpu \
    --precision 16 \
    --optimizer sgd \
    --lars \
    --grad_clip_lars \
    --eta_lars 0.02 \
    --exclude_bias_n_norm \
    --scheduler warmup_cosine \
    --lr 0.3 \
    --weight_decay 1e-4 \
    --batch_size 256 \
    --num_workers 4 \
    --brightness 0.4 \
    --contrast 0.4 \
    --saturation 0.2 \
    --hue 0.1 \
    --gaussian_prob 0.0 0.0 \
    --solarization_prob 0.0 0.2 \
    --crop_size 32 \
    --num_crops_per_aug 1 1 \
    --name sdbarlow \
    --project iclr \
    --entity il_group \
    --wandb \
    --save_checkpoint \
    --method sdbarlow \
    --proj_hidden_dim 2048 \
    --proj_output_dim 2048 \
    --scale_loss 0.1 \
    --voc_size 13 \
    --message_size 5000 \
    --tau_online 1. \
    --tau_target 0.99
