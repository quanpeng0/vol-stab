#!/bin/bash

## step 0: preprocess the data 
python m0_preprocess.py

## declare all models and all data sets
declare data_sets=("exp1_rew")
declare groups=("ind")
declare models=("RDModel2_exp2")

## step 1: fit the model
for data_set in "${data_sets[@]}"; do 
    for group in "${groups[@]}"; do 
        for model in "${models[@]}"; do 
            echo Data set=$data_set Group=$group Model=$model 
                python m1_fit.py -d=$data_set -n=$model -s=420 -f=40 -c=40 -l='mle' -g=$group
                #python m2_simulate.py -d=$data_set -n=$model
        done 
    done
done
