#!/bin/sh

set -e


python train.py --dataroot ../training_data_0.1  --name hsv_0.1 --model pix2pix --which_model_netG unet_256 --which_direction AtoB --lambda_A 100 --dataset_mode aligned --no_lsgan --norm batch --pool_size 0 --save_epoch_freq 50 
python train.py --dataroot ../training_data_0.2 --name hsv_0.2 --model pix2pix --which_model_netG unet_256 --which_direction AtoB --lambda_A 100 --dataset_mode aligned --no_lsgan --norm batch --pool_size 0 --save_epoch_freq 50 
python train.py --dataroot ../training_data_0.3 --name hsv_0.3 --model pix2pix --which_model_netG unet_256 --which_direction AtoB --lambda_A 100 --dataset_mode aligned --no_lsgan --norm batch --pool_size 0 --save_epoch_freq 50 

# Generate Results
python test.py --dataroot ../training_data_0.1 --name hsv_0.1 --model pix2pix --no_dropout --dataset_mode aligned --which_direction AtoB  --phase test --no_dropout --which_model_netD basic --which_model_netG unet_256 --norm batch
python test.py --dataroot ../training_data_0.2 --name hsv_0.2 --model pix2pix --no_dropout --dataset_mode aligned --which_direction AtoB  --phase test --no_dropout --which_model_netD basic --which_model_netG unet_256 --norm batch
python test.py --dataroot ../training_data_0.3 --name hsv_0.3 --model pix2pix --no_dropout --dataset_mode aligned --which_direction AtoB  --phase test --no_dropout --which_model_netD basic --which_model_netG unet_256 --norm batch

