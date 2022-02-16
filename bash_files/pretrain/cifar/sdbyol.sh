python3 ../../../main_pretrain.py \
    --dataset $1 \
    --backbone resnet18 \
    --checkpoint_dir $2 \
    --data_dir $SLURM_TMPDIR/data \
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
    --lr 1.0 \
    --classifier_lr 0.03 \
    --weight_decay 1e-6 \
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
    --name sdbyol-$1 \
    --wandb \
    --entity il-group \
    --project VIL \
    --save_checkpoint \
    --method sdbyol \
    --proj_output_dim 256 \
    --proj_hidden_dim 2048 \
    --pred_hidden_dim 2048 \
    --base_tau_momentum 0.99 \
    --final_tau_momentum 1.0 \
    --voc_size 12 \
    --message_size 195 \
    --min_lr 0.1 \
    --tau_online 1.1 \
    --tau_target 1.1 \
    --momentum_classifier

    #--proj_hidden_dim 4096 \
    #--pred_hidden_dim 4096 \